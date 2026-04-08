package com.ecommerce.model;

public class AIProductInsight {

    private String productName;
    private int totalSold;
    private String suggestion;

    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getTotalSold() {
        return totalSold;
    }
    public void setTotalSold(int totalSold) {
        this.totalSold = totalSold;
    }

    public String getSuggestion() {
        return suggestion;
    }
    public void setSuggestion(String suggestion) {
        this.suggestion = suggestion;
    }
}
