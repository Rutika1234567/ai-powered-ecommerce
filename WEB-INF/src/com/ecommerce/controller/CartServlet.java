package com.ecommerce.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;
import com.ecommerce.model.CartItem;
import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;

public class CartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int productId = Integer.parseInt(req.getParameter("pid"));
        int qty = Integer.parseInt(req.getParameter("qty"));
         
        String size = req.getParameter("size");

        HttpSession session = req.getSession();

        List<CartItem> cart =
                (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        //  fetch product price safely
        ProductDAO pdao = new ProductDAO();
        Product p = pdao.getProductById(productId);

      if (p != null) {

    boolean found = false;

    for (CartItem c : cart) {

        if (c.getProductId() == productId &&
            ((c.getSize() == null && size == null) ||
             (c.getSize() != null && c.getSize().equals(size)))) {

            c.setQuantity(c.getQuantity() + qty);
            found = true;
            break;
        }
    }

    if (!found) {
        CartItem item = new CartItem(productId, qty, p.getPrice(), size);
        cart.add(item);
    }

        

        }

        session.setAttribute("cart", cart);
        res.sendRedirect("cart.jsp");
    }
}
