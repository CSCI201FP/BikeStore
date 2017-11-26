package servlets;

import database.dao.UserDAO;
import database.dao_impl.UserDAOImpl;
import objects.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateUserServlet", urlPatterns = "/update-user")
public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAOImpl();
        String newName = request.getParameter("name");
        String newPhone = request.getParameter("phone");

        User user = (User) request.getSession().getAttribute("user");

        user.setName(newName);
        user.setPhone(newPhone);

        userDAO.updateUser(user);

        response.sendRedirect("/userInfo.jsp");
    }
}
