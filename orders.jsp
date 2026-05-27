<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*,com.ecommerce.dao.DBUtil"%>
<%
int userId = (int) session.getAttribute("userId");
%>

<html>
    <head>
    <title>Products</title>
    <link rel="stylesheet" href="css/user.css">
    <link rel="stylesheet" href="css/my-orders-simple.css">
</head>

<body>
<h2>My Orders</h2>

<%
Connection con = DBUtil.getConnection();
PreparedStatement ps =
    con.prepareStatement("SELECT * FROM orders WHERE user_id=?");
ps.setInt(1, userId);
ResultSet rs = ps.executeQuery();

while(rs.next()){
%>
Order ID: <%=rs.getInt("id")%> |
Total: ₹<%=rs.getDouble("total")%> |
Status: <%=rs.getString("status")%>
<hr>
<% } %>

</body>
</html>
