package com.javaweb.controller.admin;

import com.javaweb.domain.User;
import com.javaweb.service.UploadService;
import com.javaweb.service.UserService;

import jakarta.validation.Valid;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import java.util.List;
import java.util.Optional;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UploadService uploadService, UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }


    @GetMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> listUsers = this.userService.findAll();
        model.addAttribute("users", listUsers);
        return "admin/user/show";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String handleCreateUser(@ModelAttribute("newUser") @Valid User user,
                                   BindingResult newUserBindingResult,
                                   @RequestParam("avatarFile") MultipartFile file) {


        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        String avatar = this.uploadService.HandleSaveUpLoadFile(file, "avatars");
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(hashPassword);
        user.setAvatar(avatar);
        user.setRole(this.userService.getRoleByName(user.getRole().getName()));
        this.userService.createUser(user);
        return "redirect:/admin/user";
    }

    @GetMapping("admin/user/{id}")
    public String getDetailUserPage(@PathVariable("id") long id, Model model) {
        Optional<User> optionalUser = this.userService.fetchUserById(id);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            model.addAttribute("id", id);
            model.addAttribute("user", user);
        }
        return "admin/user/detail";
    }

    @GetMapping("admin/user/update/{id}")
    public String getUpdateUserPage(@PathVariable("id") long id, Model model) {
        Optional<User> optionalUser = this.userService.fetchUserById(id);
        if (optionalUser.isPresent()) {
            User currentUser = optionalUser.get();
            model.addAttribute("newUser", currentUser);

        }
        return "admin/user/update";
    }

    @PostMapping("admin/user/update")
    public String handleUpdateUser(@ModelAttribute("newUser") @Valid User currentUser,
                                   BindingResult newProductBindingResult,
                                   Model model,
                                   @RequestParam("avatarFile") MultipartFile file) {
        if (newProductBindingResult.hasErrors()) {
            return "admin/user/update";
        }

        String avatar = this.uploadService.HandleSaveUpLoadFile(file, "avatars");
        Optional<User> optionalUser = this.userService.fetchUserById(currentUser.getId());
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            if(!avatar.equals("")){
                user.setAvatar(avatar);
            }
            user.setPhone(currentUser.getPhone());
            user.setEmail(currentUser.getEmail());
            user.setRole(this.userService.getRoleByName(currentUser.getRole().getName()));
            user.setFullName(currentUser.getFullName());
            user.setAddress(currentUser.getAddress());
            this.userService.handleSaveUser(user);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("admin/user/delete/{id}")
    public String getDeleteUserPage(@PathVariable("id") long id, Model model) {
        Optional<User> optionalUser = this.userService.fetchUserById(id);
        if (optionalUser.isPresent()) {
            User currentUser = optionalUser.get();
            model.addAttribute("newUser", currentUser);

        }
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String handleDeleteUser(Model model, @ModelAttribute("newUser") User user) {
        this.userService.handleDeleteUserById(user.getId());
        return "redirect:/admin/user";
    }

}
