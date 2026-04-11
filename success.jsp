

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html>
<head>
<title>Payment Success</title>
<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f1f3f6;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 50vh;
}

/* CARD */
.container {
    background: white;
    width: 720px;
    border-radius: 12px;
    overflow: hidden; /* ✅ VERY IMPORTANT */
    box-shadow: 0 8px 25px rgba(0,0,0,0.15);
}

/* HEADER (ATTACHED PERFECTLY) */
.header {
    background: linear-gradient(100deg, #00baf2, #007ad9);
    color: white;
    padding: 16px 20px;

    font-size: 18px;
    font-weight: bold;

    display: flex;
    justify-content: space-between;
}

/* CONTENT AREA */
.content {
    padding: 25px;
   
}

/* TEXT */
.title {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
}

.subtitle {
    color: #555;
    margin-bottom: 25px;
    font-size: 15px;
}

/* BUTTONS */
.btn {
    padding: 10px 18px;
    border-radius: 6px;
    border: none;
    cursor: pointer;
    margin: 5px;
    font-size: 14px;
}

.primary {
    background: #2874f0;
    color: white;
    
}

.secondary {
    background: white;
    border: 1px solid #ccc;
}
</style>
</head>

<body>
<div class="container">

    <div class="header">
        <span>Paytm</span>
        <span>Payment Successful</span>
    </div>

    <div class="content">

        <div class="title">Payment Completed</div>

        <div class="subtitle">
            Your payment of ₹ <%= request.getAttribute("amount") %> was successfully via UPI
        </div>

        <button class="btn primary" onclick="window.location='ProductServlet'">
            Continue Shopping
        </button>

        <button class="btn secondary" onclick="window.location='cart.jsp'">
            Back to Cart
        </button>

    </div>

</div>

</body>
</html>