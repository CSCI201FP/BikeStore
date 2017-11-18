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

@WebServlet(name = "ReserveBikeServlet", urlPatterns = "/reserve")
public class ReserveBikeServlet extends HttpServlet {
    @Inject
    private Event<Reservation> newReservationEvent;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BikeDAO bikeDAO = new BikeDAOImpl();
        UserDAO userDAO = new UserDAOImpl();
        ReservationDAO reservationDAO = new ReservationDAOImpl();

        int bikeID = Integer.valueOf(request.getParameter("bikeID").trim());
        int customerID = Integer.valueOf(request.getParameter("customerID").trim());

        Bike bike = bikeDAO.getBike(bikeID);
        User customer = userDAO.getUser(customerID);

        //set the data correspond to reservation
        customer.setPending(true);
        customer.setCurrentBikeID(bikeID);
        bike.setCurrentHolderID(customerID);

        //update the bike and user to db
        bikeDAO.updateBike(bike);
        userDAO.updateUser(customer);

        //insert the reservation to db
        Reservation reservation = new Reservation(customerID, bikeID);
        reservationDAO.insertReservation(reservation);

        //fire the event
        newReservationEvent.fire(reservation);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
