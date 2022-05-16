package com.ptit.bookstore.bookstoreonline.model.user;

import com.ptit.bookstore.bookstoreonline.model.enumaration.Gender;
import com.ptit.bookstore.bookstoreonline.model.enumaration.MemberLevel;
import com.ptit.bookstore.bookstoreonline.model.enumaration.Role;

import java.util.Date;

public class Customer extends User{
    private MemberLevel memberLevel;

    public Customer() {
    }

    public Customer(String id, Gender gender, String email, String phoneNumber, Date dob, Role role, Address address, Account account, FullName fullName, MemberLevel memberLevel) {
        super(id, gender, email, phoneNumber, dob, role, address, account, fullName);
        this.memberLevel = memberLevel;
    }

    public Customer(String customerID) {
        this.setId(customerID);
    }

    public MemberLevel getMemberLevel() {
        return memberLevel;
    }

    public void setMemberLevel(MemberLevel memberLevel) {
        this.memberLevel = memberLevel;
    }
}
