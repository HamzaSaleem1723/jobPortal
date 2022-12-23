<%@page import="java.util.*" %>
<%@ page import="MyPack.*" %>
<%@page errorPage="Error.jsp" %>

<%
    session = request.getSession(false);
    Integer user_type = -1;
    if(session == null || session.getAttribute("user_type") == null) {

%>
    <jsp:forward page="Login.jsp">
    <jsp:param name="msg" value="Session has Expired. Login again." />
    </jsp:forward>

<%
    }
    else{
        user_type = (Integer) session.getAttribute("user_type");
    }
%>

<html>
<head>
    <link rel="stylesheet" href="CSS/styles.css">
    <title>Search Record</title>
</head>

<body>

  <h2>Search Job Record</h2>
  <br>
  <br>

  <form action="SearchRecords.jsp" method="post">
    <label>Record to search:</label>
    <input type="text" name="recordToSearch" required>
    <br>
    <br>
    <br>
    <input class= "btn" type="submit" value="Search Record">
  </form>

  <a class="btn" href="JobRecords.jsp"><button class="btn">&larr; Back</button></a>
    <br>
    <br>

<%
      String message = (String)request.getParameter("message");
      if(message == null){
          message = "";
      }
      out.println(message);
%>


</body>
</html>
