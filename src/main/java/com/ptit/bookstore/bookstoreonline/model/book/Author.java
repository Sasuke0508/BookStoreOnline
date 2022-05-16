package com.ptit.bookstore.bookstoreonline.model.book;

import java.util.Date;

public class Author {
    private String id;
    private String fullName;
    private String biography;
    private String email;
    private String address;
    private Date dob;

    public Author() {
    }

    public Author(String fullName, String biography, String email, String address, Date dob) {
        this.fullName = fullName;
        this.biography = biography;
        this.email = email;
        this.address = address;
        this.dob = dob;
    }

    public Author(String id, String fullName, String biography, String email, String address, Date dob) {
        this.id = id;
        this.fullName = fullName;
        this.biography = biography;
        this.email = email;
        this.address = address;
        this.dob = dob;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getBiography() {
        return biography;
    }

    public void setBiography(String biography) {
        this.biography = biography;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }
}
