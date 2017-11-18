package database.dao_impl;

import database.dao.ReservationDAO;
import database.util.ConnectionFactory;
import objects.Reservation;

import java.sql.*;
import java.util.Queue;

public class ReservationDAOImpl implements ReservationDAO {

    private Reservation extractReservationFromResultSet(ResultSet rs) throws SQLException{
        int reservationID = rs.getInt("reservationID");
        int customerID = rs.getInt("customerID");
        int bikeID = rs.getInt("bikeID");
        Timestamp reservationTime = rs.getTimestamp("reservationTime");

        return new Reservation(reservationID, customerID, bikeID, reservationTime);
    }

    @Override
    public Reservation getReservation(int id) {
        Connection connection = ConnectionFactory.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM Reservations WHERE reservationID=?");
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return extractReservationFromResultSet(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public Queue<Reservation> getAllReservation() {
        return null;
    }

    @Override
    public boolean insertReservation(Reservation r) {
        Connection connection = ConnectionFactory.getConnection();
        try {
            PreparedStatement ps = connection
                    .prepareStatement("INSERT INTO Reservations " +
                            "(customerID, bikeID) " +
                            "VALUES (?, ?)");

            ps.setInt(1, r.getCustomerID());
            ps.setInt(2, r.getBikeID());

            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateReservation(Reservation r) {
        return false;
    }

    @Override
    public boolean deleteReservation(int id) {
        return false;
    }
}
