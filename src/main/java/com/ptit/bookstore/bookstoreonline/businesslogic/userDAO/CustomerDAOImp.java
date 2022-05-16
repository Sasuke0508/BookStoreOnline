package com.ptit.bookstore.bookstoreonline.businesslogic.userDAO;

import com.ptit.bookstore.bookstoreonline.model.user.Customer;

import java.sql.*;
import java.util.List;

public class CustomerDAOImp implements ICustomerDAO {

    private String username = "root";
    private String password = "19050820";

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String connectionUrl = "jdbc:mysql://localhost:3306/bookshop";
            Connection connection = DriverManager.getConnection(connectionUrl, this.username, this.password);
            return connection;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    @Override
    public boolean createCustomer(Customer customer) {
        Connection connection = getConnection();
        boolean isSaved = false;
        try {
            connection.setAutoCommit(false);

            // add Account
            String addAccountSQL = "INSERT INTO account(ID, Username, Password) VALUES(?, ?, ?);";
            PreparedStatement preparedStatement = connection.prepareStatement(addAccountSQL);
            preparedStatement.setString(1, customer.getAccount().getId());
            preparedStatement.setString(2, customer.getAccount().getUserName());
            preparedStatement.setString(3, customer.getAccount().getPassword());
            preparedStatement.executeUpdate();

            // add Full name
            String addFullNameSQL = "INSERT INTO fullname(ID, FirstName, LastName) VALUES(?, ?, ?);";
            PreparedStatement preparedStatement1 = connection.prepareStatement(addFullNameSQL);
            preparedStatement1.setString(1, customer.getFullName().getId());
            preparedStatement1.setString(2, customer.getFullName().getFirstName());
            preparedStatement1.setString(3, customer.getFullName().getLastName());
            preparedStatement1.executeUpdate();

            // add Address
            String addAddressSQL = "INSERT INTO address(ID, Ward, District, Province, Country) VALUES(?, ?, ?, ?, ?);";
            PreparedStatement preparedStatement2 = connection.prepareStatement(addAddressSQL);
            preparedStatement2.setString(1, customer.getAddress().getId());
            preparedStatement2.setString(2, customer.getAddress().getStreet());
            preparedStatement2.setString(3, customer.getAddress().getDistrict());
            preparedStatement2.setString(4, customer.getAddress().getProvince());
            preparedStatement2.setString(5, customer.getAddress().getCountry());
            preparedStatement2.executeUpdate();

            // add User
            String addUserSQL = "INSERT INTO user(ID, AccountID, FullNameID, AddressID, Email, PhoneNumber, Dob, Gender, Role) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement preparedStatement3 = connection.prepareStatement(addUserSQL);
            preparedStatement3.setString(1, customer.getId());
            preparedStatement3.setString(2, customer.getAccount().getId());
            preparedStatement3.setString(3, customer.getFullName().getId());
            preparedStatement3.setString(4, customer.getAddress().getId());
            preparedStatement3.setString(5, customer.getEmail());
            preparedStatement3.setString(6, customer.getPhoneNumber());
            preparedStatement3.setDate(7, new Date(customer.getDob().getTime()));
            preparedStatement3.setString(8, customer.getGender().toString());
            preparedStatement3.setString(9, customer.getRole().toString());
            preparedStatement3.executeUpdate();

            // add Customer
            String addCustomerSQL = "INSERT INTO customer(UserID, MemberLevel) VALUES(?, ?);";
            PreparedStatement preparedStatement4 = connection.prepareStatement(addCustomerSQL);
            preparedStatement4.setString(1, customer.getId());
            preparedStatement4.setString(2, customer.getMemberLevel().toString());
            preparedStatement4.executeUpdate();

            connection.commit();
            isSaved = true;

        } catch (SQLException throwables) {
            try {
                connection.rollback();
                connection.close();
                isSaved = false;
            } catch (SQLException e) {
                e.printStackTrace();
            }

            throwables.printStackTrace();
        }
        return isSaved;
    }

    @Override
    public void editCustomer(Customer customerEdit) {

    }

    @Override
    public int deleteCustomer(String customerId) {
        return 0;
    }

    @Override
    public Customer getCustomerById(String customerId) {
        return null;
    }

    @Override
    public List<Customer> getAllCustomer() {
        return null;
    }
}
