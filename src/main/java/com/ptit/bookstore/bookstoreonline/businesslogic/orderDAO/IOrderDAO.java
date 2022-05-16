package com.ptit.bookstore.bookstoreonline.businesslogic.orderDAO;

import com.ptit.bookstore.bookstoreonline.model.book.Book;
import com.ptit.bookstore.bookstoreonline.model.order.CartDetail;
import com.ptit.bookstore.bookstoreonline.model.order.Order;
import com.ptit.bookstore.bookstoreonline.model.order.ShipmentType;

import java.util.List;

public interface IOrderDAO {
    public List<ShipmentType> getAllShipmentType();
    public ShipmentType getShipmentTypeByID(String shipmentTypeID);

    public boolean createOrder(Order order);

    public List<Book> getBookListForOrder(List<CartDetail> cartDetailList);

    public Order getOrderByOrderID(String orderID);

    public List<Order> getOrderByCustomerID(String customerID);

    public List<Order> getAllOrder();
}
