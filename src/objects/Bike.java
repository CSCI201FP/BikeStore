package objects;

public class Bike implements SQLRowConvertible{
    private final int bikeID;
    private int currentHolderID;
    private int storeID;
    private boolean gender;
    private double seatHeight;
    private char availability; //a: available , p: pending, u: unavailable
    private String type;       //mountain, road, etc
    private String picture;     //url to the picture

    private Customer cuurentHolder;
    private Store store;


    public Bike() {
        this.bikeID = -1;
    }


    public Bike(int bikeID, int currentHolderID, int storeID, boolean gender, double seatHeight, char availability, String type, String picture) {
        this.bikeID = bikeID;
        this.currentHolderID = currentHolderID;
        this.storeID = storeID;
        this.gender = gender;
        this.seatHeight = seatHeight;
        this.availability = availability;
        this.type = type;
        this.picture = picture;
    }

    @Override
    public String convertToSQLRow() {
        return null;
    }

    public String getPicture() {
        return picture;
    }
}
