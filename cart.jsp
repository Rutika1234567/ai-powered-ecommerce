<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,com.ecommerce.model.CartItem,com.ecommerce.model.Product,com.ecommerce.dao.ProductDAO" %>

<!DOCTYPE html>
<html>
<head>
<title>Your Cart</title>

<link rel="stylesheet" href="css/user-cart.css?v=2">

<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">

</head>
<body>

<div class="container">

<h2 class="page-title">Your Cart</h2>

<%
List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

if(cart == null || cart.isEmpty()){
%>

<p class="empty-cart">Your cart is empty.</p>
<a href="ProductServlet" class="back-link">Continue Shopping</a>

<%
}else{

ProductDAO pdao = new ProductDAO();
double grandTotal = 0;
%>

<table class="cart-table">

<tr>
<th>Product</th>
<th>Price</th>
<th>Qty</th>
<th>Total</th>
<th>Action</th>
</tr>

<%
for(CartItem item : cart){

Product p = pdao.getProductById(item.getProductId());
if(p == null) continue;

double total = p.getPrice()*item.getQuantity();
grandTotal += total;
%>

<tr>

<td class="cart-product">

<img src="images/products/<%=p.getImage()%>">

<div>
<span><%=p.getName()%></span>

<br>

<!--  SHOW SELECTED SIZE -->
<% if(item.getSize()!=null){ %>
    <small>Size: <b><%=item.getSize()%></b></small>
<% } %>

</div>

</td>

<td>₹ <%=p.getPrice()%></td>

<td>

<form action="UpdateCartServlet" method="post" style="display:inline;">
<input type="hidden" name="productId" value="<%=p.getId()%>">
<input type="hidden" name="action" value="decrease">
<button type="submit" class="qty-btn">-</button>
</form>

<%=item.getQuantity()%>

<form action="UpdateCartServlet" method="post" style="display:inline;">
<input type="hidden" name="productId" value="<%=p.getId()%>">
<input type="hidden" name="action" value="increase">
<button type="submit">+</button>
</form>

</td>

<td>₹ <%=total%></td>

<td>

<form action="UpdateCartServlet" method="post" style="display:inline;">
<input type="hidden" name="productId" value="<%=p.getId()%>">
<input type="hidden" name="action" value="remove">
<button class="remove-btn">Remove</button>
</form>

<button class="share-btn" onclick="openShare('<%=p.getId()%>')">
Share
</button>

</td>

</tr>

<%
}
%>

<tr class="cart-total-row">
<td colspan="3"><b>Grand Total</b></td>
<td><b>₹ <%=grandTotal%></b></td>
<td></td>
</tr>

</table>

<div class="cart-actions">

<a href="ProductServlet" class="back-link">Continue Shopping</a>

<a href="checkout.jsp" class="checkout-btn">
Proceed to Checkout
</a>

</div>

<%
}
%>

</div>






<!-- SHARE POPUP -->

<div id="shareModal" class="share-modal">

<div class="share-box">

<div class="share-header">

<h3>Share this product with friends</h3>

<span class="close-btn" onclick="closeShare()">×</span>

</div>

<div class="share-icons">

<a id="whatsappShare" target="_blank" class="share-item">
<i class='bx bxl-whatsapp'></i>
<p>WhatsApp</p>
</a>

<a id="emailShare" class="share-item">
<i class="bx bx-envelope"></i>
<p>Email</p>
</a>

<a id="instaShare" target="_blank" class="share-item">
<i class='bx bxl-instagram'></i>
<p>Instagram</p>
</a>

</div>

<div class="share-link">

<input type="text" id="productLink" readonly>

<button onclick="copyLink()">Copy Link</button>

</div>

</div>

</div>

<script>

function openShare(pid){

let link = "http://localhost:8080/ECommerceApp/ProductServlet?pid=" + pid;

document.getElementById("productLink").value = link;

document.getElementById("whatsappShare").href =
"https://wa.me/?text=Check this product: "+link;

document.getElementById("emailShare").href =
"mailto:?subject=Check this product&body="+link;

document.getElementById("instaShare").href =
"https://www.instagram.com/";

document.getElementById("shareModal").style.display="flex";

}

function closeShare(){

document.getElementById("shareModal").style.display="none";

}

function copyLink(){

let input = document.getElementById("productLink");

navigator.clipboard.writeText(input.value);

alert("Link copied!");

}

</script>

</body>
</html>