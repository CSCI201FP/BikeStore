package objects;

public class User {
    private final int userID;
    private String name;
    private String password;
    private String email;
    private String phone;
    private boolean isManager;
    private boolean isPending;
    private int currentBikeID;

    public static User getUserByID(int userID) {
        return null;
    }


    public User(int userID) {
        this.userID = userID;
    }

    public User(int userID, String name, String password, String email, String phone, boolean isManager, boolean isPending, int currentBikeID) {
        this.userID = userID;
        this.name = name;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.isManager = isManager;
        this.isPending = isPending;
        this.currentBikeID = currentBikeID;

    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public boolean isManager() {
        return isManager;
    }

    public boolean isPending() {
        return isPending;
    }

    public int getUserID() {
        return userID;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public int getCurrentBikeID() {
        return currentBikeID;
    }
}
