package com.ecommerce.model;

public class CartItem {
    private int productId;
    private int quantity;
    private double price;
    private String size;


   public CartItem(int productId, int quantity, double price, String size) {
    this.productId = productId;
    this.quantity = quantity;
    this.price = price;
    this.size = size;
}

    public int getProductId() {
        return productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getPrice() {
        return price;
    }

    // ADD THIS METHOD
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }



    public String getSize() {
    return size;
}

public void setSize(String size) {
    this.size = size;
}



}