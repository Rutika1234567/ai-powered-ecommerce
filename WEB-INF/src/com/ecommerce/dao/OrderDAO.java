package com.ecommerce.dao;

import java.sql.*;
import java.util.*;
import com.ecommerce.dao.DBUtil;

import com.ecommerce.model.Order;
import com.ecommerce.model.CartItem;

public class OrderDAO {


public List<Order> getOrdersByUser(int userId) {
    List<Order> list = new ArrayList<>();

    String sql =
        "SELECT o.id AS order_id, o.user_id, o.total, o.status, o.order_date, " +
        "oi.product_id, " +
        "GROUP_CONCAT(p.name SEPARATOR ', ') AS product_name " +
        "FROM orders o " +
        "LEFT JOIN order_items oi ON o.id = oi.order_id " +
        "LEFT JOIN products p ON oi.product_id = p.id " +
        "WHERE o.user_id = ? " +
        "GROUP BY o.id, o.user_id, o.total, o.status, o.order_date, oi.product_id " +
        "ORDER BY o.order_date DESC";

    try (Connection con = DBUtil.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {

            Order o = new Order();

            o.setId(rs.getInt("order_id"));
            o.setUserId(rs.getInt("user_id"));
            o.setProductId(rs.getInt("product_id"));   // now exists
            o.setTotal(rs.getDouble("total"));
            o.setStatus(rs.getString("status"));
            o.setOrderDate(rs.getTimestamp("order_date"));
            o.setProductName(rs.getString("product_name"));

            list.add(o);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}


public void updateOrderStatus(int orderId, String status) {
    try (Connection con = DBUtil.getConnection()) {
        PreparedStatement ps =
            con.prepareStatement("UPDATE orders SET status=? WHERE id=?");
        ps.setString(1, status);
        ps.setInt(2, orderId);
        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}


public List<Order> getAllOrders() {
    List<Order> list = new ArrayList<>();

    try (Connection con = DBUtil.getConnection()) {
        PreparedStatement ps =
            con.prepareStatement(
                "SELECT id, user_id, total, status, order_date FROM orders ORDER BY order_date DESC"
            );

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Order o = new Order();
            o.setId(rs.getInt("id"));
            o.setUserId(rs.getInt("user_id"));
            o.setTotal(rs.getDouble("total"));
            o.setStatus(rs.getString("status"));
            o.setOrderDate(rs.getTimestamp("order_date"));
            list.add(o);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}


public String getOrderStatus(int orderId) {
    String status = null;

    try (Connection con = DBUtil.getConnection()) {
        PreparedStatement ps =
            con.prepareStatement("SELECT status FROM orders WHERE id=?");
        ps.setInt(1, orderId);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            status = rs.getString("status");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    return status;
}



public int saveOrder(int userId, double total) {

    int orderId = 0;

    try (Connection con = DBUtil.getConnection()) {

        PreparedStatement ps =
            con.prepareStatement(
                "INSERT INTO orders(user_id, total, status) VALUES (?, ?, ?)",
                Statement.RETURN_GENERATED_KEYS
            );

        ps.setInt(1, userId);
        ps.setDouble(2, total);
        ps.setString(3, "Placed (COD)");
        ps.executeUpdate();

        ResultSet rs = ps.getGeneratedKeys();
        if (rs.next()) {
            orderId = rs.getInt(1);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return orderId;
}




public void saveOrderItems(int orderId, List<CartItem> cart) {

    String sql =
        "INSERT INTO order_items(order_id, product_id, quantity, price) VALUES (?,?,?,?)";

    try (Connection con = DBUtil.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        for (CartItem item : cart) {
            ps.setInt(1, orderId);
            ps.setInt(2, item.getProductId());
            ps.setInt(3, item.getQuantity());
            ps.setDouble(4, item.getPrice());
            ps.executeUpdate();
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
}


// ================================
// AI SALES INSIGHTS (RULE-BASED AI)
// ================================
public List<com.ecommerce.model.AIProductInsight> getAIProductInsights() {

    List<com.ecommerce.model.AIProductInsight> list = new ArrayList<>();

    String sql =
        "SELECT p.name, COALESCE(SUM(oi.quantity),0) AS total_sold " +
        "FROM products p " +
        "LEFT JOIN order_items oi ON p.id = oi.product_id " +
        "GROUP BY p.id";

    try (Connection con = DBUtil.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            String name = rs.getString("name");
            int totalSold = rs.getInt("total_sold");

            com.ecommerce.model.AIProductInsight ai =
                new com.ecommerce.model.AIProductInsight();

            ai.setProductName(name);
            ai.setTotalSold(totalSold);

            // ===== AI BUSINESS RULES =====
            String suggestion;
        if (totalSold == 0) {
    suggestion = "Not selling - Apply discount or consider removal";
} else if (totalSold <= 2) {
    suggestion = "Slow moving - Run promotions or ads";
} else if (totalSold <= 5) {
    suggestion = "Average sales - Maintain stock and monitor";
} else {
    suggestion = "High demand - Increase stock and feature product";
}


            ai.setSuggestion(suggestion);
            list.add(ai);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}


}




