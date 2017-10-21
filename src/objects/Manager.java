package objects;

import java.util.ArrayList;

import com.mysql.jdbc.Connection;

public class Manager extends User {
    private Connection conn = null;
    private ArrayList<Store> storeList;

    public Manager(String name, String email, String phone, String gender,
                   ArrayList<Store> storeList) {
        super(name, email, phone, gender);
        this.storeList = storeList;
    }

    public void addStore() {
        //add to storeList
        //add to SQL
    }

    public void deleteStore() {
        //delete from storeList
        //delete from SQL
    }

    public void addBike() {
        //add to bikeList
        //add to SQL
    }

    public void deletBike() {
        //delete bikeList
        //delete SQL
    }

    public void confirmReserve() {
        //change bikeList state
        //change SQL bike state
    }

}
