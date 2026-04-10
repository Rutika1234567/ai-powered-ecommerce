package com.ecommerce.seller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.ecommerce.dao.DBUtil;

public class SellerLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try (Connection con = DBUtil.getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM sellers WHERE email=? AND password=?"
            );
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("sellerId", rs.getInt("id"));
                session.setAttribute("sellerName", rs.getString("name"));

                res.sendRedirect("seller-dashboard.jsp");
            } else {
                res.sendRedirect("seller-login.jsp?error=invalid");
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Login Failed");
        }
    }
}
