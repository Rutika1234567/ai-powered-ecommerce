<link rel="stylesheet" href="css/seller.css">

<div class="seller-auth-page">
    <div class="seller-auth-card">

        <h1 class="seller-auth-title">Seller Login</h1>

        <form action="SellerLoginServlet" method="post" class="seller-form">

            <label>Email</label>
            <input type="email" name="email" required>

            <label>Password</label>
            <input type="password" name="password" required>

            <button type="submit">Seller Login</button>

        </form>

        <div class="seller-auth-footer">
            New Seller? 
            <a href="seller-register.jsp">Register here</a>
        </div>

    </div>
</div>
