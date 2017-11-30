package database.dao;

import objects.Reservation;

import java.util.Queue;
import java.util.Set;

public interface ReservationDAO {
    Reservation getReservation(int id);

    Set<Reservation> getAllReservation();

    int insertReservation(Reservation r);

    boolean deleteReservation(int id);
}
