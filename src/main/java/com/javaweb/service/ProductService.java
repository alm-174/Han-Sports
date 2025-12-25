package com.javaweb.service;


import com.javaweb.domain.Product;
import com.javaweb.repository.ProductRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> fetchAllProducts()
    {
        return productRepository.findAll();
    }

    public void handleSaveProduct(Product product)
    {
        this.productRepository.save(product);
    }

    public Optional<Product> fetchProductById(long id)
    {
        return this.productRepository.findById(id);
    }

    public void deleteProductById(long id)
    {
        this.productRepository.deleteById(id);
    }

}
