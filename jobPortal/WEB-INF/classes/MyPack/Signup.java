package MyPack;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class Signup extends HttpServlet{

    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {

        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);

        try{
            UserDAO userdao = new UserDAO();
            int rv = userdao.addUser(user);
            if(rv == 1){
                request.setAttribute("msg","Signup Successful");
                RequestDispatcher rd = request.getRequestDispatcher("Signup.jsp");
                rd.forward(request,response);
            }
            else{
                request.setAttribute("msg","Signup Failed");
                RequestDispatcher rd = request.getRequestDispatcher("Signup.jsp");
                rd.forward(request,response);
            }
        }
        catch (Exception e){
            System.out.println(e);
        }



    }
}
