<%@ page import="java.util.List" %>
<%@ page import="java.util.*,com.ecommerce.model.Product" %>
<%@ page import="com.ecommerce.dao.ProductDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>

<link rel="stylesheet" href="css/user-base.css">
<link rel="stylesheet" href="css/user-products.css">
<link rel="stylesheet" href="css/user-header.css">

<link rel="stylesheet" href="css/brand-slider.css">
<link rel="stylesheet" href="css/user-market.css">
<link rel="stylesheet" href="css/footer.css">



<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">

<script src="js/slider.js" defer></script>

</head>

<body>

<!-- HEADER -->
<div class="shop-header">

<div class="shop-logo">MyShop</div>

<form method="get" action="ProductServlet" class="shop-search">
<input type="text" id="searchBox" name="search" placeholder="Search products">



<button type="button" id="voiceBtn">🎤</button>
<button type="submit">Search</button>

<a href="aiShop.jsp" class="ai-agent-btn">
AI Outfit Finder
</a>

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


   <a href="<%=request.getContextPath()%>/LogoutServlet" class="icon-item">
    <span class="material-icons-outlined">logout</span>
    <span class="icon-label">Logout</span>
</a>


</div>
</div>

<!-- ===== CATEGORY STRIP ===== -->
<div class="market-categories">

<a href="ProductServlet?category=Mobiles" class="market-category">
<img src="images/categories/mobiles.png">
<span>Mobiles</span>
</a>

<a href="ProductServlet?category=Fashion" class="market-category">
<img src="images/categories/fashion.png">
<span>Fashion</span>
</a>

<a href="ProductServlet?category=Electronics" class="market-category">
<img src="images/categories/electronics.png">
<span>Electronics</span>
</a>

<a href="ProductServlet?category=Home" class="market-category">
<img src="images/categories/home.png">
<span>Home & Furniture</span>
</a>

<a href="ProductServlet?category=Beauty" class="market-category">
<img src="images/categories/beauty.png">
<span>Beauty</span>
</a>

<a href="ProductServlet?category=TVs" class="market-category">
<img src="images/categories/tvs.png">
<span>TVs & Appliances</span>
</a>

<a href="ProductServlet?category=Watches" class="market-category">
<img src="images/categories/watch.png">
<span>Watches</span>
</a>

<a href="ProductServlet?category=Bags" class="market-category">
<img src="images/categories/bag.png">
<span>Bags</span>
</a>

<a href="ProductServlet?category=Footwear" class="market-category">
<img src="images/categories/shoes.png">
<span>Footwear</span>
</a>

<a href="ProductServlet?category=Jewellery" class="market-category">
<img src="images/categories/jewellery.png">
<span>Jewellery</span>
</a>

<a href="ProductServlet?category=Kitchen" class="market-category">
<img src="images/categories/kitchen.png">
<span>Home & Kitchen</span>
</a>

<a href="ProductServlet?category=Kurti / Saree" class="market-category">
<img src="images/categories/saree.png">
<span>Kurti / Saree</span>
</a>

<a href="ProductServlet?category=Lingerie" class="market-category">
<img src="images/categories/lingerie.png">
<span>Lingerie</span>
</a>

</div>



<!-- ===== BANNER SLIDER ===== -->
<%
String category = request.getParameter("category");
if (category == null) {
%>

<div class="market-slider">
    <img src="images/banners/banner1.jpg" class="slide active">
    <img src="images/banners/banner2.jpg" class="slide">
    <img src="images/banners/banner3.jpg" class="slide">

    <button class="slide-btn prev" onclick="prevSlide()"> < </button>
    <button class="slide-btn next" onclick="nextSlide()"> > </button>
</div>

<div class="brand-section">

    <div class="brand-slider">
    
          <div class="brand-track">

               <div class="brand-card">
<img src="https://images.meesho.com/images/marketing/1744636599446.webp" alt="Popular Brands" class="styles__BrandLogo-sc-2pt7ax-13 dHTFcf">
</div>

<div class="brand-card">
<img src="https://images.meesho.com/images/marketing/1743159415385.webp" alt="Popular Brands" class="styles__BrandLogo-sc-2pt7ax-13 dHTFcf">
</div>


<div class="brand-card">
    <img src="https://images.meesho.com/images/marketing/1743159302944.webp" alt="Popular Brands" class="styles__BrandLogo-sc-2pt7ax-13 dHTFcf">
</div>
<div class="brand-card">
<img src="https://images.meesho.com/images/marketing/1743159322237.webp" alt="Popular Brands" class="styles__BrandLogo-sc-2pt7ax-13 dHTFcf">
</div>

<div class="brand-card">
<img src="https://images.meesho.com/images/marketing/1743159393231.webp" alt="Popular Brands" class="styles__BrandLogo-sc-2pt7ax-13 dHTFcf">
</div>

<div class="brand-card">
<img src="https://upload.wikimedia.org/wikipedia/commons/a/a6/Logo_NIKE.svg">
</div>

<div class="brand-card">
<img src="https://upload.wikimedia.org/wikipedia/commons/2/20/Adidas_Logo.svg">
</div>

<div class="brand-card">
<img src="https://images.meesho.com/images/marketing/1743159363205.webp" alt="Popular Brands" class="styles__BrandLogo-sc-2pt7ax-13 dHTFcf">

</div>


<div class="brand-card">
  <img src="https://logo.svgcdn.com/logos/samsung.svg">
</div>

<div class="brand-card">
<img src="https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg">
</div>

<div class="brand-card">
         <img src="https://images.meesho.com/images/marketing/1744636599446.webp" alt="Popular Brands" class="styles__BrandLogo-sc-2pt7ax-13 dHTFcf">     
   </div>   
      
      
        </div>

    </div>

</div>


<%
}
%>




