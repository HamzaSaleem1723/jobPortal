package MyPack;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;


public class UpdateRecord extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

        PrintWriter out = response.getWriter();

        String jobID = request.getParameter("jobID");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String email = request.getParameter("email");

        JobInfo jobInfo = new JobInfo();
        jobInfo.setJobID(jobID);
        jobInfo.setTitle(title);
        jobInfo.setDescription(description);
        jobInfo.setEmail(email);

        try{

            UserDAO userDAO = new UserDAO();
            int rv = userDAO.updateJobRecord(jobInfo);

            if(rv == 1){
                request.setAttribute("msg","Record Updated Successfully");
                RequestDispatcher rd = request.getRequestDispatcher("UpdateRecord.jsp");
                rd.forward(request,response);
            }

            else{
                request.setAttribute("msg","Record Updation Failed");
                RequestDispatcher rd = request.getRequestDispatcher("UpdateRecord.jsp");
                rd.forward(request,response);
            }


        }
        catch (Exception e){
            System.out.println(e);
        }




    }

}
