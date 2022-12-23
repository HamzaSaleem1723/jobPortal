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
    <meta charset="UTF-8">
    <link rel="stylesheet" href="CSS/styles.css">
    <title>Job Records</title>

    <style>
    body{margin-bottom: 100px;}
    tr:hover {background-color: #EEF2E6;}
    th, td {
      padding: 10px;
      border-bottom: 1px solid #ddd;
      font-size: 20px;
    }
    a{
      color: #319DA0;
      font-family: 'Montserrat', sans-serif;
      font-size: 20px;
      margin: 10px 20px;
      text-decoration: underline;
    }
    </style>

</head>

<body>

    <h2> Job Records </h2>
    <br>
    <br>

    <table width=90% style="margin-left: auto; margin-right: auto;"  class="center">

        <tr>
            <th> JobID </th>
            <th> Title </th>
            <th> Description </th>
            <th> Email </th>
        </tr>

        <%
            // retrieving arraylist stored on controller.jsp to display PersonInfo objects
            ArrayList<JobInfo> jobsArrayList = new ArrayList<JobInfo>();
            try{
                UserDAO userDAO = new UserDAO();
                jobsArrayList = userDAO.fetchJobRecords();
            }
            catch (Exception e){
                out.println(e);
            }
            finally {

            }

            JobInfo jobInfo = null;

            for(int i=0; i<jobsArrayList.size(); i++) {
                jobInfo = (JobInfo)jobsArrayList.get(i);
        %>


        <%-- displaying PersonInfo details--%>
        <tr>
            <td> <%= jobInfo.getJobID()%> </td>
            <td> <%= jobInfo.getTitle()%> </td>
            <td> <%= jobInfo.getDescription()%> </td>
            <td> <%= jobInfo.getEmail()%> </td>
        </tr>

        <%
            } // end for
        %>

    </table >

    <%

        if(user_type == 1){
    %>
    <br>
    <br>
    <a href="AddRecord.jsp">Add Job Record</a>
    <a href="UpdateRecord.jsp">Update Job Record</a>
    <a href="DeleteRecord.jsp">Delete Job Record</a>
    <a href="SearchRecordForm.jsp">Search Job Record</a>
    <br>
    <br>
    <br>
    <br>
    <a class="btn" href="Logout.jsp"><button class="btn">Logout</button></a>

    <%
        }
        else{
    %>

    <br>
    <br>
    <a href="SearchRecordForm.jsp">Search Job Record</a>
    <br>
    <br>
    <br>
    <br>
    <a class="btn" href="Logout.jsp"><button class="btn">Logout</button></a>


    <%
        }
    %>


</body>
</html>
