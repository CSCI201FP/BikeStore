package servlets;

import objects.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginValidation", urlPatterns = "/login")
public class LoginValidation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String password = request.getParameter("password");
        HttpSession session = request.getSession();
//        if(isPasswordMatched(sessionScope.email, password)){
//
//        }
    }

//    private boolean isPasswordMatched(String email, String password){
//
//    }

    //should this function and the function below in UserGroup servlet?
    public void saveUserInSession(User user){

    }


    public void deleteUserFromSession(){

    }

}
