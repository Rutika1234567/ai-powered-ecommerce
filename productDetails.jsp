

<h3>Rate this Product</h3>

<form action="AddReviewServlet" method="post">

<input type="hidden" name="productId" value="<%=product.getId()%>">

<label>Rating</label>

<select name="rating" required>

<option value="5">⭐⭐⭐⭐⭐ Excellent</option>
<option value="4">⭐⭐⭐⭐ Good</option>
<option value="3">⭐⭐⭐ Average</option>
<option value="2">⭐⭐ Poor</option>
<option value="1">⭐ Bad</option>

</select>

<br><br>

<textarea name="review" placeholder="Write your review"></textarea>

<br><br>

<button type="submit">Submit Review</button>

</form>