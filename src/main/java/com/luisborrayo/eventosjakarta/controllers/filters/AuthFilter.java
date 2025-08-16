package com.luisborrayo.eventosjakarta.controllers.filters;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        String uri = req.getRequestURI();

        boolean publica = uri.endsWith("/index.jsp") ||  uri.endsWith("/login.jsp") || uri.endsWith("/registro.jsp") || uri.contains("/auth/login") || uri.endsWith("/");

        if (publica) {
            chain.doFilter(request, response);
            return;
        }
        if (session != null && Boolean.TRUE.equals(session.getAttribute("auth"))) {
            chain.doFilter(request, response);
        }else {
            res.sendRedirect(req.getContextPath() + "/login.jsp");
        }
    }
}
