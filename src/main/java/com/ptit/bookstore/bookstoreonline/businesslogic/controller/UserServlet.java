package com.ptit.bookstore.bookstoreonline.businesslogic.controller;

import com.ptit.bookstore.bookstoreonline.businesslogic.bookDAO.BookDAOImp;
import com.ptit.bookstore.bookstoreonline.businesslogic.bookDAO.IBookDAO;
import com.ptit.bookstore.bookstoreonline.businesslogic.userDAO.CustomerDAOImp;
import com.ptit.bookstore.bookstoreonline.businesslogic.userDAO.IUserDAO;
import com.ptit.bookstore.bookstoreonline.businesslogic.userDAO.UserDAOImp;
import com.ptit.bookstore.bookstoreonline.model.book.Author;
import com.ptit.bookstore.bookstoreonline.model.book.BookItem;
import com.ptit.bookstore.bookstoreonline.model.book.Publisher;
import com.ptit.bookstore.bookstoreonline.model.enumaration.Gender;
import com.ptit.bookstore.bookstoreonline.model.enumaration.MemberLevel;
import com.ptit.bookstore.bookstoreonline.model.enumaration.Role;
import com.ptit.bookstore.bookstoreonline.model.user.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "HomePage", value = "/")
public class UserServlet extends HttpServlet {
    private final int NUMBER_OF_BOOK_RENDER = 8;
    private BookDAOImp bookDAO;
    private UserDAOImp userDAO;
    private CustomerDAOImp customerDAO;

    @Override
    public void init() {
        bookDAO = new BookDAOImp();
        userDAO = new UserDAOImp();
        customerDAO = new CustomerDAOImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String action = request.getServletPath();
        HttpSession session = request.getSession();

        switch (action){
            case  "/logout":
                handleLogout(request, response);
                break;
            case "/":
                showHomePage(request, response);
                break;
        }
    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // xóa thông tin user trong session
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        response.sendRedirect(request.getContextPath() + "/");
    }

    private void showHomePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // lấy danh sách bookItem theo thứ tự thời gian thêm
        List<BookItem> bookItemListNewest = bookDAO.getListBookItemNew(NUMBER_OF_BOOK_RENDER);
        // lấy danh sách bookItem theo số lượng bán được
        List<BookItem> bookItemListBestSeller = bookDAO.getListBookItemBestSeller(NUMBER_OF_BOOK_RENDER);
        // set vào request
        request.setAttribute("bookItemListNewest", bookItemListNewest);
        request.setAttribute("bookItemListBestSeller", bookItemListBestSeller);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/customer/index.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String action = request.getServletPath();
        switch (action) {
            case "/login":
                handleLogin(request, response);
                break;
            case "/register":
                handleRegister(request, response);
                break;
        }
    }

    private void handleRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get params
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date dob = null;
        try {
            dob = sdf.parse("2000-08-05");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String ward = request.getParameter("ward");
        String district = request.getParameter("district");
        String province = request.getParameter("province");
        String country = request.getParameter("address");
        Account account = new Account(username, password);
        FullName fullname = new FullName(firstName, lastName);
        Address address = new Address(ward, district, province, country);
        User user = new Customer();
        user.setAccount(account);
        user.setFullName(fullname);
        user.setAddress(address);
        user.setGender(Gender.valueOf(gender));
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setDob(dob);

        if (!password.equals(confirmPassword)) {
            request.setAttribute("message", "Confirm password is not correct!");
            request.setAttribute("user", user);
            request.getRequestDispatcher("/view/customer/index.jsp").forward(request, response);
            return;
        }

        // Kiểm tra unique
        if (userDAO.checkExitUserName(username)) {
            request.setAttribute("message", "Username is existed!");
            request.setAttribute("user", user);
            request.getRequestDispatcher("/view/customer/index.jsp").forward(request, response);
            return;
        }

        if (userDAO.checkExitEmail(email)) {
            request.setAttribute("message", "Email is existed");
            request.setAttribute("user", user);
            request.getRequestDispatcher("/view/customer/index.jsp").forward(request, response);
            return;
        }

        if (userDAO.checkExitPhoneNumber(phoneNumber)) {
            request.setAttribute("message", "Phone number is existed");
            request.setAttribute("user", user);
            request.getRequestDispatcher("/view/customer/index.jsp").forward(request, response);
            return;
        }

        user.setId(UUID.randomUUID().toString());
        user.getAccount().setId(UUID.randomUUID().toString());
        user.getAddress().setId(UUID.randomUUID().toString());
        user.getFullName().setId(UUID.randomUUID().toString());
        user.setRole(Role.Customer);
        ((Customer) user).setMemberLevel(MemberLevel.Standard);
        Customer customer = new Customer();
        customer.setId(user.getId());
        if (customerDAO.createCustomer(customer)){
//            System.out.println("Tạo thành công!");
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            request.setAttribute("message", "Have errors in progress!");
            request.setAttribute("user", user);
            request.getRequestDispatcher("/view/customer/index.jsp").forward(request, response);
        }

    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Get params
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Account accountInput = new Account(username, password);
        // check db
        Account responseAccount = userDAO.checkLogin(accountInput);
        if (responseAccount == null) {
            request.setAttribute("accountInput", accountInput);
            request.setAttribute("message", "Username or password are not valid!");
        } else {
            Account account = new Account();
            account.setId(responseAccount.getId());
            User user = userDAO.getUserByAccount(account);
            // lưu thông tin user vào session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
//            System.out.println("Đã lưu " + user.getFullName().getLastName() + " vào session!");
            Role role = user.getRole();
            if (role == Role.Customer) {
                response.sendRedirect(request.getContextPath() + "/");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/");
            }
        }
    }
}
