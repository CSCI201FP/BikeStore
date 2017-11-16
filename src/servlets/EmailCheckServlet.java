package servlets;

import database.dao.UserDAO;
import database.dao_impl.UserDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EmailCheckServlet", urlPatterns = "/email-check")
public class EmailCheckServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAOImpl();
        String email = request.getParameter("email");
        if (userDAO.existEmail(email)){
            response.getWriter().print("existent");
        } else {
            response.getWriter().print("nonexistent");
        }

    }
}
