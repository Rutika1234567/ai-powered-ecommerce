package com.ecommerce.controller;

import com.ecommerce.dao.ChatDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;

@WebServlet("/ChatServlet")
public class ChatServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        int userId = (int) session.getAttribute("userId");
        String role = (String) session.getAttribute("role");

        String message = request.getParameter("message");

        ChatDAO.saveMessage(userId,role,message);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        for(String msg : ChatDAO.getMessages(userId)){
            out.println(msg);
        }
    }
}