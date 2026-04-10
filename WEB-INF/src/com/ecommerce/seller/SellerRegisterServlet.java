package com.ecommerce.seller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.ecommerce.dao.DBUtil;

public class SellerRegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String category = req.getParameter("category");

        try (Connection con = DBUtil.getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO sellers(name,email,password,category) VALUES(?,?,?,?)"
            );

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, category);

            ps.executeUpdate();

            // SUCCESS → go to seller login
            res.sendRedirect("seller-login.jsp");

        } catch (SQLIntegrityConstraintViolationException e) {
            // Email already exists
            res.sendRedirect("seller-login.jsp?error=exists");

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Seller Registration Failed");
        }
    }
}
