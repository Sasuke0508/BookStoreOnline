package com.ptit.bookstore.bookstoreonline.model.order;

public class Shipment {
    private String id;
    private String address;
    private String note;
    private String phoneNumber;
    private ShipmentType shipmentType;

    public Shipment() {
    }

    public Shipment(String address, String note, String phoneNumber, ShipmentType shipmentType){
        this.address = address;
        this.note = note;
        this.phoneNumber = phoneNumber;
        this.shipmentType = shipmentType;
    }

    public Shipment(String id, String address, String note, String phoneNumber, ShipmentType shipmentType) {
        this.id = id;
        this.address = address;
        this.note = note;
        this.phoneNumber = phoneNumber;
        this.shipmentType = shipmentType;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public ShipmentType getShipmentType() {
        return shipmentType;
    }

    public void setShipmentType(ShipmentType shipmentType) {
        this.shipmentType = shipmentType;
    }
}
