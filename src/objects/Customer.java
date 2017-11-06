package objects;

public class Customer extends User {
    private int bikeID;   //the bikeID that a customer holds
    private boolean pending;

    private Bike bike;

    public Customer(int userID, String username, String email,String password, String phone, String gender, int bikeID, boolean isManager,
                    boolean isPending) {
        super(userID, username,password, email, phone, gender,isManager, isPending);
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
