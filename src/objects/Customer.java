package objects;

public class Customer extends User {
    private int bikeID;   //the bikeID that a customer holds
    private boolean pending;

    private Bike bike;

    public Customer(int userID, String name, String email, String phone, String gender, int bikeID, boolean pending) {
        super(userID, name, email, phone, gender);
        this.bikeID = bikeID;
        this.pending = pending;
    }

    public void reserveBike(int bikeID){
        new Reservation();
    }

    public void returnBike(){
    }


    @Override
    public String convertToSQLRow() {
        return null;
    }


}
