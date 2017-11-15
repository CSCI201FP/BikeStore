package servlets;

import database.dao_impl.UserDAOImpl;
import objects.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginValidation", urlPatterns = "/login")
public class LoginValidation extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        HttpSession session = request.getSession();
        boolean exist = new UserDAOImpl().existEmail(email);
        PrintWriter out = response.getWriter();
        if(exist){
            session.setAttribute("email", email);
            out.print("<form name='passwordForm' onsubmit='return validateUser()'>");
            out.print("password<input name='password' type = 'text'>");
            out.print("<input type = 'submit' value = 'next'>");
            out.print("</form>");
        }else {
            out.print("<form name='loginForm' onsubmit='return validateEmail()'>");
            out.print("Email:<input name='email' type = 'text'>");
            out.print("<input type = 'submit' value = 'Next'>");
            out.print("</form>");
        }
    }

    public void saveUserInSession(User user){

    }


    public void deleteUserFromSession(){

    }

}
