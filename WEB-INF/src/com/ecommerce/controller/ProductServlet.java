package com.ecommerce.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;

public class ProductServlet extends HttpServlet {


    protected void doGet(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {

    // Get all filters from JSP
    String category = req.getParameter("category");
    String search = req.getParameter("search");
    String gender = req.getParameter("gender");
    String color = req.getParameter("color");
    String size = req.getParameter("size");
    String price = req.getParameter("price");
    String rating = req.getParameter("rating");
    String sort = req.getParameter("sort");

    ProductDAO dao = new ProductDAO();

    // NEW METHOD (single entry point)
    List<Product> products = dao.getFilteredProducts(
            category, search, gender, color, size, price, rating, sort
    );

    req.setAttribute("products", products);
    req.getRequestDispatcher("products.jsp").forward(req, res);
}


}
