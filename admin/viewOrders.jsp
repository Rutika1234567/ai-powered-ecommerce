<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,com.ecommerce.dao.OrderDAO,com.ecommerce.model.Order" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Orders</title>
    
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>

<div class="admin-nav">
    <h1>Admin Panel</h1>
    <a href="adminDashboard.jsp">Dashboard</a>
    <a href="manageProducts.jsp">Manage Products</a>
    <a href="viewProducts.jsp">View Products</a>
    <a href="viewOrders.jsp">View Orders</a>
</div>

<div class="admin-container">
    <h2>All Orders</h2>

    <table>
        <tr>
            <th>Order ID</th>
            <th>User ID</th>
            <th>Total (₹)</th>
            <th>Order Date</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

<%
OrderDAO dao = new OrderDAO();
List<Order> orders = dao.getAllOrders();

for (Order o : orders) {
%>
        <tr>
            <td><%= o.getId() %></td>
            <td><%= o.getUserId() %></td>
            <td><%= o.getTotal() %></td>
            <td><%= o.getOrderDate() %></td>

<%
    if ("Cancelled".equals(o.getStatus())) {
%>
            <td style="color:red;font-weight:bold;">Cancelled</td>
            <td>Locked</td>
<%
    } else {
%>
            <td>
                <form action="../UpdateOrderStatusServlet" method="post">
                    <select name="status">
                        <option <%= "Placed (COD)".equals(o.getStatus()) ? "selected" : "" %>>
                            Placed (COD)
                        </option>
                        <option <%= "Shipped".equals(o.getStatus()) ? "selected" : "" %>>
                            Shipped
                        </option>
                        <option <%= "Delivered".equals(o.getStatus()) ? "selected" : "" %>>
                            Delivered
                        </option>
                    </select>
            </td>
            <td>
                    <input type="hidden" name="orderId" value="<%= o.getId() %>">
                    <button class="admin-btn">Update</button>
                </form>
            </td>
<%
    }
%>
        </tr>
<%
}
%>

    </table>
</div>

</body>
</html>
