package com.javaweb.controller.admin;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

public class OrderController {
    @GetMapping("/admin/order")
    public String getOrderPage(Model model){
        return "admin/order/show";
    }
}
