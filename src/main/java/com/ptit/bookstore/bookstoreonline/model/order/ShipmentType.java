package com.ptit.bookstore.bookstoreonline.model.order;

public class ShipmentType {
    private String id;
    private String type;
    private double feeShip;

    public ShipmentType() {
    }

    public ShipmentType(String type, double feeShip) {
        this.type = type;
        this.feeShip = feeShip;
    }

    public ShipmentType(String id, String type, double feeShip) {
        this.id = id;
        this.type = type;
        this.feeShip = feeShip;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getFeeShip() {
        return feeShip;
    }

    public void setFeeShip(double feeShip) {
        this.feeShip = feeShip;
    }
}
