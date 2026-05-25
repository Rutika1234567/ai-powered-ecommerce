<%@ page import="java.util.*,com.ecommerce.model.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cancellation & Returns Policy</title>

<link rel="stylesheet" href="css/user-base.css">
<link rel="stylesheet" href="css/user-products.css">
<link rel="stylesheet" href="css/user-header.css">
<link rel="stylesheet" href="css/brand-slider.css">
<link rel="stylesheet" href="css/user-market.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/chat.css">
<link rel="stylesheet" href="css/returnpolicy.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">

</head>

<body>

<!-- ===== HEADER ===== -->
<div class="shop-header">

    <div class="shop-logo">MyShop</div>

    <form method="get" action="ProductServlet" class="shop-search">
        <input type="text" name="search" placeholder="Search products">
        <button type="submit">Search</button>
    </form>

    <div class="shop-icons">

        <a href="myOrders.jsp" class="icon-item">
            <span class="material-icons-outlined">receipt_long</span>
            <span class="icon-label">My Orders</span>
        </a>

        <a href="profile.jsp" class="icon-item">
            <span class="material-icons-outlined">account_circle</span>
            <span class="icon-label">Profile</span>
        </a>

        <a href="cart.jsp" class="icon-item">
            <span class="material-icons-outlined">shopping_cart</span>
            <span class="icon-label">Cart</span>
        </a>

        <a href="seller-login.jsp" class="icon-item">
            <span class="material-icons-outlined">storefront</span>
            <span class="icon-label">Become a Seller</span>
        </a>

        <a href="LogoutServlet" class="icon-item">
            <span class="material-icons-outlined">logout</span>
            <span class="icon-label">Logout</span>
        </a>

    </div>

</div>

<!-- ===== RETURN POLICY CONTENT ===== -->

<div class="container">

<h1>Order Cancellation and Return Policy</h1>

<h2>Cancellation Policy</h2>

<p>
Customers can cancel an order anytime before it is shipped. Once the order
is dispatched, cancellation may not be possible.
</p>

<p>
The cancellation time window may vary depending on the product category.
If cancellation is requested after the allowed time period, the request
may not be accepted.
</p>

<p>
In certain cases cancellation charges may apply. If an order is cancelled
due to seller issues or product unavailability, a full refund will be issued.
</p>

<h2>Cancellation Policy - Fast Delivery Orders</h2>

<ul>
<li>The order could not be delivered within the estimated time.</li>
<li>The seller cancelled the order due to stock issues.</li>
<li>The order was not picked by the delivery partner.</li>
<li>Technical or payment issues occurred.</li>
</ul>

<h2>Returns Policy</h2>

<p>
Returns are available for selected products within the return window
mentioned on the product page. Customers can request replacement or refund
for defective, damaged, or incorrect items.
</p>

<ul>
<li>Products must be unused and in original packaging.</li>
<li>All accessories and tags must be included.</li>
<li>Return requests after the allowed period may not be accepted.</li>
</ul>

<h2>Refund Policy</h2>

<p>
After the returned product is received and verified, the refund will be
processed to the original payment method within 5-7 business days.
</p>

</div>

<!-- ===== FOOTER ===== -->

<footer class="site-footer">

<div class="footer-container">

<div class="footer-col">
<h3>Quick Links</h3>
<ul>
<li><a href="ProductServlet">Home</a></li>
<li><a href="returnPolicy.jsp">Cancellation & Returns</a></li>
<li><a href="about.jsp">About Us</a></li>
<li><a href="categories.jsp">All Categories</a></li>
<li><a href="faq.jsp">FAQ</a></li>
</ul>
</div>

<div class="footer-col">
<h3>Contact Us</h3>

<p>
<i class="fa fa-phone"></i>
<a href="tel:+919022893153">+91 9022893153</a>
</p>

<p>
<i class="fa fa-envelope"></i>
<a href="mailto:rutikaparekar@gmail.com">rutikaparekar@gmail.com</a>
</p>

<p>
<i class="fa fa-map-marker"></i>
<a href="https://www.google.com/maps/search/Mumbai+Pune+India" target="_blank">
Mumbai, Pune, India
</a>
</p>

</div>

<div class="footer-col">

<h3>Why Shop With Us</h3>

<p>⭐ Premium quality products from trusted brands</p>
<p>🚚 Fast and safe delivery services</p>
<p>🔒 Secure payments and data protection</p>
<p>💳 Transparent pricing with no hidden charges</p>
<p>🛠 Smooth website experience</p>
<p>📞 Dedicated customer support</p>

</div>

</div>

<div class="social-icons">
<a href="https://wa.me/9022893153"><i class='bx bxl-whatsapp'></i></a>
<a href="https://instagram.com/_rutika_parekar"><i class='bx bxl-instagram'></i></a>
<a href="https://www.linkedin.com"><i class='bx bxl-linkedin-square'></i></a>
</div>

<div class="footer-bottom">
© 2025 MyShop | All Rights Reserved
</div>

</footer>

<!-- ===== CHAT BOX ===== -->

<div class="chat-box">

<div id="chat-messages"></div>

<input type="text" id="messageInput" placeholder="Type message...">
<button onclick="sendMessage()">Send</button>

</div>

<script src="js/chat.js"></script>

</body>
</html>