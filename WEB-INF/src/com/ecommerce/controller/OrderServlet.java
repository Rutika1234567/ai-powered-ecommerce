package com.ecommerce.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;
import com.ecommerce.dao.OrderDAO;
import com.ecommerce.model.CartItem;

public class OrderServlet extends HttpServlet {
protected void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {

    HttpSession session = req.getSession();   //  FIXED

    Integer userId = (Integer) session.getAttribute("userId");
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

  

    if (userId == null) {
    res.sendRedirect("login.jsp");
    return;
}

if (cart == null || cart.isEmpty()) {
    res.sendRedirect("cart.jsp");
    return;
}

    double total = 0;
    for (CartItem item : cart) {
        total += item.getPrice() * item.getQuantity();
    }

    OrderDAO dao = new OrderDAO();
    int orderId = dao.saveOrder(userId, total);
    dao.saveOrderItems(orderId, cart);   //  WILL EXECUTE NOW

    session.removeAttribute("cart");
    res.sendRedirect("myOrders.jsp");
}

}
