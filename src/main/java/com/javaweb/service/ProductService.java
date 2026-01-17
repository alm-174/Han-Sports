package com.javaweb.service;


import com.javaweb.domain.Cart;
import com.javaweb.domain.CartDetail;
import com.javaweb.domain.Product;
import com.javaweb.domain.User;
import com.javaweb.repository.CartDetailRepository;
import com.javaweb.repository.CartRepository;
import com.javaweb.repository.ProductRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Service;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;

@Service
public class ProductService {
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final ProductRepository productRepository;

    public ProductService(CartRepository cartRepository, CartDetailRepository cartDetailRepository, UserService userService, ProductRepository productRepository) {
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
        this.productRepository = productRepository;
    }

    public List<Product> fetchAllProducts() {
        return productRepository.findAll();
    }

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

}
