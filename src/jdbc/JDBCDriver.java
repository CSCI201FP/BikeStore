package jdbc;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCDriver {
    private static Connection conn = null;
    private static ResultSet rs = null;
    private static PreparedStatement ps = null;


    public static void connect(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/BikeStore?user=root&password=root&useSSL=false");
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static void close(){
        try{
            if (rs!=null){
                rs.close();
                rs = null;
            }
            if(conn != null){
                conn.close();
                conn = null;
            }
            if(ps != null ){
                ps = null;
            }
        }catch(SQLException sqle){
            System.out.println("connection close error");
            sqle.printStackTrace();
        }
    }

    public static boolean checkEmail(String email) {
        connect();
        try {
            ps = conn.prepareStatement("SELECT * from Users where email = '" + email + "' ");
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return false;
    }

}
