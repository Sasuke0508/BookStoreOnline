package com.ptit.bookstore.bookstoreonline.businesslogic.userDAO;

import com.ptit.bookstore.bookstoreonline.model.enumaration.Gender;
import com.ptit.bookstore.bookstoreonline.model.enumaration.Role;
import com.ptit.bookstore.bookstoreonline.model.user.Account;
import com.ptit.bookstore.bookstoreonline.model.user.Address;
import com.ptit.bookstore.bookstoreonline.model.user.FullName;
import com.ptit.bookstore.bookstoreonline.model.user.User;

import java.sql.*;
import java.util.UUID;

public class UserDAOImp implements IUserDAO{
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
    public Account checkLogin(Account account) {
        Connection connection = getConnection();
        String sql = "SELECT * FROM account WHERE Username = ? AND Password = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, account.getUserName());
            preparedStatement.setString(2, account.getPassword());
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return new Account(rs.getString("ID"), rs.getString("Username"), "" );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public boolean checkExitUserName(String userName) {
        try {
            Connection connection = this.getConnection();
            if (connection!=null) {
                String sql = "SELECT * FROM account WHERE Username = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, userName);
                ResultSet rs = preparedStatement.executeQuery();
                boolean res = rs.next();
                connection.close();
                return res;
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public User getUserByAccount(Account account) {
        Connection connection = getConnection();
        User user = null;
        String sql = "SELECT user.*, account.Username, address.Country, address.Province, address.District, address.Ward, fullname.FirstName, fullname.LastName " +
                "FROM user " +
                "INNER JOIN account " +
                "ON user.AccountID = account.ID " +
                "INNER JOIN address " +
                "ON user.AddressID = address.ID " +
                "INNER JOIN fullname " +
                "ON user.FullnameID = fullname.ID " +
                "WHERE user.AccountID = ? ";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, account.getId());
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getString("ID"));
                user.setEmail(rs.getString("Email"));
                user.setPhoneNumber(rs.getString("PhoneNumber"));
                user.setDob(rs.getDate("Dob"));
                user.setGender(Gender.valueOf(rs.getString("Gender")));
                user.setRole(Role.valueOf(rs.getString("Role")));
                user.setAccount(new Account(rs.getString("AccountID"), rs.getString("Username"), ""));
                user.setFullName(new FullName(rs.getString("FullnameID"), rs.getString("FirstName"),
                        rs.getString("LastName")));
                user.setAddress(new Address(rs.getString("AddressID"), rs.getString("Ward"),
                        rs.getString("District"), rs.getString("Province"),
                        rs.getString("Country")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return user;
    }

    @Override
    public boolean checkExitEmail(String email) {
        Connection connection = getConnection();
        String sql = "SELECT Email FROM user WHERE Email = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public boolean checkExitPhoneNumber(String phoneNumber) {
        Connection connection = getConnection();
        String sql = "SELECT PhoneNumber FROM user WHERE PhoneNumber = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, phoneNumber);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public Account createAccount(Account account, Connection connection) {
        try {
            String sql = "INSERT INTO account(ID, Username, Password) VALUES(?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            String uniqueID = UUID.randomUUID().toString();
            preparedStatement.setString(1, uniqueID);
            preparedStatement.setString(2, account.getUserName());
            preparedStatement.setString(3, account.getPassword());
            preparedStatement.executeUpdate();
            account.setId(uniqueID);
            return account;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public Address createAddress(Address address, Connection connection) {
        try {
            String addAddressSQL = "INSERT INTO address(ID, Ward, District, Province, Country) VALUES(?, ?, ?, ?, ?);";
            PreparedStatement preparedStatement = connection.prepareStatement(addAddressSQL);
            String uniqueID = UUID.randomUUID().toString();
            preparedStatement.setString(1, uniqueID);
            preparedStatement.setString(2, address.getStreet());
            preparedStatement.setString(3, address.getDistrict());
            preparedStatement.setString(4, address.getProvince());
            preparedStatement.setString(5, address.getCountry());
            preparedStatement.executeUpdate();
            address.setId(uniqueID);
            return address;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public FullName createFullName(FullName fullName, Connection connection) {
        try {
            String addFullNameSQL = "INSERT INTO fullname(ID, FirstName, LastName) VALUES(?, ?, ?);";
            PreparedStatement preparedStatement = connection.prepareStatement(addFullNameSQL);
            String uniqueID = UUID.randomUUID().toString();
            preparedStatement.setString(1, uniqueID);
            preparedStatement.setString(2, fullName.getFirstName());
            preparedStatement.setString(3, fullName.getLastName());
            preparedStatement.executeUpdate();
            fullName.setId(uniqueID);
            return fullName;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public int editUser(User userEdit, Connection connection) {
        return 0;
    }

    @Override
    public User getUserById(String userId, Connection connection) {
        return null;
    }

    @Override
    public int deleteUserById(String userId, Connection connection) {
        return 0;
    }

}