<div class="main-container">

    <!-- ===== LEFT FILTER ===== -->
    <div class="filters">

        <form method="get" action="ProductServlet">

            <h3>FILTERS</h3>

            <!-- Category -->
            <label>Category</label>
            <select name="category">
                <option value="">All</option>

                 <option value="Mobiles">Mobiles</option>
        <option value="Fashion">Fashion</option>
        <option value="Electronics">Electronics</option>
        <option value="Home">Home</option>
        <option value="Beauty">Beauty</option>
        <option value="TVs">TVs</option>
        <option value="Grocery">Grocery</option>
         <option value="Watches">Watches</option>
          <option value="Bags">Bags</option>
        
          <option value="Footwear">Footwear</option>
          <option value="Jewellery">Jewellery</option>
    
             <option value="Kitchen">Kitchen</option>

         <option value="Lingerie">Lingerie</option>
         <option value="Kurti / Saree">Kurti / Saree</option>  
            </select>

            <!-- Gender -->
            <label>Gender</label>
            <select name="gender">
                <option value="">All</option>
                <option value="Men">Men</option>
                <option value="Women">Women</option>
            </select>

            <!-- Color -->
            <label>Color</label>
            <select name="color">
                <option value="">All</option>
                <option value="Black">Black</option>
                <option value="White">White</option>
                <option value="Red">Red</option>
            </select>

            <!-- Size -->
            <label>Size</label>
            <select name="size">
                <option value="">All</option>
                <option value="S">S</option>
                <option value="M">M</option>
                <option value="L">L</option>
            </select>

            <!-- Price -->
            <label>Max Price</label>
            <input type="number" name="price">

            <!-- Rating -->
            <label>Min Rating</label>
            <select name="rating">
                <option value="">All</option>
                <option value="4">4+</option>
                <option value="3">3+</option>
            </select>

            <!-- Sorting -->
            <label>Sort By</label>
            <select name="sort">
                <option value="">Default</option>
                <option value="high">Price High → Low</option>
                <option value="low">Price Low → High</option>
            </select>

            <button type="submit">Apply Filters</button>

        </form>

    </div>

   




<!-- PRODUCTS -->
<div class="product-container">

<%
ProductDAO productDAO = new ProductDAO();
List<Product> products = (List<Product>) request.getAttribute("products");

if (products == null || products.isEmpty()) {
%>

<p>No products available.</p>

<%
} else {
for (Product p : products) {
%>

<!-- CLICKABLE PRODUCT CARD -->
<a href="ProductViewServlet?id=<%=p.getId()%>" class="product-card">

    <div class="product">   

        <img src="images/products/<%=p.getImage()%>" alt="<%=p.getName()%>">

        <div class="product-info">

            <h3><%=p.getName()%></h3>
         
            
            <%
if(p.getSize()!=null && !p.getSize().isEmpty()){
    String[] sizes = p.getSize().split(",");
%>

<p>
Sizes:
<% for(String s : sizes){ %>
    <span class="size-box"><%=s%></span>
<% } %>
</p>

<% } %>




            <%
            double rating = productDAO.getAverageRating(p.getId());
            %>


            <div class="rating">
                ⭐ <%= String.format("%.1f", rating) %>
            </div>

            <p class="price">₹ <%=p.getPrice()%></p>

        </div>

    </div>  

</a>

<%
}
}
%>

</div>






</div> 

<!-- FOOTER (UNCHANGED) -->

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
<a href="tel:+919022893153">+919022893153</a>
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



<script src="js/voiceSearch.js"></script>



</body>
</html>