package MyPack;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class UserLogin extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        PrintWriter out = response.getWriter();

        try{

            UserDAO userDAO = new UserDAO();
            int user_type = userDAO.login(email,password);
            HttpSession session = request.getSession();
            session.setAttribute("user_type",user_type);
            if(user_type != -1){
                response.sendRedirect("JobRecords.jsp");
            }
            else{
                request.setAttribute("msg","Invalid Credentials. Try Again!");
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                rd.forward(request,response);
            }


        }
        catch (Exception e){
            System.out.println(e);
        }




    }

}
