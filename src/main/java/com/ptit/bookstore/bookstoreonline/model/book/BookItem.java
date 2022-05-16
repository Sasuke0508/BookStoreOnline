package com.ptit.bookstore.bookstoreonline.model.book;

import java.util.Date;
import java.util.List;

public class BookItem {
    private String id;
    private String ISBN;
    private String title;
    private String summary;
    private Date publicationDate;
    private int numberOfPage;
    private double weight;
    private String size;
    private double salePrice;
    private int quantity;
    private Date createDate;
    private int soldQuantity;  // Số lượng sách đã bán
    private Category category;
    private List<Author> authorList;
    private Publisher publisher;
    private List<Image> imageList;

    public BookItem() {
    }

    public BookItem(String ISBN, String title, String summary, Date publicationDate, int numberOfPage, double weight, String size, double salePrice, int quantity, Date createDate, int soldQuantity, Category category, List<Author> authorList, Publisher publisher, List<Image> imageList) {
        this.ISBN = ISBN;
        this.title = title;
        this.summary = summary;
        this.publicationDate = publicationDate;
        this.numberOfPage = numberOfPage;
        this.weight = weight;
        this.size = size;
        this.salePrice = salePrice;
        this.quantity = quantity;
        this.createDate = createDate;
        this.soldQuantity = soldQuantity;
        this.category = category;
        this.authorList = authorList;
        this.publisher = publisher;
        this.imageList = imageList;
    }

    public BookItem(String id, String ISBN, String title, String summary, Date publicationDate, int numberOfPage, double weight, String size, double salePrice, int quantity, Date createDate, int soldQuantity, Category category, List<Author> authorList, Publisher publisher, List<Image> imageList) {
        this.id = id;
        this.ISBN = ISBN;
        this.title = title;
        this.summary = summary;
        this.publicationDate = publicationDate;
        this.numberOfPage = numberOfPage;
        this.weight = weight;
        this.size = size;
        this.salePrice = salePrice;
        this.quantity = quantity;
        this.createDate = createDate;
        this.soldQuantity = soldQuantity;
        this.category = category;
        this.authorList = authorList;
        this.publisher = publisher;
        this.imageList = imageList;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public Date getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(Date publicationDate) {
        this.publicationDate = publicationDate;
    }

    public int getNumberOfPage() {
        return numberOfPage;
    }

    public void setNumberOfPage(int numberOfPage) {
        this.numberOfPage = numberOfPage;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getSoldQuantity() {
        return soldQuantity;
    }

    public void setSoldQuantity(int soldQuantity) {
        this.soldQuantity = soldQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<Author> getAuthorList() {
        return authorList;
    }

    public void setAuthorList(List<Author> authorList) {
        this.authorList = authorList;
    }

    public Publisher getPublisher() {
        return publisher;
    }

    public void setPublisher(Publisher publisher) {
        this.publisher = publisher;
    }

    public List<Image> getImageList() {
        return imageList;
    }

    public void setImageList(List<Image> imageList) {
        this.imageList = imageList;
    }
}
