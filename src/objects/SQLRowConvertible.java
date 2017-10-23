package objects;

import java.util.HashMap;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public abstract class SQLRowConvertible {

    private static HashMap<Class, String> classToTableName;
    private static Connection db_conn;
    private final static String DB_USERNAME = "";
    private final static String DB_PASSWORD = "";
    private final static String DB_ADDRESS = "jdbc:mysql://localhost:3306/Bike";

     static {
        classToTableName = new HashMap<>(6);
        classToTableName.put(User.class, "User");
        classToTableName.put(Reservation.class, "Reservation");
        classToTableName.put(Bike.class, "Bike");
        classToTableName.put(Store.class,"Store");
        classToTableName.put(Manager.class, "User");
        classToTableName.put(Customer.class, "User");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            db_conn = DriverManager
                    .getConnection(DB_ADDRESS+"?user="+DB_USERNAME+"&password="+DB_PASSWORD+"&useSSL=false");
        } catch (SQLException sqle) {
            System.out.println("sqle: " + sqle.getMessage());
        } catch (ClassNotFoundException cnfe) {
            System.out.println("cnfe: " + cnfe.getMessage());
        }

    }

    /**
     * pull a new instance of the SQLRowConvertible object from the corresponding SQL table by ID
     * @param classType the class of the target object
     * @param SQLConvertibleID the id of the target object
     * @return a new instance of this object
     */
    public static SQLRowConvertible getSQLConvertibleByID(Class classType, int SQLConvertibleID){

        return null;
    }

    /**
     * save the SQLRowConvertible object into the SQL database
     * @param src the object to save
     * @param typeName the type name of the object: "User", "Bike", "Reservation", "Store"
     */
    public static void saveToSQLTable(SQLRowConvertible src, String typeName){

    }

    /**
     * convert a SQLRowConvertible to a SQL row
     * @return a string that can be saved into the SQL database
     */
    public abstract String convertToSQLRow();

}



