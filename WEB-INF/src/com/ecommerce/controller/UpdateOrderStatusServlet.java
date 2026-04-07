package com.ecommerce.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import com.ecommerce.dao.OrderDAO;

public class UpdateOrderStatusServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(req.getParameter("orderId"));
        String newStatus = req.getParameter("status");

        OrderDAO dao = new OrderDAO();

        //  CHECK CURRENT STATUS
        String currentStatus = dao.getOrderStatus(orderId);

        //  Do NOT allow update if already cancelled
        if ("Cancelled".equals(currentStatus)) {
            res.sendRedirect("admin/viewOrders.jsp");
            return;
        }

        dao.updateOrderStatus(orderId, newStatus);
        res.sendRedirect("admin/viewOrders.jsp");
    }
}
