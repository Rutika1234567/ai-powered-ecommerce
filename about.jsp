<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>About Us - MyShop</title>
    <link rel="stylesheet" href="css/about.css">
    <link rel="stylesheet" href="css/user-header.css">

    <link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
 <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
</head>
<body>



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





<!-- Top Banner Section -->
<section class="about-banner">
    <div class="banner-content">
        <h1>Style. Quality. Trust.</h1>
        <p>
            Discover the latest trends, timeless classics, and everyday essentials —
            all curated to bring confidence and comfort to your lifestyle.
        </p>
    </div>
</section>

<!-- Two Column Section -->
<section class="about-section">
    <div class="about-box">
        <h2>Our Story</h2>
        <p>
            MyShop was created to make fashion and lifestyle shopping simple,
            affordable, and exciting. We bring together top brands and unique
            collections so you can express yourself effortlessly.
        </p>
    </div>

    <div class="about-box">
        <h2>What We Offer</h2>
        <p>
            From fashion and footwear to accessories and essentials,
            our platform ensures quality products, secure payments,
            and quick doorstep delivery.
        </p>
    </div>
</section>

<!-- Highlight Strip -->
<section class="highlight-strip">
    <h2>Why Shop With Us?</h2>
    <p>
        Because shopping should feel easy, enjoyable, and inspiring.
        We focus on quality, affordability, and customer satisfaction.
    </p>
</section>

<!-- More Info Section -->
<section class="about-section">
    <div class="about-box">
        <h2>Customer First</h2>
        <p>
            Easy returns, fast shipping, and 24/7 support ensure
            a smooth shopping journey from start to finish.
        </p>
    </div>

    <div class="about-box">
        <h2>Secure & Reliable</h2>
        <p>
            Our platform uses secure payment gateways and verified sellers
            so you can shop with complete peace of mind.
        </p>
    </div>
</section>

<!-- Popular Brands Section -->
<section class="brands-section">
    <h2>Popular Brands We Feature</h2>

    <div class="brands-grid">
        <div class="brand">Nike</div>
        <div class="brand">Adidas</div>
        <div class="brand">Puma</div>
        <div class="brand">Levi's</div>
        <div class="brand">H&M</div>
        <div class="brand">Zara</div>
        <div class="brand">Allen Solly</div>
        <div class="brand">Tommy Hilfiger</div>
    </div>
</section>

<!-- Bottom Features -->
<section class="features">
    <div class="feature-box">
        <h3>Easy Exchange</h3>
    </div>
    <div class="feature-box">
        <h3>100% Handpicked</h3>
    </div>
    <div class="feature-box">
        <h3>Assured Quality</h3>
    </div>
</section>

</body>
</html>