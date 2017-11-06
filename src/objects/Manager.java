package objects;

import java.util.ArrayList;
import java.util.Queue;

public class Manager extends User {

    private ArrayList<Integer> storeIDs;
    private ArrayList<Store> stores;
    private Queue<Reservation> reservations;

    public Manager(int userID, String username, String email, String password, String phone, String gender,boolean isManager,
                   boolean isPending) {
        super(userID,username,password, email, phone, gender,isManager, isPending);
    }

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

    @Override
    public String convertToSQLRow() {
        return null;
    }

}
