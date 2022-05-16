package com.ptit.bookstore.bookstoreonline.model.order;

import com.ptit.bookstore.bookstoreonline.model.book.Book;
import com.ptit.bookstore.bookstoreonline.model.enumaration.OrderStatus;

import java.util.Date;
import java.util.List;

public class Order {
    private String id;
    private Date createTime;
    private OrderStatus orderStatus;
    private Cart cart;
    private Shipment shipment;
    private Payment payment;
    private List<Book> listBook;

    public Order() {
    }

    public Order(Date createTime, OrderStatus orderStatus, Cart cart, Shipment shipment, Payment payment, List<Book> listBook) {
        this.createTime = createTime;
        this.orderStatus = orderStatus;
        this.cart = cart;
        this.shipment = shipment;
        this.payment = payment;
        this.listBook = listBook;
    }

    public Order(String id, Date createTime, OrderStatus orderStatus, Cart cart, Shipment shipment, Payment payment, List<Book> listBook) {
        this.id = id;
        this.createTime = createTime;
        this.orderStatus = orderStatus;
        this.cart = cart;
        this.shipment = shipment;
        this.payment = payment;
        this.listBook = listBook;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public OrderStatus getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(OrderStatus orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Shipment getShipment() {
        return shipment;
    }

    public void setShipment(Shipment shipment) {
        this.shipment = shipment;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    public List<Book> getListBook() {
        return listBook;
    }

    public void setListBook(List<Book> listBook) {
        this.listBook = listBook;
    }
}
