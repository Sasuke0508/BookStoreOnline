package com.ptit.bookstore.bookstoreonline.model.order;

import java.util.Date;

public class Credit extends  Payment{
    private  String number;
    private String cardHolder;
    private Date expireDate;

    public Credit() {
    }

    public Credit(String id, double amount, Date createTime, String number, String cardHolder, Date expireDate) {
        super(id, amount, createTime);
        this.number = number;
        this.cardHolder = cardHolder;
        this.expireDate = expireDate;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getCardHolder() {
        return cardHolder;
    }

    public void setCardHolder(String cardHolder) {
        this.cardHolder = cardHolder;
    }

    public Date getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(Date expireDate) {
        this.expireDate = expireDate;
    }
}
