<%@page import="java.util.*" %>
<%@ page import="MyPack.*" %>
<%@page errorPage="Error.jsp" %>

<%
    session = request.getSession(false);
    Integer user_type = -1;
    if(session == null || session.getAttribute("user_type") == null ) {
%>
    <jsp:forward page="Login.jsp">
    <jsp:param name="msg" value="Session has Expired. Login again." />
    </jsp:forward>
<%
    }
    else if((Integer)session.getAttribute("user_type") == 0){
%>
    <jsp:forward page="Login.jsp">
    <jsp:param name="msg" value="Invalid User Type" />
    </jsp:forward>

<%  }
    else{
        user_type = (Integer) session.getAttribute("user_type");
    }
%>
<html>
<head>
    <link rel="stylesheet" href="CSS/styles.css">
</head>
<title>Delete Record</title>

<body>

  <h2>Delete Job Record</h2>
  <br>
  <br>

  <form action="DeleteRecord" method="post">
    <label>Enter JobID to Delete Record:</label>
    <input type="number" name="jobID" required>
    <br>
    <br>
    <br>
    <input class="btn" type="submit" value="Delete Record">
  </form>

  <a class="btn" href="JobRecords.jsp"><button class="btn">&larr; Back</button></a>
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
