package com.ptit.bookstore.bookstoreonline.businesslogic.userDAO;

import com.ptit.bookstore.bookstoreonline.model.user.Account;
import com.ptit.bookstore.bookstoreonline.model.user.Address;
import com.ptit.bookstore.bookstoreonline.model.user.FullName;
import com.ptit.bookstore.bookstoreonline.model.user.User;

import java.sql.Connection;

public interface IUserDAO {
    public Account checkLogin(Account account);
    public boolean checkExitUserName(String userName);
    public User getUserByAccount(Account account);
    public boolean checkExitEmail(String email);
    public boolean checkExitPhoneNumber(String phoneNumber);
    public Account createAccount(Account account, Connection connection);
    public Address createAddress(Address address, Connection connection);
    public FullName createFullName(FullName fullName, Connection connection);
    public int editUser(User userEdit, Connection connection);
    public User getUserById(String userId, Connection connection);
    public int deleteUserById(String userId, Connection connection);
}
