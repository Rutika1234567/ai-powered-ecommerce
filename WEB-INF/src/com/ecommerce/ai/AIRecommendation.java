package com.ecommerce.ai;

import java.util.List;
import com.ecommerce.model.Product;

public class AIRecommendation {

private List<Product> products;
private double totalPrice;
private double discount;

public List<Product> getProducts() { return products; }
public void setProducts(List<Product> products) { this.products = products; }

public double getTotalPrice() { return totalPrice; }
public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }

public double getDiscount() { return discount; }
public void setDiscount(double discount) { this.discount = discount; }

}