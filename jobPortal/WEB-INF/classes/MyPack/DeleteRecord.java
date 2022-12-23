package MyPack;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

public class DeleteRecord extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

        PrintWriter out = response.getWriter();

        String jobID = request.getParameter("jobID");

        try{

            UserDAO userDAO = new UserDAO();
            int rv = userDAO.deleteJobRecord(jobID);

            if(rv == 1){
                request.setAttribute("msg","Record Deleted Successfully");
                RequestDispatcher rd = request.getRequestDispatcher("DeleteRecord.jsp");
                rd.forward(request,response);
            }

            else{
                request.setAttribute("msg","Record Deletion Failed");
                RequestDispatcher rd = request.getRequestDispatcher("DeleteRecord.jsp");
                rd.forward(request,response);
            }


        }
        catch (Exception e){
            System.out.println(e);
        }




    }

}
