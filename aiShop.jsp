<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<title>AI Shopping Agent</title>

<style>

body{
font-family:Arial;
background:#f4f6f9;
display:flex;
justify-content:center;
align-items:center;
height:100vh;
}

.ai-box{
background:white;
padding:40px;
border-radius:10px;
box-shadow:0 5px 15px rgba(0,0,0,0.2);
text-align:center;
width:500px;
}

.ai-box h2{
margin-bottom:20px;
color:#333;
}

.ai-box input{
width:80%;
padding:12px;
border:1px solid #ccc;
border-radius:5px;
font-size:16px;
}

.ai-box button{
padding:12px 18px;
background:#007bff;
border:none;
color:white;
font-size:16px;
border-radius:5px;
cursor:pointer;
margin-top:15px;
}

.ai-box button:hover{
background:#0056b3;
}

</style>

</head>

<body>

<div class="ai-box">

<h2>🤖 AI Shopping Agent</h2>

<p>Describe what you need</p>

<form action="AgentServlet" method="post">

<input type="text" name="query"
placeholder="Example: outfit for beach wedding under 200">

<br><br>

<button type="submit">Find Products</button>

</form>

</div>

</body>
</html>