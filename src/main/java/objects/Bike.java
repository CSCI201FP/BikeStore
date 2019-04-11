package objects;

import database.dao.UserDAO;
import database.dao_impl.UserDAOImpl;

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
    private String model;
    private int currentHolderID;
    private Gender gender;
    private double seatHeight;
    private Availability availability; //a: available , p: pending, u: unavailable
    private Type type;       //mountain, road, etc
    private String picture;     //url to the picture

    private String currentHolderName;
    private String currentHolderEmail;

    public static Bike getBikeByID() {
        return null;
    }

    public Bike(int bikeID, int currentHolderID, Gender gender, double seatHeight, Availability availability,
                Type type, String picture, String model) {
        this.bikeID = bikeID;
        this.currentHolderID = currentHolderID;
        this.gender = gender;
        this.seatHeight = seatHeight;
        this.availability = availability;
        this.type = type;
        this.picture = picture;
        this.model = model;
    }

    public void extendFields() {
        UserDAO userDAO = new UserDAOImpl();

        User currentHolder = userDAO.getUser(currentHolderID);

        if (currentHolder == null) {
            currentHolderName = "N/A";
            currentHolderEmail = "N/A";
        } else {
            currentHolderEmail = currentHolder.getEmail();
            currentHolderName = currentHolder.getName();
        }
    }

    public void setCurrentHolderID(int currentHolderID) {
        this.currentHolderID = currentHolderID;
    }


    public String getModel() {
        return model;
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

    public void setAvailability(Availability availability) {
        this.availability = availability;
    }
}
