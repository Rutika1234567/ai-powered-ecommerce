package com.ecommerce.controller;


import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import com.ecommerce.model.CartItem;

public class UpdateCartServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    int productId = Integer.parseInt(request.getParameter("productId"));
    String action = request.getParameter("action");

    HttpSession session = request.getSession();
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

    if(cart != null){

        for(CartItem item : cart){

            if(item.getProductId() == productId){

                if(action.equals("increase")){
                    item.setQuantity(item.getQuantity()+1);
                }

                else if(action.equals("decrease")){
                    if(item.getQuantity()>1){
                        item.setQuantity(item.getQuantity()-1);
                    }
                }

                else if(action.equals("remove")){
                    cart.remove(item);
                    break;
                }
            }
        }
    }

    response.sendRedirect("cart.jsp");
}
}