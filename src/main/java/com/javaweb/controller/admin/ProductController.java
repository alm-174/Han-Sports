package com.javaweb.controller.admin;

import com.javaweb.domain.Product;
import com.javaweb.service.ProductService;
import com.javaweb.service.UploadService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;
    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getProductPage(Model model){
        List<Product> products = this.productService.fetchAllProducts();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model){
        model.addAttribute("newProduct", new Product());
        return  "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String postCreateProduct(Model model, @ModelAttribute("newProduct") @Valid Product newProduct,
                                    BindingResult newProductBindingResult,
                                    @RequestParam("imageFile")MultipartFile file){
        if(newProductBindingResult.hasErrors()){
            return "admin/product/create";
        }


        String image = this.uploadService.HandleSaveUpLoadFile(file, "products");
        newProduct.setImage(image);
        this.productService.handleSaveProduct(newProduct);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductPage(Model model, @PathVariable long id){
        Optional<Product> product = this.productService.fetchProductById(id);
        if(product.isPresent()){
            model.addAttribute("product", product.get());
            model.addAttribute("id", id);
        }
        return  "admin/product/detail";
    }



    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(@PathVariable long id, Model model){
        Optional<Product> optinalProduct = this.productService.fetchProductById(id);
        if(optinalProduct.isPresent()){
            Product product = optinalProduct.get();
            model.addAttribute("id", id);
            model.addAttribute("newProduct", product);
        }
        return  "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateProduct(Model model, @ModelAttribute("newProduct") @Valid Product newProduct,
                                    BindingResult newProductBindingResult,
                                    @RequestParam("imageFile") MultipartFile file){
        if(newProductBindingResult.hasErrors()){
            return "admin/product/update";
        }


        String image = this.uploadService.HandleSaveUpLoadFile(file, "products");
        Optional<Product> optinalProduct = this.productService.fetchProductById(newProduct.getId());
        if(optinalProduct.isPresent()){
            if(!image.equals("")){
                newProduct.setImage(image);
            }
            this.productService.handleSaveProduct(newProduct);
        }
    return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProduct(@PathVariable long id, Model model){
        Optional<Product> optinalProduct = this.productService.fetchProductById(id);
        if(optinalProduct.isPresent()){
            Product product = optinalProduct.get();
            model.addAttribute("id", id);
            model.addAttribute("newProduct", product);
        }
        return  "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(Model model, @ModelAttribute("newProduct") Product newProduct){
        this.productService.deleteProductById(newProduct.getId());
        return "redirect:/admin/product";
    }


}
