package com.javaweb.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomePageController {
    @GetMapping("/")
    public String homePage() {
        return "/client/homepage/show";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        return "/client/auth/register";
    }

}
