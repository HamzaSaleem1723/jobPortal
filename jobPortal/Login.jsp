<%@page import="java.util.*" %>
<%@ page import="MyPack.*" %>
<%@page errorPage="Error.jsp" %>


<html>
<head>
    <link rel="stylesheet" href="CSS/styles.css">
</head>
<title>Login</title>

<body>

    <h2>Login</h2>
    <br>
    <br>

    <form action="UserLogin" method="post">
      <label>Email:</label>
      <input type="email" name="email" required>
      <br>
      <br>
      <label>Password:</label>
      <input type="password" name="password" required>
      <br>
      <br>
      <br>
      <input class="btn" type="submit" value="Login">
    </form>
  <a class="btn" href="index.html"><button class="btn">&larr; Back</button></a>
    <br>
    <br>


<%
    String message = (String)request.getAttribute("msg");
    String msg = (String)request.getParameter("msg");
    if(msg == null){
        msg = "";
    }
    if(message == null){
        message = "";
    }
    out.println(msg);
    out.println(message);
%>


</body>
</html>
