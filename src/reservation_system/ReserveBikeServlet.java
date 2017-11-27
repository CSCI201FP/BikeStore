package reservation_system;

import database.dao.BikeDAO;
import database.dao.ReservationDAO;
import database.dao.UserDAO;
import database.dao_impl.BikeDAOImpl;
import database.dao_impl.ReservationDAOImpl;
import database.dao_impl.UserDAOImpl;
import objects.Bike;
import objects.Reservation;
import objects.User;

import javax.enterprise.event.Event;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ReserveBikeServlet", urlPatterns = "/reserve-bike")
public class ReserveBikeServlet extends HttpServlet {
    @Inject
    private Event<Reservation> newReservationEvent;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BikeDAO bikeDAO = new BikeDAOImpl();
        UserDAO userDAO = new UserDAOImpl();
        ReservationDAO reservationDAO = new ReservationDAOImpl();

        int bikeID = Integer.valueOf(request.getParameter("bikeID").trim());

        Bike bike = bikeDAO.getBike(bikeID);
        User customer = (User)request.getSession().getAttribute("user");

        //set the data correspond to reservation
        customer.setPending(true);
        customer.setCurrentBikeID(bikeID);
        bike.setCurrentHolderID(customer.getUserID());
        bike.setAvailability(Bike.Availability.pending);

        //update the bike and user to db
        bikeDAO.updateBike(bike);
        userDAO.updateUser(customer);

        //update the user in the session


        //insert the reservation to db
        Reservation reservation = new Reservation(customer.getUserID(), bikeID);
        reservationDAO.insertReservation(reservation);

        //fire the event
        newReservationEvent.fire(reservation);
    }

}
