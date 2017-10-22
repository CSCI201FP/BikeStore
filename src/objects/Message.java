package objects;

public class Message implements SQLRowConvertible{
    private int messageID;
    private int senderID;
    private int receiverID;
    private String messageStr;

    private Customer sender;
    private Manager receiver;

    @Override
    public String convertToSQLRow() {
        return null;
    }

}