package com.paytm;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class InitiatePaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String amount = request.getParameter("amount");
        String orderId = "ORD" + System.currentTimeMillis();

        try {

            //  Get all params from service (NO DUPLICATE)
            Map<String, String> params = PaytmService.getPaymentParams(orderId, amount);

            //  Generate checksum
            String checksum = ChecksumService.generateChecksum(params, PaytmConfig.MERCHANT_KEY);

            //  Debug (check in console)
            System.out.println("OrderID: " + orderId);
            System.out.println("Amount: " + amount);
            System.out.println("Params size: " + params.size());

            //  Send to JSP
            request.setAttribute("params", params);
            request.setAttribute("checksum", checksum);

            //  CORRECT PATH (VERY IMPORTANT)
            RequestDispatcher rd = request.getRequestDispatcher("/paytmRedirect.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            // show error on browser (instead of blank page)
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}