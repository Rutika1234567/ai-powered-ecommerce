<%@ page import="java.util.*" %>

<html>
<body onload="document.forms[0].submit()">

<%
Map<String,String> params = (Map<String,String>)request.getAttribute("params");
String checksum = (String)request.getAttribute("checksum");

if(params == null){
    out.println("ERROR: Params not received from servlet");
    return;
}
%>

<form method="post" action="https://securegw-stage.paytm.in/order/process">

<%
for (Map.Entry<String,String> entry : params.entrySet()) {
%>
    <input type="hidden" name="<%=entry.getKey()%>" value="<%=entry.getValue()%>">
<%
}
%>

<input type="hidden" name="CHECKSUMHASH" value="<%=checksum%>">

</form>

</body>
</html>