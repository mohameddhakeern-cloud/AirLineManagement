package com.deltaairline.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.deltaairline.entity.User;
import com.deltaairline.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserProfileController {

    @Autowired
    private UserRepository userRepo;

    @GetMapping("/profile")
    public String profile(HttpSession session,
                          Model model) {

        User user = (User) session.getAttribute("loggedUser");

        if(user == null)
            return "redirect:/user/login";

        model.addAttribute("user", user);

        return "user/profile";
    }

    @PostMapping("/updateProfile")
    public String updateProfile(User updatedUser,
                                HttpSession session) {

        User user = (User) session.getAttribute("loggedUser");

        if(user == null)
            return "redirect:/user/login";

        user.setName(updatedUser.getName());
        user.setEmail(updatedUser.getEmail());
        user.setPassword(updatedUser.getPassword());

        userRepo.save(user);

        session.setAttribute("loggedUser", user);

        return "redirect:/user/profile";
    }

}