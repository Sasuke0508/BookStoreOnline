package com.ptit.bookstore.bookstoreonline.model.user;

import com.ptit.bookstore.bookstoreonline.model.enumaration.Gender;
import com.ptit.bookstore.bookstoreonline.model.enumaration.Role;

import java.util.Date;

public class User {
    private String id;
    private Gender gender;
    private String email;
    private String phoneNumber;
    private Date dob;
    private Role role;
    private Address address;
    private Account account;
    private FullName fullName;

    public User() {
    }

    public User(Gender gender, String email, String phoneNumber, Date dob, Role role, Address address, Account account, FullName fullName) {
        this.gender = gender;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.dob = dob;
        this.role = role;
        this.address = address;
        this.account = account;
        this.fullName = fullName;
    }

    public User(String id, Gender gender, String email, String phoneNumber, Date dob, Role role, Address address, Account account, FullName fullName) {
        this.id = id;
        this.gender = gender;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.dob = dob;
        this.role = role;
        this.address = address;
        this.account = account;
        this.fullName = fullName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public FullName getFullName() {
        return fullName;
    }

    public void setFullName(FullName fullName) {
        this.fullName = fullName;
    }
}
