package login_signup;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import database.dao_impl.UserDAOImpl;
import objects.User;

@WebServlet(name = "UpdateProfileServlet", urlPatterns = "/updateprofile")
public class UpdateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAOImpl udb = new UserDAOImpl();
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");


        //getting null pointer error here
        //User u = udb.getUser(email);
        //u.setName(name);
        //u.setPhone(phone);

        //udb.updateUser(u);
        //request.getSession().setAttribute("user", u);
        response.sendRedirect("/userInfo.jsp");
    }


}
