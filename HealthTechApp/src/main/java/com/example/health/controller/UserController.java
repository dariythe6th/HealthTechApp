package com.example.health.controller;

import com.example.health.model.User;
import com.example.health.repository.UserRepository;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/user")
@CrossOrigin(origins = "*")
public class UserController {

    private final UserRepository repo;

    public UserController(UserRepository repo) {
        this.repo = repo;
    }

    @PostMapping("/register")
    public String register(@RequestBody User user) {
        if (repo.existsById(user.getUsername())) {
            return "User already exists";
        }
        repo.save(user);
        return "Registration successful";
    }

    @PostMapping("/login")
    public String login(@RequestBody User user) {
        User found = repo.findByUsernameAndPassword(user.getUsername(), user.getPassword());
        return found != null ? "Login successful" : "Invalid credentials";
    }
}
