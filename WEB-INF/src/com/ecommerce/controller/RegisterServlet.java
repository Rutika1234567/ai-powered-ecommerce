package com.ecommerce.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import com.ecommerce.dao.UserDAO;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        UserDAO dao = new UserDAO();
        dao.register(
            req.getParameter("name"),
            req.getParameter("email"),
            req.getParameter("password")
        );
        res.sendRedirect("login.jsp");
    }
}
