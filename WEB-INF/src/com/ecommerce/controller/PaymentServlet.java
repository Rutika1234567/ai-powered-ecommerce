package com.ecommerce.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class PaymentServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

String payment = request.getParameter("payment");

if(payment.equals("upi")){
response.sendRedirect("upi-payment.jsp");
}
else{
response.sendRedirect("confirm-order.jsp");
}

}
}


