<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,com.ecommerce.dao.OrderDAO,com.ecommerce.model.Order" %>

<!DOCTYPE html>

<html>
<head>
<title>My Orders</title>

<link rel="stylesheet" href="css/user-base.css">
<link rel="stylesheet" href="css/user-orders.css">

</head>

<body>

<div class="container">

<div class="top-bar">
<h2>My Orders</h2>
<a href="ProductServlet" class="back-link">← Back to Products</a>
</div>

<%

Integer userId = (Integer) session.getAttribute("userId");

if (userId == null) {
response.sendRedirect("login.jsp");
return;
}

OrderDAO dao = new OrderDAO();
List<Order> orders = dao.getOrdersByUser(userId);

if (orders.isEmpty()) {

%>

<p>You have not placed any orders yet.</p>

<%

} else {

%>

<table class="orders-table">

<tr>
<th>Order ID</th>
<th>Order Name</th>
<th>Date</th>
<th>Total (₹)</th>
<th>Status</th>
<th>Action</th>
<th>Rating</th>
</tr>

<%

for (Order o : orders) {

%>

<tr>

<td><%= o.getId() %></td>

<td>
<%= (o.getProductName() != null) 
? o.getProductName() 
: "Product unavailable" %>
</td>

<td><%= o.getOrderDate() %></td>

<td><%= o.getTotal() %></td>

<td class="order-status"><%= o.getStatus() %></td>

<td>
<% if ("Placed (COD)".equals(o.getStatus())) { %>

<form action="CancelOrderServlet" method="post">

<input type="hidden" name="orderId" value="<%= o.getId() %>">

<button class="cancel-btn">Cancel</button>

</form>

<% } %>

</td>

<!-- ⭐ Rating column added safely -->

<td>

<form action="AddReviewServlet" method="post">

<input type="hidden" name="productId" value="<%= o.getProductId() %>">

<select name="rating">

<option value="">Rate</option>
<option value="5">⭐⭐⭐⭐⭐</option>
<option value="4">⭐⭐⭐⭐</option>
<option value="3">⭐⭐⭐</option>
<option value="2">⭐⭐</option>
<option value="1">⭐</option>

</select>

<button type="submit">Submit</button>

</form>

</td>

</tr>

<%

}

%>

</table>

<%

}

%>

</div>

</body>
</html>
