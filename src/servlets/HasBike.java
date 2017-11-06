package servlets;

import objects.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "HasBike")
public class HasBike extends HttpServlet {
    private HttpSession sess;
    private User user;
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        sess = request.getSession();
        user = (objects.User)sess.getAttribute("user");
    }


    public boolean hasBike(){
        if(user!=null){
            if(user.isManager()==false){
                //problem!!!!!!!
//                Customer cus = (Customer)user;
//                if(cus.getCurrentBikeID()==null) return false;
            }
        }
        return false;
    }
}
