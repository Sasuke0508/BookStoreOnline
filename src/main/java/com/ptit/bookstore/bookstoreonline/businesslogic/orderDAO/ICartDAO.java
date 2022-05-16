package com.ptit.bookstore.bookstoreonline.businesslogic.orderDAO;

import com.ptit.bookstore.bookstoreonline.model.order.Cart;
import com.ptit.bookstore.bookstoreonline.model.order.CartDetail;
import com.ptit.bookstore.bookstoreonline.model.user.Customer;

import java.sql.Connection;

public interface ICartDAO {
    public int getQuantityOfCart(String id);
    public Cart getCartByCustomer(Customer customer);
    public Cart getCartByCartID(String cartID);
    public void updateNewestCart(String id);
    public boolean updateCartItem(CartDetail cartDetail);
    public boolean insertCartItem(Cart cart, CartDetail cartDetail);
    public boolean removeCartItem(CartDetail cartDetail);
    public CartDetail getCartDetailByID(String cartDetailID);
    public void updateCart(Cart cart);
    public void setCartStatus(Connection connection, Cart cart);
}
