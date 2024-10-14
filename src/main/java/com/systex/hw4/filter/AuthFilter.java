package com.systex.hw4.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.systex.hw4.model.UserRepository;
import com.systex.hw4.service.UserService;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class AuthFilter implements Filter {
	
	@Autowired
    private UserService userService;
	
	private static final List<String> whitelist = Arrays.asList("/hw4/login", "/hw4/register", "/hw4/ajaxLogin");

	@Autowired
    public AuthFilter(UserService userService) {
        this.userService = userService;
    }
	
	@Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/json;charset=UTF-8");
		//System.out.println("start");
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();
        
        //System.out.println("UserService: " + userService);檢驗DI
        
        String uri = httpRequest.getRequestURI();
        
        if (whitelist.contains(uri)) {
        	if ("/hw4/ajaxLogin".equals(uri) && "POST".equalsIgnoreCase(httpRequest.getMethod())) {
        		doAjaxLogin(httpRequest, httpResponse, session);
                return;
            }
            chain.doFilter(request, response);
            return;
        }
        
        
        String username = (String) session.getAttribute("username");
        if (username != null) {
            chain.doFilter(request, response);
            return;
        }

        httpResponse.sendRedirect("/hw4/login?error=loginRequired");     
        //chain.doFilter(request, response);
    }
	
	private void doAjaxLogin(HttpServletRequest httpRequest, HttpServletResponse httpResponse, HttpSession session)
            throws IOException {
        String username = httpRequest.getParameter("username");
        String password = httpRequest.getParameter("password");

        Map<String, Object> responseMap = new HashMap<>();
        PrintWriter out = httpResponse.getWriter();
        
        if (username == null || username.trim().isEmpty() ||
                password == null || password.trim().isEmpty()) {
                responseMap.put("isSuccess", false);
                responseMap.put("message", "帳號和密碼不能為空白。");
                out.write(new ObjectMapper().writeValueAsString(responseMap));
                out.flush();
                return;
        }
        //System.out.println("Login Result: "+userService.login(username, password));
        if (userService.login(username, password)) {
            session.setAttribute("username", username);
            responseMap.put("isSuccess", true);
        } else {
            responseMap.put("isSuccess", false);
            responseMap.put("message", "輸入的帳號密碼錯誤");
        }

        out.write(new ObjectMapper().writeValueAsString(responseMap));
        out.flush();
    }
}