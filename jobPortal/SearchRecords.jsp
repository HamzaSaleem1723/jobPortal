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
      <title>Search Record</title>

      <style>
      body{margin-bottom: 100px;}
      TR:hover {background-color: #EEF2E6;}
      TH, TD {
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


<TABLE width=90% style="margin-left: auto; margin-right: auto;"  class="center">

    <%
        String recordToSearch = request.getParameter("recordToSearch");
        ArrayList<JobInfo> jobsArrayList = new ArrayList<JobInfo>();
        try{
            UserDAO userDAO = new UserDAO();
            jobsArrayList = userDAO.searchJobRecords(recordToSearch);
        }
        catch (Exception e){
            out.println(e);
        }

        if(jobsArrayList.isEmpty()){
    %>

    <jsp:forward page="SearchRecordForm.jsp">
    <jsp:param name="message" value="No Records Found" />
    </jsp:forward>

    <%
        }
        else{
            JobInfo jobInfo = null;

    %>
    <h2>Search Results </h2>
    <br>
    <br>
        <TR>
            <TH> JobID </TH>
            <TH> Title </TH>
            <TH> Description </TH>
            <TH> Email </TH>
        </TR>

    <%
            for(int i=0; i<jobsArrayList.size(); i++) {
                jobInfo = (JobInfo)jobsArrayList.get(i);

    %>



    <TR>
        <TD> <%= jobInfo.getJobID()%> </TD>
        <TD> <%= jobInfo.getTitle()%> </TD>
        <TD> <%= jobInfo.getDescription()%> </TD>
        <TD> <%= jobInfo.getEmail()%> </TD>
    </TR>

    <%
            }
        }    // end for
    %>

</TABLE >
<br>
<br>
<br>
<br>
<a class="btn" href="SearchRecordForm.jsp"><button class="btn">&larr; Back</button></a>


</body>
</html>
