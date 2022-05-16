package com.ptit.bookstore.bookstoreonline.model.user;

public class Address {
    private String id;
    private String country;
    private String province;
    private String district;
    private String street;

    public Address() {
    }

    public Address(String id, String country, String province, String district, String street) {
        this.id = id;
        this.country = country;
        this.province = province;
        this.district = district;
        this.street = street;
    }

    public Address(String country, String province, String district, String street) {
        this.country = country;
        this.province = province;
        this.district = district;
        this.street = street;
    }

    public String getId() {
        return id;
    }

    public String getCountry() {
        return country;
    }

    public String getProvince() {
        return province;
    }

    public String getDistrict() {
        return district;
    }

    public String getStreet() {
        return street;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public void setStreet(String street) {
        this.street = street;
    }
}
