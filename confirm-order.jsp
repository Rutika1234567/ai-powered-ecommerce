<!DOCTYPE html>
<html>
<head>
<title>Confirm Order</title>

<link rel="stylesheet" href="css/upi-payment.css">

</head>

<body>

<div class="confirm-container">

<h2>Confirm Your Order</h2>

<%
String payment = request.getParameter("payment");

if(payment == null){
    payment = "cod";
}
%>

<p class="payment-mode">
Payment Mode: 
<b><%= payment.equals("cod") ? "Cash on Delivery" : "UPI" %></b>
</p>

<form action="OrderServlet" method="post">

<button type="submit" class="confirm-order-btn">
Confirm Order
</button>

</form>

</div>

</body>
</html>