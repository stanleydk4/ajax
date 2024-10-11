package com.systex.hw4.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.systex.hw4.model.Users;
import com.systex.hw4.model.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public boolean register(Users user) {
        if (userRepository.findByUsername(user.getUsername()) != null) {
            return false;
        }
        userRepository.save(user);
        return true;
    }

    public boolean login(String username, String password) {
        Users user = userRepository.findByUsername(username);
        return user != null && user.getPassword().equals(password);
    }
}