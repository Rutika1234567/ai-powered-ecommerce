<!DOCTYPE html>
<html>
<head>
    <title>Confirm Purchase</title>
     <link rel="stylesheet" href="css/user-base.css">
    <link rel="stylesheet" href="css/confirm-order.css">
</head>
<body>

<div class="container">
    <h2>Confirm Your Order</h2>

    <p><b>Product:</b> <%= request.getParameter("name") %></p>
    <p><b>Price:</b>  <%= request.getParameter("price") %></p>
    <p><b>Payment Mode:</b> Cash on Delivery</p>

    <form action="BuyNowServlet" method="post">
        <input type="hidden" name="price" value="<%= request.getParameter("price") %>">
        <button class="buy-now">Confirm Order</button>
        <a href="ProductServlet">Cancel</a>
    </form>
</div>

</body>
</html>
