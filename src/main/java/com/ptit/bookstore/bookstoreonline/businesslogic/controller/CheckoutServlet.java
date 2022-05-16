package com.ptit.bookstore.bookstoreonline.businesslogic.controller;

import com.ptit.bookstore.bookstoreonline.businesslogic.orderDAO.CartDAOImp;
import com.ptit.bookstore.bookstoreonline.businesslogic.orderDAO.ICartDAO;
import com.ptit.bookstore.bookstoreonline.businesslogic.orderDAO.IOrderDAO;
import com.ptit.bookstore.bookstoreonline.businesslogic.orderDAO.OrderDAOImp;
import com.ptit.bookstore.bookstoreonline.model.book.Book;
import com.ptit.bookstore.bookstoreonline.model.enumaration.CODStatus;
import com.ptit.bookstore.bookstoreonline.model.enumaration.OrderStatus;
import com.ptit.bookstore.bookstoreonline.model.enumaration.PaymentType;
import com.ptit.bookstore.bookstoreonline.model.order.*;
import com.ptit.bookstore.bookstoreonline.model.user.Customer;
import com.ptit.bookstore.bookstoreonline.model.user.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "CheckOutServlet", value = "/checkout")
public class CheckoutServlet extends HttpServlet {
    private ICartDAO cartDAO;
    private IOrderDAO orderDAO;

    public void init(){
        cartDAO = new CartDAOImp();
        orderDAO = new OrderDAOImp();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        showCheckoutPage(request, response);
    }

    private void showCheckoutPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        Customer customer = new Customer();
        customer.setId(user.getId());
        Cart cart = cartDAO.getCartByCustomer(customer);
        request.setAttribute("cart", cart);

        List<ShipmentType> shipmentTypeList = orderDAO.getAllShipmentType();
        request.setAttribute("shipmentTypeList", shipmentTypeList);

        request.getRequestDispatcher("/view/customer/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        checkout(request, response);
    }

    private void checkout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Order order = new Order();
        User user = (User) request.getSession().getAttribute("user");
        Customer customer = new Customer();
        customer.setId(user.getId());
        Cart cart = cartDAO.getCartByCustomer(customer);
        order.setCart(cart);

        String orderID = UUID.randomUUID().toString();
        order.setId(orderID);

        List<Book> bookList = orderDAO.getBookListForOrder(cart.getCartDetailList());
        if (bookList != null) {
            order.setListBook(bookList);
        }

        // shipment
        String shipmentID = UUID.randomUUID().toString();
        String address = request.getParameter("address") + ", " + request.getParameter("street") + ", " + request.getParameter("district") + ", " + request.getParameter("province") ;
        String phoneNumber = request.getParameter("phoneNumber");
        String note = request.getParameter("note");
        String shipmentTypeID = request.getParameter("shipmentType");
        Shipment shipment = new Shipment(shipmentID, address, phoneNumber, note, orderDAO.getShipmentTypeByID(shipmentTypeID));
        order.setShipment(shipment);

        // payment
        String paymentID = UUID.randomUUID().toString();
        String paymentType = request.getParameter("paymentType");
        double amount = cart.getTotal() + shipment.getShipmentType().getFeeShip();
        Payment payment = null;
        switch (paymentType) {
            case "COD":
                payment = new COD();
                ((COD) payment).setPaymentStatus(CODStatus.Unpaid);
                break;
            case "ElectricWallet":
                payment = new ElectricWallet();
                ((ElectricWallet) payment).setWalletHolder("Nguyễn Văn Quân");
                ((ElectricWallet) payment).setWalletNumber("001200028950");
                break;
            case "Credit":
                payment = new Credit();
                ((Credit) payment).setCardHolder("Nguyễn Văn Quân");
                ((Credit) payment).setNumber("001200028950");
//                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//                try {
//                    ((Credit) payment).setExpireDate(sdf.parse("2018-08-05"));
//                } catch (ParseException e) {
//                    e.printStackTrace();
//                }
                break;
        }
        payment.setID(paymentID);
        payment.setPaymentType(PaymentType.valueOf(paymentType));
        payment.setCreateTime(new Date());
        payment.setAmount(amount);
        order.setPayment(payment);

        // status
        order.setOrderStatus(OrderStatus.Pending);
        order.setCreateTime(new Date());
        if (orderDAO.createOrder(order)) { // thành công
            response.sendRedirect(request.getContextPath() + "/order?orderID=" + order.getId());
        } else { //fail
            response.sendRedirect(request.getContextPath() + "/cart/");
        }
    }
}
