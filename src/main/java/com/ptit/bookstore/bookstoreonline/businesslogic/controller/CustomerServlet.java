package com.ptit.bookstore.bookstoreonline.businesslogic.controller;

import com.ptit.bookstore.bookstoreonline.businesslogic.bookDAO.BookDAOImp;
import com.ptit.bookstore.bookstoreonline.businesslogic.userDAO.UserDAOImp;
import com.ptit.bookstore.bookstoreonline.businesslogic.userDAO.CustomerDAOImp;
import com.ptit.bookstore.bookstoreonline.model.book.Author;
import com.ptit.bookstore.bookstoreonline.model.book.Book;
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
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "CustomerServlet", value = "/customer/*")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
