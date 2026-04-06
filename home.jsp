<%@ page import="java.util.*,com.ecommerce.model.Product" %>

<h2>New Arrivals</h2>

<%
List<Product> newArrivals = (List<Product>)request.getAttribute("newArrivals");

if(newArrivals != null){
for(Product p : newArrivals){
%>

<div class="product-card">

<img src="images/products/<%=p.getImage()%>" width="150">

<h4><%=p.getName()%></h4>

<p>₹ <%=p.getPrice()%></p>

</div>

<%
}
}
%>

<h2>Trending Products</h2>