package reservation_system;

import database.dao.BikeDAO;
import database.dao.UserDAO;
import database.dao_impl.BikeDAOImpl;
import database.dao_impl.UserDAOImpl;
import objects.Bike;
import objects.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ReturnBikeServlet", urlPatterns = "/return-bike")
public class ReturnBikeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAOImpl();
        BikeDAO bikeDAO = new BikeDAOImpl();

        User user = (User) request.getSession().getAttribute("user");
        Bike bike = bikeDAO.getBike(user.getCurrentBikeID());

        //check if the user owns the bike
        if (bike.getCurrentHolderID() != user.getUserID() ||
                user.getCurrentBikeID() != bike.getBikeID() ||
                user.isPending() ||
                bike.getAvailability() != Bike.Availability.reserved){
            response.getWriter().print("You are not eligible to return the bike");
            return;
        }

            bike.setAvailability(Bike.Availability.available);
        bike.setCurrentHolderID(0);

        user.setCurrentBikeID(0);
        user.setPending(false);

        userDAO.updateUser(user);
        bikeDAO.updateBike(bike);

        response.getWriter().print("Your Return Has Been Processed");

    }

}
