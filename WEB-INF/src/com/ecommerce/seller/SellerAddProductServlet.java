package com.ecommerce.seller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.ecommerce.dao.DBUtil;

public class SellerAddProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        Integer sellerId = (Integer) session.getAttribute("sellerId");

        if (sellerId == null) {
            res.sendRedirect("seller-login.jsp");
            return;
        }

        try {
            // Basic fields
            String name = req.getParameter("name");
            String category = req.getParameter("category");
            String image = req.getParameter("image");

            // SAFE parsing
            double price = 0;
            String priceParam = req.getParameter("price");
            if (priceParam != null && !priceParam.isEmpty()) {
                price = Double.parseDouble(priceParam);
            }

            // IMPORTANT: stock → quantity
            int quantity = 0;
            String stockParam = req.getParameter("stock");
            if (stockParam != null && !stockParam.isEmpty()) {
                quantity = Integer.parseInt(stockParam);
            }

            // Sizes
            String[] sizes = req.getParameterValues("size");
            String size = null;
            if (sizes != null) {
                size = String.join(",", sizes);
            }

            String description = req.getParameter("description");

            Connection con = DBUtil.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO products(name, price, quantity, image, category, size, description, seller_id) VALUES(?,?,?,?,?,?,?,?)"
            );

            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setInt(3, quantity);  // DB uses quantity
            ps.setString(4, image);
            ps.setString(5, category);
            ps.setString(6, size);
            ps.setString(7, description);
            ps.setInt(8, sellerId);

            ps.executeUpdate();

            res.sendRedirect("seller-my-products.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error adding product");
        }
    }
}