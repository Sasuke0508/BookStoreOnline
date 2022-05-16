package com.ptit.bookstore.bookstoreonline.businesslogic.userDAO;

import com.ptit.bookstore.bookstoreonline.model.user.Customer;

import java.util.List;

public interface ICustomerDAO {
    public boolean createCustomer(Customer customer);
    public void editCustomer(Customer customerEdit);
    public int deleteCustomer(String customerId);
    public Customer getCustomerById(String customerId);
    public List<Customer> getAllCustomer();
}
