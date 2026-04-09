function sendMessage(){

let msg = document.getElementById("messageInput").value;

fetch("ChatServlet",{

method:"POST",

headers:{
"Content-Type":"application/x-www-form-urlencoded"
},

body:"message="+msg

}).then(()=>{
document.getElementById("messageInput").value="";
loadMessages();
});

}

function loadMessages(){

fetch("ChatServlet?userId="+userId)

.then(res=>res.text())

.then(data=>{
document.getElementById("chat-messages").innerHTML=data;
});

}

setInterval(loadMessages,2000);