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
<title>Add Record</title>
<body>


<h2>Add Job Record</h2>
<br>
<br>

<form action="AddRecord" method="post">
    <label>JobID:</label>
    <input type="number" name="jobID" align="left" required>
    <br>
    <br>
    <label>Job Title:</label>
    <input type="text" name="title" align="left" required>
    <br>
    <br>
    <label>Job Description:</label>
    <input type="text" name="description" align="left" required>
    <br>
    <br>
    <label>Email:</label>
    <input type="email" name="email" align="left" required>
    <br>
    <br>
    <input class="btn" type="submit" value="Add Record">
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
