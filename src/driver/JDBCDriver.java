package driver;

import database.util.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCDriver {
    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;
    public static void connect() {
        conn = ConnectionFactory.getConnection();
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

    public static boolean validateEmail(String email){
        connect();
        try {
            ps =(PreparedStatement) conn.prepareStatement("SELECT email FROM Users WHERE email=?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            System.out.println(rs);
            if(rs.next()){
                return true;
            }
        } catch (SQLException e) {
            System.out.println("SQLException in function \"validate\"");
            e.printStackTrace();
        }finally{
            close();
        }
        return false;
    }

    public static boolean validateUser(String email, String pwd){
        connect();
        try {
            ps =(PreparedStatement) conn.prepareStatement("SELECT email,password FROM Users WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2,pwd);
            rs = ps.executeQuery();
            if(rs.next()) {
                System.out.println(rs.getString("password"));
                return true;
            }
        } catch (SQLException e) {
            System.out.println("SQLException in function \"validate\"");
            e.printStackTrace();
        }finally{
            close();
        }
        return false;
    }

    public static boolean signupUser(String email, String pwd, String username, String phone){
        connect();
        try {
            ps =(PreparedStatement) conn.prepareStatement("INSERT INTO Users(email, password, name, phone) VALUES(?,?,?,?)");
            ps.setString(1, email);
            ps.setString(2,pwd);
            ps.setString(3,username);
            ps.setString(4,phone);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQLException in function \"validate\"");
            e.printStackTrace();
        }finally{
            close();
        }
        return false;
    }
}
