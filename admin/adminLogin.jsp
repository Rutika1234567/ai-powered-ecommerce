<%@ page import="java.sql.*,com.ecommerce.dao.DBUtil" %>
<html>
<head>
    <title>All Orders</title>
</head>
<body>
<h2>All Orders</h2>

<%
Connection con = DBUtil.getConnection();
PreparedStatement ps = con.prepareStatement("SELECT * FROM orders");
ResultSet rs = ps.executeQuery();
while(rs.next()){
%>
Order ID: <%=rs.getInt("id")%> |
User ID: <%=rs.getInt("user_id")%> |
Total: ₹<%=rs.getDouble("total")%> |
Status: <%=rs.getString("status")%>
<hr>
<% } %>

</body>
</html>
