package objects;

public class Bike {

    public enum Gender {
        male, female, neutral
    }

    public enum Type {
        road, mountain, other
    }

    public enum Availability {
        available, pending, reserved
    }

    private final int bikeID;
    private int currentHolderID;
    private Gender gender;
    private double seatHeight;
    private Availability availability; //a: available , p: pending, u: unavailable
    private Type type;       //mountain, road, etc
    private String picture;     //url to the picture

    public static Bike getBikeByID() {
        return null;
    }

    public Bike(int bikeID, int currentHolderID, Gender gender, double seatHeight, Availability availability, Type type, String picture) {
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

    public int getBikeID() {
        return bikeID;
    }

    public int getCurrentHolderID() {
        return currentHolderID;
    }

    public Gender getGender() {
        return gender;
    }

    public double getSeatHeight() {
        return seatHeight;
    }

    public Availability getAvailability() {
        return availability;
    }

    public Type getType() {
        return type;
    }

}
