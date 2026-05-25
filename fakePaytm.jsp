<!DOCTYPE html>
<html>
<head>
<title>Paytm Payment</title>

<style>
body {
    font-family: Arial;
    background: #f1f3f6;
    text-align: center;
}

.container {
    background: white;
    padding: 30px;
    margin: 100px auto;
    width: 350px;
    border-radius: 10px;
    box-shadow: 0 0 10px #ccc;
}

button {
    background: #00baf2;
    color: white;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
}

input {
    padding: 10px;
    width: 90%;
    margin: 10px 0;
}
</style>
</head>

<body>

<div class="container">

<h2>Paytm Payment</h2>
<%
String error = (String)request.getAttribute("error");
if(error != null){
%>
<p style="color:red;"><%=error%></p>
<%
}
%>
<form action="fakePaytm" method="post">

<input type="text" name="mobile" placeholder="Enter 10 digit mobile number" required>

<button type="submit">Pay Now</button>

</form>

</div>

</body>
</html>