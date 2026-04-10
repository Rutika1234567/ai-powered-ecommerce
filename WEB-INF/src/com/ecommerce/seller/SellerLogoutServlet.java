package com.ecommerce.seller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class SellerLogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        res.sendRedirect("seller-login.jsp");
    }
}
