
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>

<div class="admin-nav">
    <h1>Admin Panel</h1>
    <a href="adminDashboard.jsp">Dashboard</a>
    <a href="manageProducts.jsp">Manage Products</a>
    <a href="viewProducts.jsp">View Products</a>
    <a href="viewOrders.jsp">View Orders</a>
    <a href="../ai-sales-dashboard.jsp"> AI Sales Analytics</a>
   
    <a href="<%=request.getContextPath()%>/LogoutServlet" class="icon-item">
<span class="icon-label">Logout</span>
</a>
    
</div>

<div class="admin-container">
    <h2>Welcome, Admin</h2>

    <p>Use the options above to manage products and orders.</p>

    <a href="addProduct.jsp" class="admin-btn">Add New Product</a>
</div>

</body>
</html>
