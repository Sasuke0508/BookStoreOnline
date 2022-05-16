package com.ptit.bookstore.bookstoreonline.businesslogic.controller;

import com.ptit.bookstore.bookstoreonline.businesslogic.orderDAO.IOrderDAO;
import com.ptit.bookstore.bookstoreonline.businesslogic.orderDAO.OrderDAOImp;
import com.ptit.bookstore.bookstoreonline.model.order.Order;
import com.ptit.bookstore.bookstoreonline.model.user.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderServlet", value = "/order")
public class OrderServlet extends HttpServlet {
    private IOrderDAO orderDAO;

    public void init() {
        orderDAO = new OrderDAOImp();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String orderID = request.getParameter("orderID");
        if (orderID == null) {
            showListOrder(request, response);
        } else {
            showDetailOrder(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void showListOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        List<Order> orderList = orderDAO.getOrderByCustomerID(user.getId());
        request.setAttribute("orderList", orderList);
        request.getRequestDispatcher("/view/customer/order-list.jsp").forward(request, response);
    }

    private void showDetailOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderID = request.getParameter("orderID");
        Order order = orderDAO.getOrderByOrderID(orderID);
        request.setAttribute("order", order);
        request.getRequestDispatcher("/view/customer/order-details.jsp").forward(request, response);
    }
}

