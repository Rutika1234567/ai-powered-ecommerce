
package com.ecommerce.dao;

import java.sql.*;
import java.util.*;
import com.ecommerce.model.Product;

public class ProductDAO {

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        try (Connection con = DBUtil.getConnection()) {
            ResultSet rs = con.createStatement()
                .executeQuery("SELECT * FROM products");

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setCategory(rs.getString("category"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));  // 
                p.setSize(rs.getString("size"));
                p.setImage(rs.getString("image"));
                p.setSellerId((Integer) rs.getObject("seller_id"));
                p.setTags(rs.getString("tags"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> searchProducts(String keyword) {
        List<Product> list = new ArrayList<>();
        try (Connection con = DBUtil.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM products WHERE name LIKE ?"
            );
            ps.setString(1, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setCategory(rs.getString("category"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity")); // 
                p.setSize(rs.getString("size"));
                p.setImage(rs.getString("image"));
                p.setSellerId((Integer) rs.getObject("seller_id"));
                p.setTags(rs.getString("tags"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductsByCategory(String category) {
        List<Product> list = new ArrayList<>();
        try (Connection con = DBUtil.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM products WHERE category=?"
            );
            ps.setString(1, category);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setCategory(rs.getString("category"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity")); // 
                p.setSize(rs.getString("size"));
                p.setImage(rs.getString("image"));
                p.setSellerId((Integer) rs.getObject("seller_id"));
                p.setTags(rs.getString("tags"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Product getProductById(int id) {
        Product p = null;
        try (Connection con = DBUtil.getConnection()) {
            PreparedStatement ps =
                con.prepareStatement("SELECT * FROM products WHERE id=?");
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setCategory(rs.getString("category"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity")); // 
                p.setSize(rs.getString("size"));
                p.setImage(rs.getString("image"));
                p.setSellerId((Integer) rs.getObject("seller_id"));
                p.setTags(rs.getString("tags"));
                p.setDescription(rs.getString("description"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

  public void addProduct(String name, String category, double price,
                      int quantity, String image, String size, String description) {

    try (Connection con = DBUtil.getConnection()) {

       PreparedStatement ps = con.prepareStatement(
    "INSERT INTO products(name, category, price, quantity, image, size, description) VALUES (?,?,?,?,?,?,?)"
);

ps.setString(1, name);
ps.setString(2, category);
ps.setDouble(3, price);
ps.setInt(4, quantity);
ps.setString(5, image);
ps.setString(6, size);
ps.setString(7, description);

        //  IMPORTANT PART
        if (size == null || size.isEmpty()) {
            ps.setNull(6, java.sql.Types.VARCHAR);
        } else {
            ps.setString(6, size);
        }

        ps.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }
}
public void updateProduct(int id, String name, String category, double price, int quantity, String image, String size) {

    try (Connection con = DBUtil.getConnection()) {

        PreparedStatement ps = con.prepareStatement(
            "UPDATE products SET name=?, category=?, price=?, quantity=?, image=?, size=? WHERE id=?"
        );

        ps.setString(1, name);
        ps.setString(2, category);
        ps.setDouble(3, price);
        ps.setInt(4, quantity);
        

        ps.setString(5, image);
        ps.setString(6, size);

        if (size == null || size.isEmpty()) {
            ps.setNull(6, java.sql.Types.VARCHAR);
        } else {
            ps.setString(6, size);
        }

        ps.setInt(7, id);

        ps.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }
}

public void deleteProduct(int id) {
    try (Connection con = DBUtil.getConnection()) {

        PreparedStatement ps =
            con.prepareStatement("DELETE FROM products WHERE id=?");

        ps.setInt(1, id);
        ps.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }
}

public double getAverageRating(int productId) {
    double rating = 0;

    try {
        Connection con = DBUtil.getConnection();

        String sql = "SELECT AVG(rating) as avg_rating FROM product_reviews WHERE product_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, productId);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            rating = rs.getDouble("avg_rating");
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return rating;
}


public List<Product> getFilteredProducts(String category, String search,
        String gender, String color, String size,
        String price, String rating, String sort) {

    List<Product> list = new ArrayList<>();

    String query = "SELECT * FROM products WHERE 1=1";

    // Dynamic filters
    if (category != null && !category.isEmpty()) {
        query += " AND category=?";
    }

    if (search != null && !search.isEmpty()) {
        query += " AND name LIKE ?";
    }

    if (gender != null && !gender.isEmpty()) {
        query += " AND gender=?";
    }

    if (color != null && !color.isEmpty()) {
        query += " AND color=?";
    }

    if (size != null && !size.isEmpty()) {
        query += " AND size=?";
    }

    if (price != null && !price.isEmpty()) {
        query += " AND price <= ?";
    }

    // Sorting
    if ("high".equals(sort)) {
        query += " ORDER BY price DESC";
    } else if ("low".equals(sort)) {
        query += " ORDER BY price ASC";
    }

    try (Connection con = DBUtil.getConnection()) {

        PreparedStatement ps = con.prepareStatement(query);

        int i = 1;

        if (category != null && !category.isEmpty()) {
            ps.setString(i++, category);
        }

        if (search != null && !search.isEmpty()) {
            ps.setString(i++, "%" + search + "%");
        }

        if (gender != null && !gender.isEmpty()) {
            ps.setString(i++, gender);
        }

        if (color != null && !color.isEmpty()) {
            ps.setString(i++, color);
        }

        if (size != null && !size.isEmpty()) {
            ps.setString(i++, size);
        }

        if (price != null && !price.isEmpty()) {
            ps.setDouble(i++, Double.parseDouble(price));
        }

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Product p = new Product();

            p.setId(rs.getInt("id"));
            p.setName(rs.getString("name"));
            p.setCategory(rs.getString("category"));
            p.setPrice(rs.getDouble("price"));
            p.setQuantity(rs.getInt("quantity"));
            p.setImage(rs.getString("image"));
            p.setSellerId((Integer) rs.getObject("seller_id"));
            p.setTags(rs.getString("tags"));

            list.add(p);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}




}
