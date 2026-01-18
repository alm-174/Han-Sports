package com.javaweb.controller.admin;

import com.javaweb.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashBoardController {

    private UserService userService;
    public  DashBoardController(UserService userService) {
        this.userService = userService;
    }


    @GetMapping("/admin")
    public String admin(Model model) {

        model.addAttribute("countUsers", userService.countUsers());
        model.addAttribute("countProducts", userService.countProducts());
        model.addAttribute("countOrders", userService.countOrders());
        return "admin/dashboard/show";
    }
}
