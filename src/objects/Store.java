package objects;

//storeID, location, name
public class Store {
    private final int storeID;
    private int managerID;
    private String name;
    private String location;
    private String time;

//    private Manager manager;

    public Store() {
        this.storeID = -1;
    }

    public Store(int storeID, String name, String location, String time) {
        this.storeID = storeID;
        this.name = name;
        this.location = location;
        this.time = time;
    }

    public String getName(){
        return name;
    }

    public String getLocation(){
        return location;
    }

    public String getTime(){
        return time;
    }


}
