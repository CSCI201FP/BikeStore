package servlets;

import objects.Store;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserGroup", urlPatterns = "/logged_in")
public class UserGroup extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public boolean isLoggedIn(){

    }

    public boolean isManager(){

    }

    public boolean isTheManagerOfStore(Store store){

    }

}
