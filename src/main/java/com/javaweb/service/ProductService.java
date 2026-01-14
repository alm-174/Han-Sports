package com.javaweb.service;


import com.javaweb.domain.Cart;
import com.javaweb.domain.CartDetail;
import com.javaweb.domain.Product;
import com.javaweb.domain.User;
import com.javaweb.repository.CartDetailRepository;
import com.javaweb.repository.CartRepository;
import com.javaweb.repository.ProductRepository;
import org.springframework.stereotype.Service;

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

    public void hanldeAddProductToCart(String email, long productId) {
        //check đã có user hay chưa
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                //tao moi cart
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(1);
                cart = this.cartRepository.save(otherCart);
            }

            //save cartDetail
            Optional<Product> p = this.productRepository.findById(productId);

            if (p.isPresent()) {
                Product realProduct = p.get();
                CartDetail cd = new CartDetail();
                cd.setCart(cart);
                cd.setProduct(realProduct);
                cd.setPrice(realProduct.getPrice());
                cd.setQuantity(1);
                this.cartDetailRepository.save(cd);
            }

        }
    }


}
