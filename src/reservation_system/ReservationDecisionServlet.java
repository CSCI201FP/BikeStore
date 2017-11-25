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
import reservation_system.email.EmailSenderThread;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ReservationDecisionServlet", urlPatterns = "/decide-reservation")
public class ReservationDecisionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int reservationID;
        User customer;
        Bike bike;
        Reservation reservation;
        UserDAO userDAO = new UserDAOImpl();
        BikeDAO bikeDAO = new BikeDAOImpl();
        ReservationDAO reservationDAO = new ReservationDAOImpl();


        reservationID = Integer.parseInt(request.getParameter("reservationID"));
        reservation = reservationDAO.getReservation(reservationID);
        String decision = request.getParameter("decision");

        bike = bikeDAO.getBike(reservation.getBikeID());
        customer = userDAO.getUser(reservation.getCustomerID());


        if (decision.equals("approve")) {
            bike.setAvailability(Bike.Availability.reserved);
            bike.setCurrentHolderID(customer.getUserID());
            customer.setCurrentBikeID(bike.getBikeID());
            customer.setPending(false);

            EmailSenderThread est = new EmailSenderThread("Approve", "Congratulations!", customer.getEmail());
            est.start();
        } else if (decision.equals("refuse")) {
            bike.setAvailability(Bike.Availability.available);
            customer.setPending(false);
            customer.setCurrentBikeID(0);
            bike.setCurrentHolderID(0);

            EmailSenderThread est = new EmailSenderThread("Refuse", "Sorry!", customer.getEmail());
            est.start();
        }

        userDAO.updateUser(customer);
        bikeDAO.updateBike(bike);
        reservationDAO.deleteReservation(reservationID);
    }
}
