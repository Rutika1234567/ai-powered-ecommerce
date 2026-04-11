<%@ page import="java.util.*,com.ecommerce.model.CartItem"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
String error = (String)request.getAttribute("error");
if(error != null){
%>
<div style="color: red; background:#ffe6e6; padding:10px; border-radius:5px; margin-bottom:10px;">
    <%=error%>
</div>
<%
}
%>
<!DOCTYPE html>

<html>
<head>
<title>Checkout</title>
<link rel="stylesheet" href="css/user-checkout.css">

<meta charset="UTF-8">
</head>

<body>
    <div class="checkout-container">

<h2>Checkout</h2>


<%
Integer userId = (Integer) session.getAttribute("userId");
List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

if (userId == null) {
%>

<p>Please login to continue.</p>
<a href="login.jsp">Login</a>

<%
return;
}

if (cart == null || cart.isEmpty()) {
%>

<p>Your cart is empty</p>
<a href="ProductServlet">Shop Now</a>

<%
} else {

int totalItems = 0;
for (CartItem c : cart) {
totalItems += c.getQuantity();
}
%>

<p>Total Items: <%= totalItems %></p>





<h3>Order Summary</h3>

<table class="cart-table">

<tr>
<th>Product</th>
<th>Price</th>
<th>Qty</th>
<th>Total</th>
</tr>

<%
double grandTotal = 0;

for(CartItem item : cart){

double total = item.getPrice() * item.getQuantity();
grandTotal += total;
%>

<tr>

<td>Product ID: <%=item.getProductId()%></td>

<td>₹ <%=item.getPrice()%></td>

<td><%=item.getQuantity()%></td>

<td>₹ <%=total%></td>

</tr>

<%
}
%>

<tr>
<td colspan="3"><b>Grand Total</b></td>
<td><b>₹ <%=grandTotal%></b></td>
</tr>

</table>

<form id="paymentForm" method="post" class="checkout-form">
<h3>Delivery Address</h3>

<div class="address-box">

<label>Full Name</label> <input type="text" name="name" required>


<label>House / Flat / Building</label> <input type="text" name="house" required>

<label>Area / Street</label> <input type="text" name="area" required>

<label>City</label> <input type="text" name="city" required>

<label>State</label> <input type="text" name="state" required>

<label>Pincode</label> <input type="text" name="pincode" required>

</div>

<h3>Select Payment Method</h3>

<input type="radio" name="payment" value="cod" checked> Cash on Delivery <br><br>

<input type="radio" name="payment" value="upi"> Online Payment (UPI)


<input type="hidden" name="amount" value="<%=grandTotal%>">



<button type="submit" class="checkout-btn">
Proceed to Payment
</button>
<%
session.setAttribute("amount", grandTotal);
%>
</form>

<%
}
%>
</div>
<script>

window.onload = function(){

const upiRadio = document.querySelector('input[value="upi"]');
const codRadio = document.querySelector('input[value="cod"]');
const upiSection = document.getElementById("upiSection");

upiRadio.addEventListener("change", function(){
upiSection.style.display = "block";
});

codRadio.addEventListener("change", function(){
upiSection.style.display = "none";
});

};

</script>
<script>
document.getElementById("paymentForm").addEventListener("submit", function(e){

    var method = document.querySelector('input[name="payment"]:checked').value;

    if(method === "upi"){
        this.action = "fakePaytm.jsp";   // ✅ GO TO NEW PAGE
    } else {
        this.action = "PaymentServlet";
    }

});
</script>
</body>
</html>
