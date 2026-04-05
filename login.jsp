




<!DOCTYPE html>
<html>
<head>
    <title>Login | E-Commerce</title>
    <link rel="stylesheet" href="css/user-base.css">
    <link rel="stylesheet" href="css/user-auth.css">

</head>
<body class="login-page">

<div class="login-card">

    <h1>Welcome Back!</h1>
    <p>
        Shop smart, shop fast.<br>
        Best products at the best prices.
    </p>


    <%
String error = (String) request.getAttribute("error");
if(error != null){
%>
    <div class="error-box">
        <%= error %>
    </div>
<%
}
%>

    <form action="LoginServlet" method="post">
        <label>Email</label>
        <input type="email" name="email" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <button type="submit">Login</button>
    </form>

    <p class="login-footer">
        Don't have an account?
        <a href="register.jsp">Register</a>
    </p>

</div>

</body>


</html>
