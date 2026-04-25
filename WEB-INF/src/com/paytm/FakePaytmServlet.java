package com.paytm;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class FakePaytmServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String mobile = request.getParameter("mobile");

        //  VALIDATION
        if (mobile == null || !mobile.matches("\\d{10}")) {
            request.setAttribute("error", "Invalid mobile number (Enter 10 digits)");
            RequestDispatcher rd = request.getRequestDispatcher("fakePaytm.jsp");
            rd.forward(request, response);
            return;
        }

        // GET AMOUNT FROM SESSION (BEST WAY)
        Object amountObj = request.getSession().getAttribute("amount");
        String amount = (amountObj != null) ? amountObj.toString() : "0";

        request.setAttribute("amount", amount);
        request.setAttribute("message", "Payment Successful via Paytm");

        RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
        rd.forward(request, response);
    }
}