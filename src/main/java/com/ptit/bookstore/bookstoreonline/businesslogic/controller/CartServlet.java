package com.ptit.bookstore.bookstoreonline.businesslogic.controller;

import com.ptit.bookstore.bookstoreonline.businesslogic.bookDAO.BookDAOImp;
import com.ptit.bookstore.bookstoreonline.businesslogic.bookDAO.IBookDAO;
import com.ptit.bookstore.bookstoreonline.businesslogic.orderDAO.CartDAOImp;
import com.ptit.bookstore.bookstoreonline.businesslogic.orderDAO.ICartDAO;
import com.ptit.bookstore.bookstoreonline.model.book.BookItem;
import com.ptit.bookstore.bookstoreonline.model.order.Cart;
import com.ptit.bookstore.bookstoreonline.model.order.CartDetail;
import com.ptit.bookstore.bookstoreonline.model.user.Customer;
import com.ptit.bookstore.bookstoreonline.model.user.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "CartServlet", value = "/cart/*")
public class CartServlet extends HttpServlet {
    private ICartDAO cartDAO;
    private IBookDAO bookDAO;

    @Override
    public void init() {
        cartDAO = new CartDAOImp();
        bookDAO = new BookDAOImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getPathInfo();
        switch (action) {
            case "/add":
                addToCart(request, response);
                break;
            case "/remove":
                removeBookFromCart(request, response);
                break;
            case "/":
                showCart(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getPathInfo();
        switch (action) {
            case "/update":
                updateCart(request, response);
                break;
        }
    }

    private void showCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin user từ session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Get cart đã update thông tin
        Customer customer = new Customer();
        customer.setId(user.getId());
        Cart cart = cartDAO.getCartByCustomer(customer);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("/view/customer/cart.jsp").forward(request, response);

    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Get Params
        String bookItemID = request.getParameter("bookItemID");
        BookItem bookItem = bookDAO.getBookItemById(bookItemID);
        // lấy thông tin user từ session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Get cart
        Customer customer = new Customer();
        customer.setId(user.getId());
        Cart cart = cartDAO.getCartByCustomer(customer);

        // Kiểm tra xem item đó đã có trong cart chưa
        boolean isExist = false;
        List<CartDetail> cartDetailList = cart.getCartDetailList();
        for (CartDetail cartDetail : cartDetailList) {
            if (cartDetail.getBookItem().getId().equals(bookItemID)) {
                cartDetail.setQuantity(cartDetail.getQuantity() + 1);
                cartDetail.setBuyPrice(bookItem.getSalePrice());
                // update db
                cartDAO.updateCartItem(cartDetail);
                isExist = true;
                break;
            }
        }
        if (isExist == false) {
            // insert db
            CartDetail cartDetail = new CartDetail();
            cartDetail.setID(UUID.randomUUID().toString());
            cartDetail.setBookItem(bookItem);
            cartDetail.setQuantity(1);
            cartDetail.setBuyPrice(bookItem.getSalePrice());
            cartDAO.insertCartItem(cart, cartDetail);
        }

        response.sendRedirect(request.getContextPath() + "/cart/");
    }

    private void removeBookFromCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Get Params: cartDetailID
        String cartDetailID = request.getParameter("cartDetailID");
        CartDetail cartDetail = cartDAO.getCartDetailByID(cartDetailID);
        if (cartDetail != null) {
            cartDAO.removeCartItem(cartDetail);
        }
        response.sendRedirect(request.getContextPath() + "/cart/");
    }

    private void updateCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // get Cart từ db
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Customer customer = new Customer();
        customer.setId(user.getId());
        Cart cart = cartDAO.getCartByCustomer(customer);
        // Get params, thực hiện update các record
        List<CartDetail> cartDetailList = cart.getCartDetailList();
        for (CartDetail cartDetail : cartDetailList) {
            int quantity = Integer.parseInt(request.getParameter(cartDetail.getID()));
            cartDetail.setQuantity(quantity);
        }
        cart.setCartDetailList(cartDetailList);

        // update cartDetail
        cartDAO.updateCart(cart);
        response.sendRedirect(request.getContextPath() + "/cart/");
    }
}

