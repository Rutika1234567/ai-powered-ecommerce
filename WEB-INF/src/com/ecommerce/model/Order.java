package com.ecommerce.model;

import java.sql.Timestamp;

public class Order {
    private int id;
    private int userId;
    private int productId;
    private double total;
    private String status;
    private Timestamp orderDate;
    private String productName;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

      public int getProductId() { return productId; }   //  ADD
    public void setProductId(int productId) { this.productId = productId; }  //  ADD

    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Timestamp getOrderDate() { return orderDate; }
    public void setOrderDate(Timestamp orderDate) { this.orderDate = orderDate; }

public String getProductName() {
    return productName;
}

public void setProductName(String productName) {
    this.productName = productName;
}
}
