<%@ page import="java.util.*,com.ecommerce.dao.ProductDAO,com.ecommerce.model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Manage Products</title>
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>

<div class="admin-nav">
    <a href="adminDashboard.jsp">Dashboard</a>
    <a href="manageProducts.jsp">Add Product</a>
    <a href="viewProducts.jsp">View Products</a>
</div>

<div class="admin-container">
<h2>Manage Products</h2>

<table border="1" cellpadding="10">

<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Category</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Image</th>
    <th>Actions</th>
</tr>

<%
ProductDAO dao = new ProductDAO();
List<Product> products = dao.getAllProducts();

for(Product p : products){
%>

<tr>

<form action="../AdminServlet" method="post">

<td>
    <%=p.getId()%>
    <input type="hidden" name="id" value="<%=p.getId()%>">
</td>

<td>
<input type="text" name="name" value="<%=p.getName()%>">
</td>

<td>
<input type="text" name="category" value="<%=p.getCategory()%>">
</td>

<td>
<input type="text" name="price" value="<%=p.getPrice()%>">
</td>

<td>
<input type="number" name="quantity" value="<%=p.getQuantity()%>">
</td>

<td>
<input type="text" name="image" value="<%=p.getImage()%>">
</td>

<td>

<button type="submit" name="action" value="update">
Update
</button>

<button type="submit" name="action" value="delete"
onclick="return confirm('Delete this product?')">
Delete
</button>

</td>

</form>

</tr>

<% } %>

</table>

</div>

</body>
</html>