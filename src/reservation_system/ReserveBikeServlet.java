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

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ReserveBikeServlet", urlPatterns = "/reserve")
public class ReserveBikeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BikeDAO bikeDAO = new BikeDAOImpl();
        UserDAO userDAO = new UserDAOImpl();
        ReservationDAO reservationDAO = new ReservationDAOImpl();

        int bikeID = Integer.valueOf(request.getParameter("bikeID").trim());
        int customerID = Integer.valueOf(request.getParameter("customerID").trim());

        Bike bike = bikeDAO.getBike(bikeID);
        User customer = userDAO.getUser(customerID);

        customer.setPending(true);
        customer.setCurrentBikeID(bikeID);

        bike.setCurrentHolderID(customerID);

        bikeDAO.updateBike(bike);
        userDAO.updateUser(customer);

        Reservation reservation = new Reservation(customerID, bikeID);
        reservationDAO.insertReservation(reservation);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
