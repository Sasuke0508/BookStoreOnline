package com.ptit.bookstore.bookstoreonline.businesslogic.controller;

import com.ptit.bookstore.bookstoreonline.businesslogic.bookDAO.BookDAOImp;
import com.ptit.bookstore.bookstoreonline.businesslogic.bookDAO.IBookDAO;
import com.ptit.bookstore.bookstoreonline.model.book.Author;
import com.ptit.bookstore.bookstoreonline.model.book.BookItem;
import com.ptit.bookstore.bookstoreonline.model.book.Publisher;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BookServlet", value = "/book/*")
public class BookServlet extends HttpServlet {
    private IBookDAO bookDAO;

    public void init() {
        bookDAO = new BookDAOImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getPathInfo();
        switch (action) {
            case "/":
                showBookShop(request, response);
                break;
            case "/detail":
                showDetailBookItem(request, response);
                break;
            case "/search":
                searchBookItem(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getPathInfo();
        switch (action) {
            case "/addBookItem":
                addBookItem(request, response);
                break;
            case "/addBook":
                addBook(request, response);
                break;
        }
    }

    private void showDetailBookItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookItemID = request.getParameter("bookItemID");
        BookItem bookItem = bookDAO.getBookItemById(bookItemID);
        request.setAttribute("bookItem", bookItem);
        request.getRequestDispatcher("/view/customer/shop-detail.jsp").forward(request, response);
    }

    private void addBookItem(HttpServletRequest request, HttpServletResponse response) {
    }

    private void addBook(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showBookShop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<BookItem> bookItemList = bookDAO.getAllBookItem();
        request.setAttribute("bookItemList", bookItemList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/customer/shop-grid.jsp");
        dispatcher.forward(request, response);
    }

    private void searchBookItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeSearch = request.getParameter("typeSearch");
        String keySearch = request.getParameter("keySearch");
        List<BookItem> bookItemList = new ArrayList<>();
        switch (typeSearch){
            case "Name":
                bookItemList = bookDAO.searchBookItemByName(keySearch);
                break;
            case "Author":
                Author author = new Author();
                author.setFullName(keySearch);
                bookItemList = bookDAO.searchBookItemByAuthor(author);
                break;
            case "Publisher":
                Publisher publisher = new Publisher();
                publisher.setName(keySearch);
                bookItemList = bookDAO.searchBookItemByPublisher(publisher);
                break;
        }
        request.setAttribute("bookItemList", bookItemList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/customer/search-result.jsp");
        dispatcher.forward(request, response);
    }

}
