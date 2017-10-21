package objects;

import java.util.ArrayList;

public class Customer extends User {
    private ArrayList<Bike> bikes;  //also show pending bikes?

    public Customer(String name, String email, String phone, String gender, ArrayList<Bike> bikes) {
        super(name, email, phone, gender);
        this.bikes = bikes;
    }

    public ArrayList<Bike> getBikes() {
        return bikes;
    }

    public void addBike(Bike bike) {
        bikes.add(bike);
    }

    //should parameter be a Bike object or an index of the bike?
    public void returnBike(Bike bike) {
        bikes.remove(bike);
    }
}
