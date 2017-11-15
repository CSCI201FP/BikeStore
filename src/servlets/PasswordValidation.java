package servlets;

import driver.JDBCDriver;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "PasswordValidation" , urlPatterns = "/password")
public class PasswordValidation extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = (String )request.getSession().getAttribute("email");
        String password = request.getParameter("password");
        boolean rightPassword = JDBCDriver.validateUser(email,password);
        PrintWriter out = response.getWriter();
        if(rightPassword){
            HttpSession session = request.getSession();
            out.print("true");
        }else{
            out.print("false");
        }
    }
}
