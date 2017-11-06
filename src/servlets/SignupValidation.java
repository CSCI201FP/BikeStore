package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "SignupValidation", urlPatterns = "/signup")
public class SignupValidation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        HttpSession session = request.getSession();
        if(doesEmailExist(email)){
            session.setAttribute("email", email);
            request.getRequestDispatcher("passwordEnry.jsp").forward(request, response);
        }
        else{
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }

    }

    private boolean doesEmailExist(String email) {
        return false;
    }

}
