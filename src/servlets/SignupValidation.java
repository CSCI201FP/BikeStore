package servlets;

import driver.JDBCDriver;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SignupValidation", urlPatterns = "/signup")
public class SignupValidation extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        boolean emailExist = JDBCDriver.validateEmail(email);
        PrintWriter out = response.getWriter();
        if (emailExist){
            out.print("email exist");
            return;
        }else{
            out.print("true");
        }
        JDBCDriver.signupUser(email,password,username,phone);
//        String email = request.getParameter("email");
//        HttpSession session = request.getSession();
//        if(doesEmailExist(email)){
//            session.setAttribute("email", email);
//            request.getRequestDispatcher("passwordEnry.jsp").forward(request, response);
//        }
//        else{
//            request.getRequestDispatcher("signup.jsp").forward(request, response);
//        }

    }

    private boolean doesEmailExist(String email) {
        return false;
    }

}
