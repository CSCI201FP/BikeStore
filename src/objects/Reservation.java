package objects;

import database.dao.BikeDAO;
import database.dao.UserDAO;
import database.dao_impl.BikeDAOImpl;
import database.dao_impl.UserDAOImpl;

import java.sql.Timestamp;

public class Reservation{
    private int reservationID;
    private int customerID;
    private int bikeID;
    private Timestamp reservationTime;

    private String customerName;
    private String customerEmail;
    private String bikeModel;


    public Reservation(int reservationID, int customerID, int bikeID, Timestamp reservationTime) {
        this.reservationID = reservationID;
        this.customerID = customerID;
        this.bikeID = bikeID;
        this.reservationTime = reservationTime;
    }

    public Reservation(int customerID, int bikeID) {
        this.reservationID = 0;
        this.customerID = customerID;
        this.bikeID = bikeID;
        this.reservationTime = null;
    }

    public void extendFields(){
        UserDAO userDAO = new UserDAOImpl();
        BikeDAO bikeDAO = new BikeDAOImpl();

        User customer = userDAO.getUser(customerID);

        customerName = customer.getName();
        customerEmail = customer.getEmail();

        bikeModel = bikeDAO.getBike(bikeID).getModel();
    }

    public String toString(){
        UserDAO userDAO = new UserDAOImpl();
        return userDAO.getUser(customerID).getName() + " has reserved a bike";
    }

    public int getReservationID() {
        return reservationID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public int getBikeID() {
        return bikeID;
    }

    public Timestamp getReservationTime() {
        return reservationTime;
    }
}