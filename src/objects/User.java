package objects;

import java.util.Queue;

public abstract class User implements SQLRowConvertible{
    private final int userID;
    private String name;
    private String email;
    private String phone;
    private String gender;

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

}
