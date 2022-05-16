package com.ptit.bookstore.bookstoreonline.businesslogic.orderDAO;

import com.ptit.bookstore.bookstoreonline.businesslogic.bookDAO.BookDAOImp;
import com.ptit.bookstore.bookstoreonline.model.enumaration.CartStatus;
import com.ptit.bookstore.bookstoreonline.model.order.Cart;
import com.ptit.bookstore.bookstoreonline.model.order.CartDetail;
import com.ptit.bookstore.bookstoreonline.model.user.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class CartDAOImp implements ICartDAO{
    private String username = "root";
    private String password = "19050820";
    private BookDAOImp bookDAO;

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
    public int getQuantityOfCart(String id) {
        Connection connection = getConnection();
        String sql = "SELECT SUM(Quantity) AS QuantityTotal FROM cartdetail WHERE CartID = ? ";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return rs.getInt("QuantityTotal");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public Cart getCartByCustomer(Customer customer) {
        Cart cart = new Cart();;
        Connection connection = getConnection();
        String sql = "SELECT cart.* FROM cart WHERE CustomerID = ? AND Status = 'InProgress'";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, customer.getId());
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                cart.setID(rs.getString("ID"));
                cart.setCartStatus(CartStatus.valueOf(rs.getString("Status")));
                cart.setCustomer(new Customer(rs.getString("CustomerID")));
                cart.setCartDetailList(getCartDetailList(connection, cart.getID()));
                cart.setTotal(rs.getDouble("Total"));
            } else {
                cart.setID(UUID.randomUUID().toString());
                cart.setCustomer(customer);
                cart.setCartStatus(CartStatus.InProgress);
                cart.setTotal(0);
                cart = createNewCart(connection, cart);
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
        return cart;
    }

    private Cart createNewCart(Connection connection, Cart cart) {
        String sql = "INSERT INTO cart(ID, CustomerID, Total, Status) VALUES (?, ?, ?, ?);";
        int rowEffect = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cart.getID());
            preparedStatement.setString(2, cart.getCustomer().getId());
            preparedStatement.setDouble(3, cart.getTotal());
            preparedStatement.setString(4, cart.getCartStatus().toString());
            rowEffect = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return (rowEffect > 0) ? cart : null;
    }

    private List<CartDetail> getCartDetailList(Connection connection, String cartID) {
        bookDAO = new BookDAOImp();
        List<CartDetail> cartDetailList = new ArrayList<>();
        String sql = "SELECT cartDetail.* FROM cartDetail WHERE CartID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cartID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                CartDetail cartDetail = new CartDetail(rs.getString("ID"), bookDAO.getBookItemById(rs.getString("BookItemID")),
                        rs.getInt("Quantity"), rs.getDouble("BuyPrice"));
                cartDetailList.add(cartDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cartDetailList;
    }

    @Override
    public Cart getCartByCartID(String cartID) {
        Cart cart = null;
        Connection connection = getConnection();
        String sql = "SELECT cart.* FROM cart WHERE ID = ? AND Status = 'Completed'";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cartID);
            ResultSet rs = preparedStatement.executeQuery();
            cart = new Cart();
            if (rs.next()) {
                cart.setID(rs.getString("ID"));
                cart.setCartStatus(CartStatus.valueOf(rs.getString("Status")));
                cart.setCustomer(new Customer(rs.getString("CustomerID")));
                cart.setCartDetailList(getCartDetailList(connection, cart.getID()));
                cart.setTotal(rs.getDouble("Total"));
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
        return cart;
    }

    @Override
    public void updateNewestCart(String CustomerID) {
        Connection connection = getConnection();
        Customer customer = new Customer();
        customer.setId(CustomerID);
        Cart cart = getCartByCustomer(customer);
        if (cart.getCartDetailList() != null) {
            List<CartDetail> cartDetailList = cart.getCartDetailList();
            for (CartDetail cartDetail : cartDetailList) {
                updateCartDetail(connection, cartDetail);
            }
            updateTotal(connection, cart);
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private void updateTotal(Connection connection, Cart cart) {
        double total = calcTotalCart(connection, cart.getID());
        String sql = "UPDATE cart SET Total = ? WHERE ID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setDouble(1, total);
            preparedStatement.setString(2, cart.getID());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private double calcTotalCart(Connection connection, String cartID) {
        double total = 0;
        String sql = "SELECT SUM(Quantity * BuyPrice) AS Total FROM cartdetail WHERE CartID = ? GROUP BY CartID;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cartID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                total = rs.getDouble("Total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    private boolean updateCartDetail(Connection connection, CartDetail cartDetail) {
        int bookItemQuantityInStock = cartDetail.getBookItem().getQuantity();
        int bookItemQuantityInCart = cartDetail.getQuantity();
        bookItemQuantityInCart = (bookItemQuantityInCart < bookItemQuantityInStock) ? bookItemQuantityInCart : bookItemQuantityInStock;
        cartDetail.setQuantity(bookItemQuantityInCart);
        cartDetail.setBuyPrice(cartDetail.getBookItem().getSalePrice());

        if (bookItemQuantityInCart > 0) {
            //update
            String sql = "UPDATE cartDetail SET Quantity = ?, BuyPrice = ? WHERE ID = ?; ";
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setInt(1, cartDetail.getQuantity());
                preparedStatement.setDouble(2, cartDetail.getBuyPrice());
                preparedStatement.setString(3, cartDetail.getID());
                return preparedStatement.executeUpdate() > 0;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            //delete
            return deleteCartDetail(connection, cartDetail);
        }
        return false;
    }

    private boolean deleteCartDetail(Connection connection, CartDetail cartDetail) {
        String sql = "DELETE FROM cartDetail WHERE ID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cartDetail.getID());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateCartItem(CartDetail cartDetail) {
        Connection connection = getConnection();
        return updateCartDetail(connection, cartDetail);
    }

    @Override
    public boolean insertCartItem(Cart cart, CartDetail cartDetail) {
        Connection connection = getConnection();
        int rowEffect = 0;
        String sql = "INSERT INTO cartdetail(ID, CartID, BookItemID, Quantity, BuyPrice) VALUES(?, ?, ?, ?, ?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cartDetail.getID());
            preparedStatement.setString(2, cart.getID());
            preparedStatement.setString(3, cartDetail.getBookItem().getId());
            preparedStatement.setInt(4, cartDetail.getQuantity());
            preparedStatement.setDouble(5, cartDetail.getBuyPrice());
            rowEffect = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return rowEffect > 0;
    }

    @Override
    public boolean removeCartItem(CartDetail cartDetail) {
        Connection connection = getConnection();
        return deleteCartDetail(connection, cartDetail);
    }

    @Override
    public CartDetail getCartDetailByID(String cartDetailID) {
        Connection connection = getConnection();
        String sql = "SELECT * FROM cartdetail WHERE ID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cartDetailID);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return new CartDetail(rs.getString("ID"), bookDAO.getBookItemById(rs.getString("BookItemID")),
                        rs.getInt("Quantity"), rs.getDouble("BuyPrice") );
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
    public void updateCart(Cart cart) {
        Connection connection = getConnection();
        List<CartDetail> cartDetailList = cart.getCartDetailList();
        for (CartDetail cartDetail : cartDetailList) {
            updateCartDetail(connection, cartDetail);
        }
        updateTotal(connection, cart);
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void setCartStatus(Connection connection, Cart cart) {
        String sql = "UPDATE cart SET Status = ? WHERE ID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cart.getCartStatus().toString());
            preparedStatement.setString(2, cart.getID());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
