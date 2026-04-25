package com.paytm;

import javax.servlet.*;
import javax.servlet.http.*;

import com.ecommerce.dao.DBUtil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class CallbackServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderId = request.getParameter("ORDERID");
        String txnId = request.getParameter("TXNID");
        String amount = request.getParameter("TXNAMOUNT");
        String status = request.getParameter("STATUS");

        try {
            Connection con = DBUtil.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO payments(order_id, txn_id, amount, status) VALUES(?,?,?,?)"
            );

            ps.setString(1, orderId);
            ps.setString(2, txnId);
            ps.setString(3, amount);
            ps.setString(4, status);

            ps.executeUpdate();

            if ("TXN_SUCCESS".equals(status)) {
                response.sendRedirect("success.jsp");
            } else {
                response.sendRedirect("fail.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}