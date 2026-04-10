
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.sql.*,com.ecommerce.dao.DBUtil" %>
<%
Integer sellerId = (Integer) session.getAttribute("sellerId");
if (sellerId == null) {
    response.sendRedirect("seller-login.jsp");
    return;
}
%>

<link rel="stylesheet" href="css/seller.css">

<div class="seller-container">
    <h1>My Products</h1>

    <div class="seller-table-wrapper">
        <table class="seller-table">

<tr>
    <th>Name</th>
    <th>Price</th>
    <th>Qty</th>
    <th>Category</th>
</tr>

<%
Connection con = DBUtil.getConnection();
PreparedStatement ps = con.prepareStatement(
    "SELECT * FROM products WHERE seller_id=?"
);
ps.setInt(1, sellerId);

ResultSet rs = ps.executeQuery();

while(rs.next()){
%>
<tr>
    <td><%=rs.getString("name")%></td>
    <td>₹ <%=rs.getDouble("price")%></td>
    <td><%=rs.getInt("quantity")%></td>
    <td><%=rs.getString("category")%></td>
</tr>
<% } %>
</table>

<br>
        </table>
    </div>

    <div class="seller-actions">
        <a class="seller-back" href="seller-dashboard.jsp">Back to Dashboard</a>
        <a class="seller-logout" href="SellerLogoutServlet">Logout</a>
    </div>
</div>










            <!-- your existing rows -->





