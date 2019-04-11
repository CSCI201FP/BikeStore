package objects;

public class User {
    private final int userID;
    private String name;
    private byte[] password;
    private String email;
    private String phone;
    private boolean isManager;
    private boolean isPending;
    private int currentBikeID;

    public User(int userID, String name, byte[] password, String email, String phone, boolean isManager, boolean isPending, int currentBikeID) {
        this.userID = userID;
        this.name = name;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.isManager = isManager;
        this.isPending = isPending;
        this.currentBikeID = currentBikeID;
    }
    public void setName(String n){name = n;}

    public void setPhone(String p){phone = p;}

    public void setPending(boolean pending) {
        isPending = pending;
    }

    public void setCurrentBikeID(int currentBikeID) {
        this.currentBikeID = currentBikeID;
    }

    public String getName() {
        return name;
    }

    public byte[] getPassword() {
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