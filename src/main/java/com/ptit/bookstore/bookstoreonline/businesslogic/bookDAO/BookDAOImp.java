package com.ptit.bookstore.bookstoreonline.businesslogic.bookDAO;

import com.ptit.bookstore.bookstoreonline.model.book.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAOImp implements IBookDAO{
    private final String username = "root";
    private final String password = "19050820";

    public Connection getConnection(){
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
    public List<BookItem> getListBookItemNew(int number) {
        List<BookItem> bookItemList = new ArrayList<>();
        Connection connection = getConnection();
        String sql = "SELECT bookitem.*, publisher.name, publisher.address, category.name as categoryname, category.quantity as quantitycategory FROM bookitem INNER JOIN publisher INNER JOIN category ON bookitem.PublisherID = publisher.ID AND bookitem.CategoryID = category.ID WHERE bookitem.Quantity > 0 ORDER BY createDate DESC LIMIT ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, number);
            ResultSet rs = preparedStatement.executeQuery();
            bookItemList = extractBookItemListFromResultSet(connection, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return bookItemList;
    }

    @Override
    public List<BookItem> getListBookItemBestSeller(int number) {
        List<BookItem> bookItemList = new ArrayList<>();
        Connection connection = getConnection();
        String sql = "SELECT bookitem.*, publisher.name, publisher.address, category.name as categoryname, category.quantity as quantitycategory FROM bookitem INNER JOIN publisher INNER JOIN category ON bookitem.PublisherID = publisher.ID AND bookitem.CategoryID = category.ID WHERE bookitem.Quantity > 0 ORDER BY bookitem.quantity DESC LIMIT ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, number);
            ResultSet rs = preparedStatement.executeQuery();
            bookItemList = extractBookItemListFromResultSet(connection, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return bookItemList;
    }

    @Override
    public BookItem getBookItemById(String bookItemId) {
        BookItem bookItem = new BookItem();
        Connection connection = getConnection();
        String sql = "SELECT bookitem.*, publisher.name, publisher.address, category.name as categoryname, category.quantity as quantitycategory FROM bookitem INNER JOIN publisher INNER JOIN category ON bookitem.PublisherID = publisher.ID AND bookItem.CategoryID = category.ID WHERE bookitem.ID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, bookItemId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                bookItem.setId(rs.getString("ID"));
                bookItem.setISBN(rs.getString("ISBN"));
                bookItem.setTitle(rs.getString("Title"));
                bookItem.setSummary(rs.getString("Summary"));
                bookItem.setCategory(new Category(rs.getString("CategoryID"), rs.getString("categoryname"), rs.getInt("quantitycategory")));
                bookItem.setPublicationDate(rs.getDate("PublicationDate"));
                bookItem.setNumberOfPage(rs.getInt("NumberOfPage"));
                bookItem.setSalePrice(rs.getDouble("BuyPrice"));
                bookItem.setQuantity(rs.getInt("Quantity"));
                bookItem.setSoldQuantity(rs.getInt("SoldQuantity"));
                bookItem.setCreateDate(rs.getDate("CreateDate"));
                bookItem.setWeight(rs.getDouble("Weight"));
                bookItem.setSize(rs.getString("Size"));
                bookItem.setPublisher(new Publisher(rs.getString("PublisherID"), rs.getString("Name"), rs.getString("Address")));
                bookItem.setAuthorList(getAuthorListByBookItemID(connection, bookItem.getId()));
                bookItem.setImageList(getImageListByBookItemID(connection, bookItem.getId()));
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
        return bookItem;
    }

    @Override
    public List<BookItem> getAllBookItem() {
        List<BookItem> bookItemList = new ArrayList<>();
        Connection connection = getConnection();
        String sql = "SELECT bookitem.*, publisher.name, publisher.address, category.name as categoryname, category.quantity as quantitycategory FROM bookitem INNER JOIN publisher INNER JOIN category ON bookitem.PublisherID = publisher.ID AND bookitem.CategoryID = category.ID";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            bookItemList = extractBookItemListFromResultSet(connection, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return bookItemList;
    }

    @Override
    public List<BookItem> searchBookItemByName(String bookItemName) {
        List<BookItem> bookItemList = new ArrayList<>();
        Connection connection = getConnection();
        bookItemName = "'%" + bookItemName + "%'";
        String sql = "SELECT bookitem.*, publisher.name, publisher.address, category.name as categoryname, category.quantity as quantitycategory FROM bookitem INNER JOIN publisher INNER JOIN category ON bookitem.PublisherID = publisher.ID AND bookitem.CategoryID = category.ID WHERE Title LIKE " + bookItemName + " ORDER BY createDate DESC";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            bookItemList = extractBookItemListFromResultSet(connection, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return bookItemList;
    }

    @Override
    public List<BookItem> searchBookItemByCategory(Category category) {
        List<BookItem> bookItemList = new ArrayList<>();
        Connection connection = getConnection();
        String categoryName = "'%" + category.getName() + "%'";
        String sql = "SELECT bookitem.*, publisher.name, publisher.address, category.name as categoryname, category.quantity as quantitycategory FROM bookitem INNER JOIN publisher INNER JOIN category ON bookitem.PublisherID = publisher.ID AND bookitem.CategoryID = category.ID WHERE category.name LIKE " + categoryName + " ORDER BY createDate DESC";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            bookItemList = extractBookItemListFromResultSet(connection, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return bookItemList;
    }

    @Override
    public List<BookItem> searchBookItemByPublisher(Publisher publisher) {
        List<BookItem> bookItemList = new ArrayList<>();
        Connection connection = getConnection();
        String publisherName = "'%" + publisher.getName() + "%'";
        String sql = "SELECT bookitem.*, publisher.name, publisher.address, category.name as categoryname, category.quantity as quantitycategory FROM bookitem INNER JOIN publisher INNER JOIN category ON bookitem.PublisherID = publisher.ID AND bookitem.CategoryID = category.ID WHERE publisher.name LIKE " + publisherName + " ORDER BY createDate DESC";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            bookItemList = extractBookItemListFromResultSet(connection, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return bookItemList;
    }

    @Override
    public List<BookItem> searchBookItemByAuthor(Author author) {
        List<BookItem> bookItemList = new ArrayList<>();
        Connection connection = getConnection();
        String authorName = "'%" + author.getFullName() + "%'";
        String sql = "SELECT bookitem.*, publisher.name, publisher.address, category.name as categoryname, category.quantity as quantitycategory FROM bookitem INNER JOIN publisher INNER JOIN category INNER JOIN author INNER JOIN bookitem_author ON bookitem.PublisherID = publisher.ID AND bookItem.CategoryID = category.ID AND author.ID = bookitem_author.AuthorID AND bookitem.ID = bookitem_author.BookItemID WHERE author.FullName LIKE " + authorName +  " ORDER BY createDate DESC";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            bookItemList = extractBookItemListFromResultSet(connection, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return bookItemList;
    }

    @Override
    public List<BookItem> searchBookItemByPrice(double minPrice, double maxPrice) {
        List<BookItem> bookItemList = new ArrayList<>();
        Connection connection = getConnection();
        String sql = "SELECT bookitem.*, publisher.name, publisher.address, category.name as categoryname, category.quantity as quantitycategory FROM bookitem INNER JOIN publisher INNER JOIN category ON bookitem.PublisherID = publisher.ID AND bookitem.CategoryID = category.ID WHERE bookitem.BuyPrice between " + minPrice + "AND" + maxPrice +" ORDER BY createDate DESC";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            bookItemList = extractBookItemListFromResultSet(connection, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return bookItemList;
    }

    @Override
    public void updateBookItem(BookItem bookItemEdit) {
        Connection connection = getConnection();
        String sql = "UPDATE bookitem SET PublisherID = ?, CategoryID = ?, ISBN = ?, Title = ?, " +
                "Summary = ?, PublicationDate = ?, NumberOfPage = ?, BuyPrice = ?, " +
                "Quantity = ?, CreateDate = ?, SoldQuantity = ?, Weight = ?, Size = ? WHERE ID = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, bookItemEdit.getPublisher().getId());
            preparedStatement.setString(1, bookItemEdit.getCategory().getId());
            preparedStatement.setString(3, bookItemEdit.getISBN());
            preparedStatement.setString(4, bookItemEdit.getTitle());
            preparedStatement.setString(5, bookItemEdit.getSummary());
            preparedStatement.setDate(6, new Date(bookItemEdit.getPublicationDate().getTime()));
            preparedStatement.setInt(7, bookItemEdit.getNumberOfPage());
            preparedStatement.setDouble(8, bookItemEdit.getSalePrice());
            preparedStatement.setInt(9, bookItemEdit.getQuantity());
            preparedStatement.setDate(10, new Date(bookItemEdit.getCreateDate().getTime()));
            preparedStatement.setInt(11, bookItemEdit.getSoldQuantity());
            preparedStatement.setDouble(12, bookItemEdit.getWeight());
            preparedStatement.setString(13, bookItemEdit.getSize());
            preparedStatement.setString(14, bookItemEdit.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteBookItem(String bookItemId) {
        Connection connection = getConnection();
        String sql = "DELETE bookitem where bookitem.ID = " + bookItemId + ";";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private List<Image> getImageListByBookItemID(Connection connection, String bookItemID) {
        List<Image> imageList = new ArrayList<>();
        String sql = "SELECT * FROM image WHERE BookItemID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, bookItemID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                imageList.add(new Image(rs.getString("ID"), rs.getString("Path")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return imageList;
    }

    private List<Author> getAuthorListByBookItemID(Connection connection, String bookItemID) {
        List<Author> authorList = new ArrayList<>();
        String sql = "SELECT * FROM author INNER JOIN bookitem_author ON author.ID = bookitem_author.AuthorID WHERE BookItemID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, bookItemID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                authorList.add(new Author(rs.getString("ID"), rs.getString("FullName"), rs.getString("Biography"), rs.getString("Address"), rs.getString("Email"), rs.getDate("dob")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return authorList;
    }

    private List<BookItem> extractBookItemListFromResultSet(Connection connection, ResultSet rs) throws SQLException {
        List<BookItem> bookItemList = new ArrayList<>();
        while (rs.next()) {
            BookItem bookItem = new BookItem();
            bookItem.setId(rs.getString("ID"));
            bookItem.setISBN(rs.getString("ISBN"));
            bookItem.setTitle(rs.getString("Title"));
            bookItem.setSummary(rs.getString("Summary"));
            bookItem.setCategory(new Category(rs.getString("CategoryID"), rs.getString("categoryname"), rs.getInt("quantitycategory")));
            bookItem.setPublicationDate(rs.getDate("PublicationDate"));
            bookItem.setNumberOfPage(rs.getInt("NumberOfPage"));
            bookItem.setSalePrice(rs.getDouble("BuyPrice"));
            bookItem.setQuantity(rs.getInt("Quantity"));
            bookItem.setSoldQuantity(rs.getInt("SoldQuantity"));
            bookItem.setCreateDate(rs.getDate("CreateDate"));
            bookItem.setWeight(rs.getDouble("Weight"));
            bookItem.setSize(rs.getString("Size"));
            bookItem.setPublisher(new Publisher(rs.getString("PublisherID"), rs.getString("Name"), rs.getString("Address")));
            bookItem.setAuthorList(getAuthorListByBookItemID(connection, bookItem.getId()));
            bookItem.setImageList(getImageListByBookItemID(connection, bookItem.getId()));
            bookItemList.add(bookItem);
        }
        return bookItemList;
    }
}
