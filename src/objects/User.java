package objects;

import java.util.ArrayList;
import java.util.Queue;

public abstract class User extends SQLRowConvertible{
    private final int userID;
    private String name;
    private String email;
    private String phone;
    private String gender;
    public static ArrayList<User> onlineUsers;

    public static User getUserByID(int userID){
        return null;
    }

    public User() {
        this.userID = -1;
    }

    public User(int userID, String name, String email, String phone, String gender) {
        this.userID = userID;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
    }

    public String getName() {
        return name;
    }
}
