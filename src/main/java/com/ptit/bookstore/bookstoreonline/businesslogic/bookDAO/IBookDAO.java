package com.ptit.bookstore.bookstoreonline.businesslogic.bookDAO;

import com.ptit.bookstore.bookstoreonline.model.book.Author;
import com.ptit.bookstore.bookstoreonline.model.book.BookItem;
import com.ptit.bookstore.bookstoreonline.model.book.Category;
import com.ptit.bookstore.bookstoreonline.model.book.Publisher;

import java.util.List;

public interface IBookDAO {
    public List<BookItem> getListBookItemNew(int number);
    public List<BookItem> getListBookItemBestSeller(int number);
    public BookItem getBookItemById(String bookItemId);
    public List<BookItem> getAllBookItem();
    public List<BookItem> searchBookItemByName(String bookItemName);
    public List<BookItem> searchBookItemByCategory(Category category);
    public List<BookItem> searchBookItemByPublisher(Publisher publisher);
    public List<BookItem> searchBookItemByAuthor(Author author);
    public List<BookItem> searchBookItemByPrice(double minPrice, double maxPrice);
    public void updateBookItem(BookItem bookItemEdit);
    public void deleteBookItem(String bookItemId);
}
