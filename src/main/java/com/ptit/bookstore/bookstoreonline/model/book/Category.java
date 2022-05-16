package com.ptit.bookstore.bookstoreonline.model.book;

public class Category {
    private String id;
    private String name;
    private int numberOfBook;

    public Category() {
    }

    public Category(String name, int numberOfBook) {
        this.name = name;
        this.numberOfBook = numberOfBook;
    }

    public Category(String id, String name, int numberOfBook) {
        this.id = id;
        this.name = name;
        this.numberOfBook = numberOfBook;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNumberOfBook() {
        return numberOfBook;
    }

    public void setNumberOfBook(int numberOfBook) {
        this.numberOfBook = numberOfBook;
    }
}
