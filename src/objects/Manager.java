package objects;

import java.util.ArrayList;

public class Manager {

    private ArrayList<Integer> storeIDs;
    private ArrayList<Store> stores;
//    private Queue<Reservation> reservations;

    public void addStore() {
        Store store = new Store();
        //add to stores
        //add to SQL
    }
    public void deleteStore() {
        //delete from stores
        //delete from SQL
    }

    public void addBike() {
        Bike bike = new Bike();
        //add to bikeList
        //add to SQL
    }

    public void deletBike(int bikeID) {
        //delete bikeList
        //delete SQL
    }

    public void confirmReservation() {
        //change bikeList state
        //change SQL bike state
    }



}
