

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.ecommerce.model.Product" %>

<%
Product p = (Product) request.getAttribute("product");
%>

<link rel="stylesheet" href="css/product-view.css">

<div class="product-view-container">

    <!-- LEFT IMAGE -->
    <div class="product-image">
        <img src="images/products/<%=p.getImage()%>" alt="<%=p.getName()%>">
    </div>

    <!-- RIGHT DETAILS -->
    <div class="product-details">

        <h2><%=p.getName()%></h2>

      <img src="images/products/<%=p.getImage()%>" width="300">


<p>Price: ₹ <%=p.getPrice()%></p>

<% if(p.getDescription()!=null && !p.getDescription().isEmpty()) { %>
    <p><%=p.getDescription()%></p>
<% } %>



        <%
if(p.getSize()!=null && !p.getSize().isEmpty()){
    String[] sizes = p.getSize().split(",");
%>

<p>
Available Sizes:

<div class="size-select">

<% for(String s : sizes){ %>

<label class="size-option">
    <input type="radio" name="size" value="<%=s%>" required>
    <span><%=s%></span>
</label>

<% } %>

</div>



</p>

<% } %>



        <p class="price">₹ <%=p.getPrice()%></p>

        <!-- Quantity -->
        <div class="qty-box">
            <label>Quantity:</label>
            <input type="number" name="qty" value="1" min="1">
        </div>

        <!-- BUTTONS -->
        <div class="btn-group">

            <!-- Add to Cart -->
            <form action="CartServlet" method="post">
                <input type="hidden" name="pid" value="<%=p.getId()%>">
                <input type="hidden" name="qty" value="1">
                <button type="submit" class="btn btn-cart">Add to Cart</button>
            </form>

            <!-- Buy Now -->
            <form action="BuyNowServlet" method="get">
                <input type="hidden" name="pid" value="<%=p.getId()%>">
                <input type="hidden" name="name" value="<%=p.getName()%>">
                <input type="hidden" name="price" value="<%=p.getPrice()%>">
                <button type="submit" class="btn btn-buy">Buy Now</button>
            </form>

        </div>

    </div>

</div>

