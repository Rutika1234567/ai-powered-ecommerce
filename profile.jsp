<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>

<%
/* 🔐 Secure Page */
String userEmail = (String) session.getAttribute("userEmail");
String userName  = (String) session.getAttribute("userName");

if(userEmail == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Profile</title>

    <link rel="stylesheet" href="css/user-base.css">
    <link rel="stylesheet" href="css/user-header.css">
    <link rel="stylesheet" href="css/user-profile.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">

    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete your account? This action cannot be undone.");
        }
    </script>
</head>

<body>

<!-- HEADER -->
<div class="shop-header">
    <div class="shop-logo">MyShop</div>

    <div class="shop-menu">
        <a href="ProductServlet">Products</a>
        <a href="LogoutServlet">Logout</a>
    </div>
</div>

<!-- PROFILE -->
<div class="profile-container">

    <div class="profile-card">
        <span class="material-icons-outlined profile-icon">account_circle</span>

        <h2>My Profile</h2>

        <% 
        String success = (String) session.getAttribute("success");
        if(success != null){
        %>
            <div class="success-box"><%= success %></div>
        <%
            session.removeAttribute("success");
        }
        %>

        <form action="UpdateProfileServlet" method="post" class="profile-form">
            <label>Name</label>
            <input type="text" name="name" value="<%= userName %>" required>

            <label>Email</label>
            <input type="email" name="email" value="<%= userEmail %>" required>

            <button type="submit" class="btn-primary">Update Profile</button>
        </form>

        <form action="DeleteAccountServlet" method="post" onsubmit="return confirmDelete()">
            <button type="submit" class="btn-danger">Delete Account</button>
        </form>

        <a href="ProductServlet" class="back-link">← Back to Products</a>
    </div>

</div>

</body>
</html>