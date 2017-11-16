package servlets;

import database.dao.UserDAO;
import database.dao_impl.UserDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginValidation", urlPatterns = "/login")
public class LoginValidation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDAO userDAO = new UserDAOImpl();

        if (userDAO.emailPasswordMatch(email,password)){
            request.getSession().setAttribute("user", userDAO.getUser(email));
            request.getRequestDispatcher("/bike.jsp").forward(request,response);
        }else {
            request.setAttribute("warn","Login Invalid");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
    }
}
