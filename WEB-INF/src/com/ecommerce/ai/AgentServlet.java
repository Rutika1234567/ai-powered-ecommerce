
package com.ecommerce.ai;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AgentServlet extends HttpServlet {

protected void doPost(HttpServletRequest req, HttpServletResponse res)
throws ServletException, IOException {

 req.setCharacterEncoding("UTF-8");
    res.setContentType("text/html; charset=UTF-8");
    
String query = req.getParameter("query");

/* Call AI bundle generator */

AIRecommendation rec = AIBundleEngine.generateBundle(query);

/* Send data to JSP */

req.setAttribute("products", rec.getProducts());
req.setAttribute("total", rec.getTotalPrice());
req.setAttribute("discount", rec.getDiscount());

RequestDispatcher rd = req.getRequestDispatcher("aiResult.jsp");
rd.forward(req,res);

}

}