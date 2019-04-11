package objects;

//storeID, location, name
public class Store {
    private final int storeID;
    private String name;
    private String streetAddress;
    private String hours;
    private String description;

//    private Manager manager;

    public Store() {
        this.storeID = -1;
    }

    public Store(int storeID, String name, String streetAddress, String hours, String description) {
        this.storeID = storeID;
        this.name = name;
        this.streetAddress = streetAddress;
        this.hours = hours;
        this.description = description;
    }


    public int getStoreID() {
        return storeID;
    }

    public String getName() {
        return name;
    }

    public String getStreetAddress() { return streetAddress; }

    public String getHours() {
        return hours;
    }

    public String getDescription() {
        return description;
    }
}
