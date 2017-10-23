package servlets;

import objects.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginValidation", urlPatterns = "/login")
public class LoginValidation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private boolean isPasswordMatched(User user){

    }

    public void saveUserInSession(User user){

    }

    public void deleteUserFromSession(){

    }

}
