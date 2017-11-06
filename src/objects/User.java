package objects;

import java.util.ArrayList;

public abstract class User extends SQLRowConvertible{
    private final int userID;
    private String username;
    private String password;
    private String email;
    private String phone;
    private String gender;
    private boolean isManager;
    private boolean isPending;
    public static ArrayList<User> onlineUsers;

    public static User getUserByID(int userID){
        return null;
    }



    public User(int userID, String username, String password, String email, String phone, String gender, Boolean isManager,
                Boolean isPending) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.isManager = isManager;
        this.isPending = isPending;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }
    public boolean isManager(){
        return isManager;
    }

    public boolean isPending(){
        return isPending;
    }
}
