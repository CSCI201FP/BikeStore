package servlets;

import objects.Store;
import objects.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "UserGroup", urlPatterns = "/logged_in")
public class UserGroup extends HttpServlet {
    //all managers in database
    private ArrayList<HttpSession> sessionList;
    private HttpSession sess;
    private User user;
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        sess = request.getSession();
        //if the user is not logged in
        if(sess.getAttribute("user") == null){
            response.sendRedirect(request.getContextPath() + "/login");
        }
        if(sess.getAttribute("user")!=null){
            user = (objects.User) request.getAttribute("user");
            sessionList.add(sess);
        }
    }

    public boolean isLoggedIn(){
        //setAttribute in loginValidation session.setAttribute("user",user);
        if(sess.getAttribute("user")==null){
            return false;
        }
        return true;
    }

    //should this be in a user class?
/*    public boolean isManager(){
        String username = (String)sess.getAttribute("username");
        String password = (String)sess.getAttribute("password");
        for (Manager manager: managerList){
            if (user.getName()== manager.getName() && user.getPassword() == manager.getPassword()){
                return true;
            }
        }
        return false;
    }*/

    //do not implement until most functions are written
    public boolean isTheManagerOfStore(Store store){
        return false;
    }

}
