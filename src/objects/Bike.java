package objects;

public class Bike{

    public enum Gender{
        male, female, neutral
    }
    public enum type{
        road, mountain, other
    }

    private final int bikeID;
    private int currentHolderID;
    private boolean gender;
    private double seatHeight;
    private char availability; //a: available , p: pending, u: unavailable
    private String type;       //mountain, road, etc
    private String picture;     //url to the picture

    private Customer cuurentHolder;
    private Store store;

    public static Bike getBikeByID(){
        return null;
    }

    public Bike() {
        this.bikeID = -1;
    }


    public Bike(int bikeID, int currentHolderID, int storeID, boolean gender, double seatHeight, char availability, String type, String picture) {
        this.bikeID = bikeID;
        this.currentHolderID = currentHolderID;
        this.gender = gender;
        this.seatHeight = seatHeight;
        this.availability = availability;
        this.type = type;
        this.picture = picture;
    }


    public String getPicture() {
        return picture;
    }
}
