package database.dao;

import objects.Reservation;

import java.util.Set;

public interface ReservationDAO {
    Reservation getReservation(int id);

    Set getAllReservation();

    boolean insertReservation(Reservation r);

    boolean updateReservation(Reservation r);

    boolean deleteReservation(int id);
}
