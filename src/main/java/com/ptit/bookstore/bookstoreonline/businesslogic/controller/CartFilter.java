package com.ptit.bookstore.bookstoreonline.businesslogic.controller;

import com.ptit.bookstore.bookstoreonline.businesslogic.orderDAO.CartDAOImp;
import com.ptit.bookstore.bookstoreonline.businesslogic.orderDAO.ICartDAO;
import com.ptit.bookstore.bookstoreonline.model.enumaration.Role;
import com.ptit.bookstore.bookstoreonline.model.order.Cart;
import com.ptit.bookstore.bookstoreonline.model.order.CartDetail;
import com.ptit.bookstore.bookstoreonline.model.user.Customer;
import com.ptit.bookstore.bookstoreonline.model.user.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "FilterCartInfo", urlPatterns = {"/*"})
public class CartFilter implements Filter {
    private ICartDAO cartDAO;
    public void init(FilterConfig config) throws ServletException {
        cartDAO = new CartDAOImp();
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request1 = (HttpServletRequest) request;
        HttpSession session = request1.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null && user.getRole() == Role.Customer) {
            // update Cart mói nhất (có check quantity, buyPrice)
            cartDAO.updateNewestCart(user.getId());
            Customer customer = new Customer();
            customer.setId(user.getId());
            Cart cart = cartDAO.getCartByCustomer(customer);
            int quantity = cart.getCartDetailList().size();
            double totalPrice = 0;
            for(CartDetail cartDetail : cart.getCartDetailList()){
                totalPrice+= (cartDetail.getBuyPrice() * cartDetail.getQuantity());
            }
            // set số lượng mặt hàng trong cart vào session
            request.setAttribute("quantity", quantity);
            request.setAttribute("totalPrice", totalPrice);
        }
        else{
            request.setAttribute("quantity", 0);
            request.setAttribute("totalPrice", 0);
        }
        chain.doFilter(request, response);
    }
}
