package com.ptit.bookstore.bookstoreonline.model.user;

import com.ptit.bookstore.bookstoreonline.model.enumaration.Gender;
import com.ptit.bookstore.bookstoreonline.model.enumaration.Role;

import java.util.Date;

public class Staff extends User{
    private String position;
    private double rate;

    public Staff() {
    }

    public Staff(String id, Gender gender, String email, String phoneNumber, Date dob, Role role, Address address, Account account, FullName fullName, String position, double rate) {
        super(id, gender, email, phoneNumber, dob, role, address, account, fullName);
        this.position = position;
        this.rate = rate;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }
}
