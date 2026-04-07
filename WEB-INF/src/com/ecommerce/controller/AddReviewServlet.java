package com.ecommerce.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.ecommerce.dao.DBUtil;

@WebServlet("/AddReviewServlet")
public class AddReviewServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

int productId = Integer.parseInt(request.getParameter("productId"));
int rating = Integer.parseInt(request.getParameter("rating"));

HttpSession session = request.getSession();
String email = (String) session.getAttribute("userEmail");

try {

Connection con = DBUtil.getConnection();

PreparedStatement ps = con.prepareStatement(
"INSERT INTO product_reviews(product_id,user_email,rating) VALUES(?,?,?)"
);

ps.setInt(1, productId);
ps.setString(2, email);
ps.setInt(3, rating);

ps.executeUpdate();

response.sendRedirect("myOrders.jsp");

}
catch(Exception e){
e.printStackTrace();
}

}
}