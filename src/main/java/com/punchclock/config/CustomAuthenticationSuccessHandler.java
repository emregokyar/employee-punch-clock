package com.punchclock.config;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        boolean isRegularUser = authentication.getAuthorities().stream().anyMatch(
                role -> role.getAuthority().equals("regular"));
        boolean isAdmin = authentication.getAuthorities().stream().anyMatch(
                role -> role.getAuthority().equals("admin"));
        if (isAdmin) response.sendRedirect("/dashboard");
        if (isRegularUser) response.sendRedirect("/home");
    }
}
