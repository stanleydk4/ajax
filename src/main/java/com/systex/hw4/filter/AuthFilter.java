package com.systex.hw4.filter;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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

	@Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
		
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();
        
        /*if (session == null || session.getAttribute("username") == null) {
            httpResponse.sendRedirect("/hw4/login?error=loginRequired");     
            return;
        }*/
        if (session == null || session.getAttribute("username") == null) {
	        if (httpRequest.getRequestURI().equals("/hw4/login") && httpRequest.getMethod().equals("POST")) {
	            String username = httpRequest.getParameter("username");
	            String password = httpRequest.getParameter("password");
	
	            if (userService.login(username, password)) {
	                session.setAttribute("username", username);
	                httpResponse.sendRedirect("/hw4/protected/index");
	                return;
	            } else {
	                httpResponse.sendRedirect("/hw4/login?error=invalidCredentials");
	                return;
	            }
	        } else {
	            httpResponse.sendRedirect("/hw4/login?error=loginRequired");
	            return;
	        }
        }

        
        chain.doFilter(request, response);
    }
}