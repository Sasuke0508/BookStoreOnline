package com.ptit.bookstore.bookstoreonline.businesslogic.controller;

import com.ptit.bookstore.bookstoreonline.model.enumaration.Role;
import com.ptit.bookstore.bookstoreonline.model.user.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "CustomerFilter", urlPatterns = {"/cart/*", "/order/*", "/checkout/*"})
public class CustomerFilter implements  Filter{
        public void init(FilterConfig config) throws ServletException {
        }

        public void destroy() {
        }

        @Override
        public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
            HttpServletRequest request1 = (HttpServletRequest) request;
            HttpServletResponse response1 = (HttpServletResponse) response;
            HttpSession session = request1.getSession();
            User user = (User) session.getAttribute("user");
            if (user != null && user.getRole() == Role.Customer) {
                chain.doFilter(request, response);
            } else {
                response1.sendRedirect(((HttpServletRequest) request).getContextPath() + "/"); //
            }
        }
}
