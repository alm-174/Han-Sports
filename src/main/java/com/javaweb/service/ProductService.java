package com.javaweb.service;


import com.javaweb.domain.*;
import com.javaweb.repository.*;
import com.javaweb.service.specification.ProductSpecs;
import jakarta.servlet.http.HttpSession;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;


import java.util.List;
import java.util.Optional;

@Service
public class ProductService {
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final ProductRepository productRepository;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public ProductService(CartRepository cartRepository, CartDetailRepository cartDetailRepository, UserService userService, ProductRepository productRepository, OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
        this.productRepository = productRepository;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public List<Product> fetchAllProducts() {
        return productRepository.findAll();
    }




    public Page<Product> fetchAllProducts(Pageable page) {
        return productRepository.findAll(page);
    }
    public Page<Product> fetchAllProductsWithSpec(Pageable page, String name) {
        return productRepository.findAll(ProductSpecs.nameLike(name), page);
    }






//    // case 5
//    public Page<Product> fetchProductsWithSpec(Pageable page, String price) {
//        // eg: price 10-toi-15-trieu
//        if (price.equals("10-toi-15-trieu")) {
//            double min = 10000000;
//            double max = 15000000;
//            return this.productRepository.findAll(ProductSpecs.matchPrice(min, max),
//                    page);
//
//        } else if (price.equals("15-toi-30-trieu")) {
//            double min = 15000000;
//            double max = 30000000;
//            return this.productRepository.findAll(ProductSpecs.matchPrice(min, max),
//                    page);
//        } else
//            return this.productRepository.findAll(page);
//    }
//    // case 6
//    public Page<Product> fetchAllProductsWithSpec(Pageable page, List<String> price) {
//        Specification<Product> combinedSpec = (root, query, criteriaBuilder) -> criteriaBuilder.disjunction();
//        int count = 0;
//        for (String p : price) {
//            double min = 0;
//            double max = 0;
//
//            // Set the appropriate min and max based on the price range string
//            switch (p) {
//                case "10-toi-15-trieu":
//                    min = 10000000;
//                    max = 15000000;
//                    count++;
//                    break;
//                case "15-toi-20-trieu":
//                    min = 15000000;
//                    max = 20000000;
//                    count++;
//                    break;
//                case "20-toi-30-trieu":
//                    min = 20000000;
//                    max = 30000000;
//                    count++;
//                    break;
//                // Add more cases as needed
//            }
//
//            if (min != 0 && max != 0) {
//                Specification<Product> rangeSpec = ProductSpecs.matchMultiplePrice(min, max);
//                combinedSpec = combinedSpec.or(rangeSpec);
//            }
//        }
//
//        // Check if any price ranges were added (combinedSpec is empty)
//        if (count == 0) {
//            return this.productRepository.findAll(page);
//        }
//
//        return this.productRepository.findAll(combinedSpec, page);
//    }

    public void handleSaveProduct(Product product) {
        this.productRepository.save(product);
    }

    public Optional<Product> fetchProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProductById(long id) {
        this.productRepository.deleteById(id);
    }

    public void hanldeAddProductToCart(String email, long productId, HttpSession session) {
        //check đã có user hay chưa
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                //tao moi cart
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);
                cart = this.cartRepository.save(otherCart);
            }

            //save cartDetail
            Optional<Product> p = this.productRepository.findById(productId);

            if (p.isPresent()) {
                Product realProduct = p.get();

                //check san pham co trong gio hang chua
                CartDetail oldCD = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);

                if (oldCD == null) {
                    CartDetail cd = new CartDetail();
                    cd.setCart(cart);
                    cd.setProduct(realProduct);
                    cd.setPrice(realProduct.getPrice());
                    cd.setQuantity(1);
                    this.cartDetailRepository.save(cd);

                    //update sum
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } else {
                    oldCD.setQuantity(oldCD.getQuantity() + 1);
                    this.cartDetailRepository.save(oldCD);
                }


            }

        }
    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartDetail(long id, HttpSession session) {

        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(id);
        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();

            Cart currentCart = cartDetail.getCart();
            // delete cart-detail
            this.cartDetailRepository.deleteById(id);

            // update cart
            if (currentCart.getSum() > 1) {
                // update current cart
                int s = currentCart.getSum() - 1;
                currentCart.setSum(s);
                session.setAttribute("sum", s);
                this.cartRepository.save(currentCart);
            } else {
                // delete cart (sum = 1)
                this.cartRepository.deleteById(currentCart.getId());
                session.setAttribute("sum", 0);
            }
        }
    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails){
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);
            }
        }
    }

    public void handlePlaceOrder(User user, HttpSession session, String receiverName, String receiverAddress, String receiverPhone) {


        //get cart
        Cart cart = this.cartRepository.findByUser(user);
        if(cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();

            if(cartDetails != null) {
                // create order
                Order order = new Order();
                order.setUser(user);
                order.setReceiverName(receiverName);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverPhone(receiverPhone);
                order.setStatus("PENDING");

                double sum = 0;
                for (CartDetail cd : cartDetails) {
                    sum += cd.getPrice();
                }
                order.setTotalPrice(sum);
                order = this.orderRepository.save(order);

                // create orderDetail

                for(CartDetail cartDetail : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cartDetail.getProduct());
                    orderDetail.setPrice(cartDetail.getPrice());
                    orderDetail.setQuantity(cartDetail.getQuantity());
                    this.orderDetailRepository.save(orderDetail);
                }
                //delete cart
                for(CartDetail cartDetail : cartDetails) {
                    this.cartDetailRepository.deleteById(cartDetail.getId());
                }
                this.cartRepository.deleteById(cart.getId());

                //update sum
                session.setAttribute("sum", 0);
            }



        }
    }

}
