<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
    
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>

<div class="admin-container">
<h2>Add New Product</h2>

<form action="../AdminAddProductServlet" method="post">

    <label>Product Name</label><br>
    <input type="text" name="name" required><br><br>

    <label>Price</label><br>
    <input type="number" name="price" required><br><br>

    <label>Stock</label><br>
    <input type="number" name="stock" required><br><br>

    <label>Image Name (example: phone.jpg)</label><br>
    <input type="text" name="image" required><br><br>

    <label>Category</label><br>
    <select name="category" required>
        <option value="">-- Select Category --</option>
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
    <br><br>
       <label>Size (Optional)</label><br>


<input type="checkbox" name="size" value="S"> S
<input type="checkbox" name="size" value="M"> M
<input type="checkbox" name="size" value="L"> L
<input type="checkbox" name="size" value="XL"> XL
<input type="checkbox" name="size" value="2XL"> 2XL

<br><br>

<label>About this item </label><br>
<textarea name="description" rows="4" placeholder="Enter product details..."></textarea>
<br><br>

    <button type="submit">Add Product</button>

</form>
</div>

</body>
</html>
