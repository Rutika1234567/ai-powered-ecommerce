package com.ecommerce.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

import com.ecommerce.dao.ProductDAO;

public class AdminServlet extends HttpServlet {

   protected void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {

    String action = req.getParameter("action");

    ProductDAO dao = new ProductDAO();

    if ("add".equals(action)) {

        String name = req.getParameter("name");
        String category = req.getParameter("category");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String size = req.getParameter("size");
        String image = req.getParameter("image");

        dao.addProduct(name, category, price, quantity, image, size);
    }

  else if ("update".equals(action)) {

    System.out.println("UPDATE ACTION CALLED");

    int id = Integer.parseInt(req.getParameter("id"));
    String name = req.getParameter("name");
    String category = req.getParameter("category");   //  added
    double price = Double.parseDouble(req.getParameter("price"));
    int quantity = Integer.parseInt(req.getParameter("quantity"));
    String size = req.getParameter("size");
    String image = req.getParameter("image");

 dao.addProduct(name, category, price, quantity, image, size);
}

    else if ("delete".equals(action)) {

        int id = Integer.parseInt(req.getParameter("id"));
        dao.deleteProduct(id);
    }

    res.sendRedirect("admin/viewProducts.jsp");
}
}