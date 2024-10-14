package com.systex.hw4.controller;

import java.net.http.HttpResponse;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.systex.hw4.model.Users;
import com.systex.hw4.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;
    
    @GetMapping("/login")
    public String showLoginPage() {
        return "loginUser";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, Model model,HttpSession session) {
        if (userService.login(username, password)) {
        	session.setAttribute("username", username);
            model.addAttribute("username", username);
            return "redirect:/protected/index";
        } else {
            model.addAttribute("error", "輸入的帳號密碼錯誤");
            return "loginUser";
        }
    }

    @GetMapping("/register")
    public String showRegisterPage() {
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute Users user, Model model,RedirectAttributes redirectAttributes) {
    	if (user.getUsername() == null || user.getUsername().trim().isEmpty() ||
    	        user.getPassword() == null || user.getPassword().trim().isEmpty()) {
    	        model.addAttribute("error", "帳號和密碼不能為空白。");
    	        return "register";
    	}
    	
    	if (userService.register(user)) {
        	//model.addAttribute("error", "註冊成功!");
            //return "redirect:/login";
        	return "redirect:/login?error=regiSuccess";
        } else {
            model.addAttribute("error", "帳號名稱已被使用");
            return "register";
        }
    }
    
    @GetMapping("/protected/index")
    public String index(HttpSession session, RedirectAttributes redirectAttributes) {
        if (session.getAttribute("username") == null) {
            return "redirect:/login";
        }
        return "/protected/index";
    }
    
    @GetMapping("/protected/main")
    public String showMainPage(HttpSession session) {
        if (session.getAttribute("username") == null) {
            return "redirect:/login";
        }
        return "protected/main";
    }
    
    @GetMapping("/protected/resultLottery")
    public String showResultPage(HttpSession session) {
        if (session.getAttribute("username") == null) {
            return "redirect:/login";
        }
        return "protected/resultLottery";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
    @GetMapping("/ajaxLogin")
    public String ajaxLogin(HttpSession session) {
        return "ajaxLogin";
    }
    
    
    /*@PostMapping("/ajaxLogin")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> ajaxLogin(@RequestParam String username, @RequestParam String password, Model model,HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        //System.out.println(123);
        if (userService.login(username, password)) {
        	session.setAttribute("username", username);
            response.put("success", true);
            return ResponseEntity.ok(response);
        } else {
            response.put("success", false);
            response.put("message", "輸入的帳號密碼錯誤");
            return ResponseEntity.ok(response);
        }
    }*/
}
