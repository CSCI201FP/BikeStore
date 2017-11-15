package database.util;

import java.sql.*;
import java.util.Properties;

public class ConnectionFactory {
    private static final String URL = "jdbc:mysql://csci201fpbikestore.c5aegydmv7iw.us-west-1.rds.amazonaws.com:3306/";
    private static final String USER = "root";
    private static final String PASSWORD = "root1984";
    private static final String DATABASE = "BikeStore";

    public static Connection getConnection(){
        return getConnection(URL + DATABASE, USER, PASSWORD);

    }

    public static Connection getConnection(String dbName) throws SQLException {
        return getConnection(URL + dbName, USER, PASSWORD);
    }

    public static Connection getConnection(String dbURL, String user, String password){
        Properties properties = new Properties();
        properties.put("user", user);
        properties.put("password", password);

        properties.put("useSSL", "false");

        try {
            Class.forName("com.mysql.jdbc.Driver");

            return DriverManager.getConnection(dbURL, properties);
        } catch (ClassNotFoundException ex) {
            System.out.println("@ConnectionFactory.getConnection -> " +
                    "ClassNotFoundException: " + ex.getMessage());
            ex.printStackTrace();
        } catch (SQLException ex) {
            System.out.println("@ConnectionFactory.getConnection -> " +
                    "SQLException: " + ex.getMessage());
            ex.printStackTrace();
        }

        // return null if failed
        return null;
    }

    public static void closeConnection(ResultSet rs, PreparedStatement ps, Statement st, Connection connection) {
        try {
            if (rs != null) {
                rs.close();
            }

            if (ps != null) {
                ps.close();
            }

            if (st != null) {
                st.close();
            }

            if (connection != null) {
                connection.close();
            }
        } catch (SQLException ex) {
            System.out.println("SQLException: " + ex.getMessage());
        }
    }
}
