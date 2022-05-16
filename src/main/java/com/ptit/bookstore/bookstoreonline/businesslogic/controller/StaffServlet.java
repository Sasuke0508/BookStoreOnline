package com.ptit.bookstore.bookstoreonline.businesslogic.controller;

import com.ptit.bookstore.bookstoreonline.businesslogic.bookDAO.BookDAOImp;
import com.ptit.bookstore.bookstoreonline.businesslogic.bookDAO.IBookDAO;
import com.ptit.bookstore.bookstoreonline.businesslogic.orderDAO.IOrderDAO;
import com.ptit.bookstore.bookstoreonline.businesslogic.orderDAO.OrderDAOImp;
import com.ptit.bookstore.bookstoreonline.businesslogic.userDAO.CustomerDAOImp;
import com.ptit.bookstore.bookstoreonline.businesslogic.userDAO.ICustomerDAO;
import com.ptit.bookstore.bookstoreonline.model.book.BookItem;
import com.ptit.bookstore.bookstoreonline.model.order.Order;
import com.ptit.bookstore.bookstoreonline.model.user.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StaffServlet", value = "/admin/*")
public class StaffServlet extends HttpServlet {
    private IBookDAO bookDAO;
    private ICustomerDAO customerDAO;
    private IOrderDAO orderDAO;

    public void init() {
        bookDAO = new BookDAOImp();
        customerDAO = new CustomerDAOImp();
        orderDAO = new OrderDAOImp();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo();
        switch (action) {
            case "/order":
                showOrder(request, response);
                break;
            case "/customer":
                showAllCustomer(request, response);
                break;
            case  "/":
                showAllBook(request, response);
                break;
        }
    }

    private void showOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orderList = orderDAO.getAllOrder();
        request.setAttribute("orderList", orderList);
        request.getRequestDispatcher("/view/staff/admin-order.jsp").forward(request, response);
    }

    private void showAllBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<BookItem> bookItemList = bookDAO.getAllBookItem();
        request.setAttribute("bookItemList", bookItemList);
        request.getRequestDispatcher("/view/staff/admin-book.jsp").forward(request, response);
    }

    private void showAllCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = customerDAO.getAllCustomer();
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("/view/staff/admin-customer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
