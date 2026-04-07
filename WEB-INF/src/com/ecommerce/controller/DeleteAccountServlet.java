package com.ecommerce.controller;

import com.ecommerce.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteAccountServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        UserDAO dao = new UserDAO();
        dao.deleteUser(userId);

        session.invalidate();
        res.sendRedirect("register.jsp");
    }
}
