package com.ptit.bookstore.bookstoreonline.model.order;

import com.ptit.bookstore.bookstoreonline.model.enumaration.CODStatus;

import java.util.Date;

public class COD extends  Payment{
    private CODStatus paymentStatus;

    public COD() {
    }

    public COD(String id, double amount, Date createTime, CODStatus paymentStatus) {
        super(id, amount, createTime);
        this.paymentStatus = paymentStatus;
    }

    public CODStatus getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(CODStatus paymentStatus) {
        this.paymentStatus = paymentStatus;
    }
}
