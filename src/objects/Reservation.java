package objects;

import database.dao.UserDAO;
import database.dao_impl.UserDAOImpl;

import java.sql.Timestamp;

public class Reservation{
    private int reservationID;
    private int senderID;
    private int bikeID;
    private Timestamp reservationTime;

    public Reservation(int reservationID, int senderID, int bikeID, Timestamp reservationTime) {
        this.reservationID = reservationID;
        this.senderID = senderID;
        this.bikeID = bikeID;
        this.reservationTime = reservationTime;
    }

    public Reservation(int senderID, int bikeID) {
        this.reservationID = 0;
        this.senderID = senderID;
        this.bikeID = bikeID;
        this.reservationTime = null;
    }

    public String toString(){
        UserDAO userDAO = new UserDAOImpl();
        return userDAO.getUser(senderID).getName() + " has reserved a bike";
    }

    public int getReservationID() {
        return reservationID;
    }

    public int getSenderID() {
        return senderID;
    }

    public int getBikeID() {
        return bikeID;
    }

    public Timestamp getReservationTime() {
        return reservationTime;
    }
}