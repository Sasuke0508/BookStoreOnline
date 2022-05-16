package com.ptit.bookstore.bookstoreonline.model.order;

import java.util.Date;

public class ElectricWallet extends Payment{
    private String walletHolder;
    private String walletNumber;

    public ElectricWallet() {
    }

    public ElectricWallet(String id, double amount, Date createTime, String walletHolder, String walletNumber) {
        super(id, amount, createTime);
        this.walletHolder = walletHolder;
        this.walletNumber = walletNumber;
    }

    public String getWalletHolder() {
        return walletHolder;
    }

    public void setWalletHolder(String walletHolder) {
        this.walletHolder = walletHolder;
    }

    public String getWalletNumber() {
        return walletNumber;
    }

    public void setWalletNumber(String walletNumber) {
        this.walletNumber = walletNumber;
    }
}
