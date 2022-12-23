<%@page isErrorPage="true" %>
<%@page import = "java.sql.SQLException" %>

<html>
  <head>
      <link rel="stylesheet" href="CSS/styles.css">
  </head>
  <title>Error Page</title>
<body>

<h2>Error Page</h2>

<h3>
<% if (exception instanceof SQLException) { %>

An SQL Exception

<% } else if (exception instanceof ClassNotFoundException){ %>

A Class Not Found Exception

<%} else { %>
A Exception

<% } %>
<br>
<br>
<a class="btn" href="index.html"><button class="btn">&larr; Back to Main Page</button></a>

</body></html>
