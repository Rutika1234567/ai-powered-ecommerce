<h2>Support Chat</h2>

<div id="chatBox" style="height:300px;overflow:auto;border:1px solid black;"></div>

<input type="text" id="msg">
<button onclick="sendMessage()">Send</button>

<script>
function sendMessage() {
    fetch("ChatServlet", {
        method: "POST",
        headers: {"Content-Type":"application/x-www-form-urlencoded"},
        body: "message=" + document.getElementById("msg").value
    }).then(() => {
        document.getElementById("msg").value = "";
        loadMessages();
    });
}

function loadMessages() {
    fetch("ChatServlet?userId=<%= session.getAttribute("userId") %>")
        .then(res => res.text())
        .then(data => {
            document.getElementById("chatBox").innerHTML = data;
        });
}

setInterval(loadMessages, 2000);
</script>