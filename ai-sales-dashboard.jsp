<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,com.ecommerce.dao.OrderDAO,com.ecommerce.model.AIProductInsight" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AI Sales Analytics</title>
    <link rel="stylesheet" href="css/user-base.css">
</head>
<body>

<div class="container">
    <h2>🤖 AI Business Insights</h2>
    <p>Smart recommendations based on sales data</p>

<%
OrderDAO dao = new OrderDAO();
List<AIProductInsight> insights = dao.getAIProductInsights();
%>

<table border="1" width="100%" cellpadding="8">
    <tr>
        <th>Product</th>
        <th>Total Sold</th>
        <th>AI Suggestion</th>
    </tr>

<%
for (AIProductInsight ai : insights) {
%>
    <tr>
        <td><%= ai.getProductName() %></td>
        <td><%= ai.getTotalSold() %></td>
        <td><%= ai.getSuggestion() %></td>
    </tr>
<%
}
%>

</table>
</div>

</body>
</html>
