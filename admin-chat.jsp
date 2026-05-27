<h2>Admin Chat Panel</h2>

<select id="userSelect" onchange="loadChat()">

<option>Select User</option>

<%
for(Integer id : com.ecommerce.dao.ChatDAO.getChatUsers()){
%>

<option value="<%=id%>">User <%=id%></option>

<% } %>

</select>

<div id="adminChatBox" style="height:300px;border:1px solid black;overflow:auto"></div>

<input type="text" id="adminMsg">

<button onclick="sendReply()">Reply</button>

<script>

let selectedUser;

function loadChat(){

selectedUser=document.getElementById("userSelect").value;

fetch("ChatServlet?userId="+selectedUser)

.then(res=>res.text())

.then(data=>{

document.getElementById("adminChatBox").innerHTML=data;

});

}

function sendReply(){

let msg=document.getElementById("adminMsg").value;

fetch("ChatServlet",{

method:"POST",

headers:{

"Content-Type":"application/x-www-form-urlencoded"

},

body:"message="+msg

}).then(()=>{

document.getElementById("adminMsg").value="";

loadChat();

});

}

setInterval(()=>{

if(selectedUser){

loadChat();

}

},2000);

</script>