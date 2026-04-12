
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,com.ecommerce.model.Product" %>

<!DOCTYPE html>
<html>

<head>

<title>AI Recommended Products</title>

<style>

body{
font-family:Arial;
background:#f4f6f9;
margin:0;
padding:30px;
}

.title{
text-align:center;
margin-bottom:30px;
}

.products{
display:grid;
grid-template-columns:repeat(4,1fr);
gap:20px;
}

.product-card{
background:white;
padding:15px;
border-radius:10px;
box-shadow:0 3px 10px rgba(0,0,0,0.1);
text-align:center;
}

.product-card img{
width:150px;
height:150px;
object-fit:cover;
}

.product-card h3{
font-size:18px;
margin:10px 0;
}

.price{
color:#27ae60;
font-size:18px;
margin-bottom:10px;
}

.btn{
padding:8px 14px;
border:none;
border-radius:5px;
cursor:pointer;
}

.cart{
background:#ff9800;
color:white;
}

.buy{
background:#28a745;
color:white;
}


/* ===== BUTTON GROUP ===== */

.btn-group{
    display:flex;
    justify-content:center;
    gap:10px;
    margin-top:10px;
}

/* COMMON BUTTON */

.btn{
    padding:10px 16px;
    border:none;
    border-radius:6px;
    cursor:pointer;
    font-size:14px;
    min-width:110px;
}

/* ADD TO CART */

.cart{
    background:#ff9800;
    color:white;
}

.cart:hover{
    background:#e68900;
}

/* BUY NOW */

.buy{
    background:#28a745;
    color:white;
}

.buy:hover{
    background:#218838;
}
</style>

</head>

<body>

<h2 class="title"> AI Recommended Products</h2>

<%

List<Product> products =
(List<Product>) request.getAttribute("products");

if(products==null || products.isEmpty()){
%>

<p>No products found</p>

<%
}else{
%>

<div class="products">

<%
for(Product p:products){
%>

<div class="product-card">

<img src="images/products/<%=p.getImage()%>">

<h3><%=p.getName()%></h3>

<p class="price">₹ <%=p.getPrice()%></p>
<div class="btn-group">

<form action="CartServlet" method="post">
<input type="hidden" name="pid" value="<%=p.getId()%>">
<input type="hidden" name="qty" value="1">
<button class="btn cart">Add to Cart</button>
</form>

<form action="BuyNowServlet" method="get">
<input type="hidden" name="pid" value="<%=p.getId()%>">
<button class="btn buy">Buy Now</button>
</form>

</div>

</div>

<%
}
%>

</div>

<%
}
%>

</body>
</html>