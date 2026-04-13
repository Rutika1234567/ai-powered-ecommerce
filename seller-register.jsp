<link rel="stylesheet" href="css/seller.css">

<div class="seller-auth-page">
    <div class="seller-auth-card">

        <h1 class="seller-auth-title">Seller Registration</h1>

        <form action="SellerRegisterServlet" method="post" class="seller-form">

            <label>Seller Name</label>
            <input type="text" name="name" placeholder="Enter your store name" required>

            <label>Email</label>
            <input type="email" name="email" placeholder="Enter your email" required>

            <label>Password</label>
            <input type="password" name="password" placeholder="Create password" required>

            <label>Category</label>
            <select name="category" required>
                <option value="">Select Category</option>
                <option value="Mobiles">Mobiles</option>
                <option value="Fashion">Fashion</option>
                <option value="Electronics">Electronics</option>
                <option value="Home and Furniture">Home and Furniture</option>
                <option value="Beauty">Beauty</option>
                <option value="TVs and Appliances">TVs and Appliances</option>
            </select>

            <button type="submit">Register as Seller</button>

        </form>

        <div class="seller-auth-footer">
            Already a Seller? 
            <a href="seller-login.jsp">Login here</a>
        </div>

    </div>
</div>
