package objects;

public class Customer extends User {
    private int currentBikeID;   //the bikeID that a customer holds
    private boolean pending;

    private Bike bike;



    public Customer(int userID, String username, String email, String password, String phone, String gender, boolean isManager,
                    boolean isPending, int currentBikeID) {
        super(userID, username,password, email, phone, gender,isManager, isPending);
        this.currentBikeID = currentBikeID;
        this.pending = pending;
    }

    public void reserveBike(int bikeID){
//        new Reservation();
    }

    public void returnBike(){
    }

    public int getCurrentBikeID() {
        return currentBikeID;
    }

    @Override
    public String convertToSQLRow() {
        return null;
    }


}
