package com.deltaairline.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.deltaairline.entity.User;
import com.deltaairline.repository.UserRepository;

@Controller
public class UserController {

    @Autowired
    UserRepository userRepo;

    @GetMapping("/register")
    public String registerPage() {

        return "register";
    }

    @PostMapping("/saveUser")
    public String saveUser(User user) {

        user.setRole("USER");

        userRepo.save(user);

        return "redirect:/login";
    }

}