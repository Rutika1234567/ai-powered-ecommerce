package com.ecommerce.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

import com.ecommerce.model.CartItem;
import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;

public class BuyNowServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int pid = Integer.parseInt(req.getParameter("pid"));
        String size = req.getParameter("size");   //  get selected size

        ProductDAO dao = new ProductDAO();
        Product p = dao.getProductById(pid);

        if (p == null) {
            res.sendRedirect("ProductServlet");
            return;
        }

        // create fresh cart for Buy Now
        List<CartItem> cart = new ArrayList<>();

        //  FIXED: correct variables used
        CartItem item = new CartItem(pid, 1, p.getPrice(), size);

        cart.add(item);

        HttpSession session = req.getSession();
        session.setAttribute("cart", cart);

        res.sendRedirect("checkout.jsp");
    }
}