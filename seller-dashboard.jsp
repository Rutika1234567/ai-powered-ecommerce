<%
Integer sellerId = (Integer) session.getAttribute("sellerId");
if (sellerId == null) {
    response.sendRedirect("seller-login.jsp");
    return;
}
%>



<link rel="stylesheet" href="css/seller.css">

<div class="seller-container">
    <h1>Seller Dashboard</h1>

    <p class="seller-welcome">Welcome, <%= session.getAttribute("sellerName") %></p>

    <div class="seller-dashboard-grid">

        <a class="seller-card" href="seller-add-product.jsp">
            <h3>Add Product</h3>
            <p>Add new items to your store</p>
        </a>

        <a class="seller-card" href="seller-my-products.jsp">
            <h3>My Products</h3>
            <p>View & manage your products</p>
        </a>

        <a class="seller-card" href="SellerLogoutServlet">
            <h3>Logout</h3>
            <p>Securely logout</p>
        </a>

    </div>
</div>
