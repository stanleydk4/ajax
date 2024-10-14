package com.systex.hw4;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.Bean;

import com.systex.hw4.filter.AuthFilter;
import com.systex.hw4.service.UserService;

@ServletComponentScan
@SpringBootApplication
public class Hw4Application {

	public static void main(String[] args) {
		SpringApplication.run(Hw4Application.class, args);
	}
	
	   @Bean
	    public FilterRegistrationBean<AuthFilter> authFilter(UserService userService) {
		    AuthFilter authFilter = new AuthFilter(userService);
	        FilterRegistrationBean<AuthFilter> registrationBean = new FilterRegistrationBean<>(authFilter);
	        registrationBean.addUrlPatterns("/*");
	        
	        return registrationBean;
	    }

}
