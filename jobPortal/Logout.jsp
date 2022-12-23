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
    <title>Logout</title>
  </head>
<body>

<%
  session.invalidate();
  response.sendRedirect("Login.jsp");
%>


</body>
</html>
