package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

import database.dao.UserDAO;
import database.dao_impl.UserDAOImpl;
import objects.User;

@WebServlet(name = "SignupValidation", urlPatterns = "/signup")
public class SignupValidation extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAOImpl();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");

        PrintWriter out = response.getWriter();

        if (userDAO.existEmail(email)){
            out.print("signup-fail");
        }else {
            out.print("signup-success");
            userDAO.insertUser(new User(0,name, password, email, phone, false,false,0));
            request.getSession().setAttribute("user", userDAO.getUser(email));
        }
    }

    private boolean doesEmailExist(String email) {
        return false;
    }

}
