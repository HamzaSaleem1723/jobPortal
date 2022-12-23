<%@page import="java.util.*" %>
<%@ page import="MyPack.*" %>
<%@page errorPage="Error.jsp" %>


<html>
<head>
    <link rel="stylesheet" href="CSS/styles.css">
</head>
<title>Search Record</title>

<body>

  <h2>User Signup</h2>
  <br>
  <br>

  <form action="Signup" method="post">
    <label>Username:</label>
    <input type="text" name="username" required>
    <br>
    <br>
    <label>Password:</label>
    <input type="password" name="password" required>
    <br>
    <br>
    <label>Email:</label>
    <input type="email" name="email" required>
    <br>
    <br>
    <label>Phone No.:</label>
    <input type="text" name="phone" required>
    <br>
    <br>
    <label>Address:</label>
    <input type="text" name="address" required>
    <br>
    <br>
    <br>
    <input class="btn" type="submit" value="Sign up">
  </form>
  <br>
  <a class="btn" href="index.html"><button class="btn">&larr; Back</button></a>
  <br>
  <br>

<%
    String msg = (String)request.getAttribute("msg");
    if(msg == null){
        msg = "";
    }
    out.println(msg);
%>


</body>
</html>
