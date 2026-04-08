package com.ecommerce.model;

public class Product {

    private int id;
    private String name;
    private String category;
    private double price;

    // OLD FIELD (kept for compatibility)
    private int stock;

    // NEW FIELD (used by DB)
    private int quantity;

    private String image;
    private Integer sellerId;

    // ========================
    // ID
    // ========================
    public int getId() { 
        return id; 
    }

    public void setId(int id) { 
        this.id = id; 
    }

    // ========================
    // NAME
    // ========================
    public String getName() { 
        return name; 
    }

    public void setName(String name) { 
        this.name = name; 
    }

    // ========================
    // CATEGORY
    // ========================
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    // ========================
    // PRICE
    // ========================
    public double getPrice() { 
        return price; 
    }

    public void setPrice(double price) { 
        this.price = price; 
    }

    // ========================
    // OLD STOCK (for old code)
    // ========================
    public int getStock() { 
        return stock; 
    }

    public void setStock(int stock) { 
        this.stock = stock; 
    }

    // ========================
    // NEW QUANTITY (DB uses this)
    // ========================
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
        this.stock = quantity;   // 🔥 keep both in sync (important)
    }

    // ========================
    // IMAGE
    // ========================
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    // ========================
    // SELLER ID
    // ========================
    public Integer getSellerId() {
        return sellerId;
    }

    public void setSellerId(Integer sellerId) {
        this.sellerId = sellerId;
    }
    private String tags;

public String getTags() {
    return tags;
}

public void setTags(String tags) {
    this.tags = tags;
}



private String size;

public String getSize() {
    return size;
}

public void setSize(String size) {
    this.size = size;
}


private String description;

public String getDescription() {
    return description;
}

public void setDescription(String description) {
    this.description = description;
}


}
