package com.ecommerce.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import com.ecommerce.dao.OrderDAO;

public class CancelOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(req.getParameter("orderId"));

        OrderDAO dao = new OrderDAO();
        dao.updateOrderStatus(orderId, "Cancelled");

        res.sendRedirect("myOrders.jsp");
    }
}
