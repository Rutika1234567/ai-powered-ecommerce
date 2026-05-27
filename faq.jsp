<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Help Center - MyShop</title>
    <link rel="stylesheet" href="css/faq.css">
      <link rel="stylesheet" href="css/user-header.css">
      <link rel="stylesheet" href="css/footer.css">
       <link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
 <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
</head>
</head>
<body>

<!-- Header include (if you are using include file) -->
   <!-- ===== SHOP HEADER ===== -->
<div class="shop-header">

    <!-- Logo -->
    <div class="shop-logo">MyShop</div>
    

    <!-- Search -->
    <form method="get" action="ProductServlet" class="shop-search">
        <input type="text" name="search" placeholder="Search products">
        <button type="submit">Search</button>
    </form>

    <!-- Icon Menu -->
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



<div class="faq-container">

    <!-- Page Title -->
    <div class="faq-header">
        <h1>MyShop Help Center | 24x7 Customer Support</h1>
        <p>
            Find solutions to common issues related to orders, payments,
            returns, account login, and more. Our support team is always ready
            to assist you for a smooth shopping experience.
        </p>
    </div>

    <div class="faq-content">

        <!-- Left Sidebar -->
        <div class="faq-sidebar">
            <h3>TYPE OF ISSUE</h3>
            <ul>
                <li>Help with your orders</li>
                <li>Returns & Refunds</li>
                <li>Payments & Wallet</li>
                <li>Login & Account</li>
                <li>Delivery & Shipping</li>
                <li>Offers & Discounts</li>
            </ul>
        </div>

        <!-- Right Main Content -->
        <div class="faq-main">
            <h2>Login and My Account</h2>

            <div class="faq-item">
                <h4>How do I reset my password?</h4>
                <p>
                    Click on "Forgot Password" at login and follow OTP verification
                    steps to securely reset your password.
                </p>
            </div>

            <div class="faq-item">
                <h4>Why am I not receiving OTP?</h4>
                <p>
                    Ensure your mobile number is correct and network is stable.
                    You can also request OTP again after 30 seconds.
                </p>
            </div>

            <div class="faq-item">
                <h4>How can I track my order?</h4>
                <p>
                    Go to "My Orders" section in your account dashboard
                    to view real-time delivery updates.
                </p>
            </div>

            <div class="faq-item">
                <h4>What is the return policy?</h4>
                <p>
                    Most products have a 7-day easy return policy.
                    Visit the Returns section to initiate a request.
                </p>
            </div>

            <div class="faq-item">
                <h4>How do refunds work?</h4>
                <p>
                    Refunds are processed within 5-7 business days
                    to your original payment method.
                </p>
            </div>

        </div>

    </div>

</div>





<!-- Extra Help Information Section -->
<!-- Detailed Help Information Section -->
<div class="detailed-help-section">

    <div class="help-long-block">
        <h3>MyShop Help Centre: Get All Shopping Solutions Here</h3>
        <p>
            Once you place your order on MyShop, the next natural step is waiting for your product to arrive. 
            We understand that customers expect timely updates and clear communication throughout the delivery process. 
            With the MyShop Help Centre, you can easily find answers related to order tracking, delivery updates, returns, refunds, and more. 
            Our platform is built to provide convenience at every step so that your shopping experience remains smooth and enjoyable. 
            Whether you are shopping for fashion, electronics, home essentials, or lifestyle products, MyShop ensures assistance is always within reach. 
            From managing your orders to reporting product-related concerns, our Help Centre provides reliable solutions for every situation. 
            If you ever feel unsure about any process, you can explore the support topics or contact our team directly for further guidance.
        </p>
    </div>

    <div class="help-long-block">
        <h3>24x7 Customer Care Support</h3>
        <p>
            MyShop offers dedicated 24x7 Customer Care Support to make sure your concerns are addressed without delay. 
            No matter the time of day, you can reach out regarding payments, cancellations, refunds, delivery issues, or account-related queries. 
            Our trained support executives work to provide quick resolutions so you can continue shopping with confidence. 
            The Help Centre interface is easy to navigate, allowing you to raise a request in just a few clicks. 
            You can also track the progress of your complaint and receive updates directly through your registered email or mobile number. 
            We believe customer satisfaction is the foundation of trust, and our support system is designed to ensure a hassle-free experience every time you shop with MyShop.
        </p>
    </div>

    <div class="help-long-block">
        <h3>Types and Topics of Support in MyShop Help Centre</h3>
        <p>
            The MyShop Help Centre is organized into multiple categories to help you find solutions faster. 
            You can get support for order management, returns and refunds, payment options, wallet services, discounts and offers, and account settings. 
            Each category provides step-by-step guidance to resolve common questions and technical concerns. 
            Whether you want to modify your delivery address, cancel an order, request a return, or understand refund timelines, detailed information is readily available. 
            Our goal is to ensure that every MyShop customer receives accurate and helpful assistance without unnecessary delays. 
            If your issue requires additional attention, you can always connect with our support team for personalized help and complete peace of mind.
        </p>
    </div>

</div>

<!-- Footer include -->
        <!-- Column 2 -->
       <div class="footer-col" style="margin-left: 40px;">
            <h3>Contact Us</h3>

            <p>
                <i class="fa fa-phone"></i>
                <a href="tel:+919022893153">+919022893153</a>

                  
            </p>

            <p>
                <i class="fa fa-envelope"></i>
                  <a href="mailto:rutikaparekar@gmail.com">rutikaparekar@gmail.com</a>
            </p>

            <p>
                <i class="fa fa-map-marker"></i>
                <a href="https://www.google.com/maps/search/Mumbai+Pune+India"
                   target="_blank">
                    Mumbai, Pune, India
                </a>
            </p>
              
            

    </div>
    


        </div>
          <!-- icons -->
             <div class="social-icons">
                <a href="https://wa.me/9022893153"><i class='bx bxl-whatsapp'></i></a>
                   <a href="https://instagram.com/_rutika_parekar"><i class='bx bxl-instagram'></i></a>
                    <a href="https://www.linkedin.com/in/rutika-parekar-44ba40325?utm_source=share_via&utm_content=profile&utm_medium=member_android"><i class='bx bxl-linkedin-square'></i></a>
            </div>

    <div class="footer-bottom">
        © 2025 MyShop | All Rights Reserved
    </div>
</footer>


</body>
</html>