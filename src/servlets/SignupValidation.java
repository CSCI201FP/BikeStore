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
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        boolean emailExist = userDAO.existEmail(email);
        PrintWriter out = response.getWriter();
        if (emailExist){
            out.print("email exist");
            return;
        }else{
            out.print("true");
        }

        userDAO.insertUser(new User(0,username, password, email, phone, false,false,0));

        User newUser = userDAO.getUser(email);
        HttpSession session = request.getSession();
        session.setAttribute("SignedIn", true);
        session.setAttribute("User", newUser);
        request.getRequestDispatcher("customerHomepage.jsp").forward(request, response);
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
