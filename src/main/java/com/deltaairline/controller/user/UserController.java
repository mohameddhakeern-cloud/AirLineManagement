package com.deltaairline.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.deltaairline.entity.User;
import com.deltaairline.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserRepository userRepo;

    @GetMapping("/register")
    public String registerPage() {
        return "user/register";
    }

    @GetMapping("/login")
    public String loginPage() {
        return "user/login";
    }

    @PostMapping("/saveUser")
    public String saveUser(User user) {

        user.setRole("USER");

        userRepo.save(user);

        return "redirect:/user/login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email,
                        @RequestParam String password,
                        HttpSession session) {

        User user = userRepo.findByEmailAndPassword(email, password);

        if(user != null) {

            session.setAttribute("loggedUser", user);

            return "redirect:/user/home";
        }

        return "user/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {

        session.invalidate();

        return "redirect:/user/login";
    }

}