package com.ecommerce.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

import com.ecommerce.dao.ProductDAO;

@WebServlet("/AdminAddProductServlet")
public class AdminAddProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String category = req.getParameter("category");
        double price = Double.parseDouble(req.getParameter("price"));
        int stock = Integer.parseInt(req.getParameter("stock"));
        String image = req.getParameter("image");
         String[] sizes = req.getParameterValues("size");
               String description = req.getParameter("description");


String size = null;

if (sizes != null) {
    size = String.join(",", sizes);   //  "S,M,L"
}
        ProductDAO dao = new ProductDAO();
        dao.addProduct(name, category, price, stock, image, size, description);
    
        res.sendRedirect("admin/viewProducts.jsp");
    }
}
