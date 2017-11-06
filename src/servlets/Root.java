package servlets;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import objects.Bike;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "Root", urlPatterns = "")
public class Root extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_ADDRESS = "";
    private static final String DB_USERNAME = "";
    private static final String DB_PASSWORD = "";
    private static Connection db_conn;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Bike> bikeList = new ArrayList<Bike>();
        Connection conn = null;
        Statement st = null;
        ResultSet rt = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Bike?user=root&password=*&useSSL=false");
            st = (Statement) conn.createStatement();
            rt = st.executeQuery("SELECT * FROM Bike.Bikes");

            while (rt.next()) {
                String name = rt.getString(1);
                String type = rt.getString(2);
                String picture = rt.getString(3);
                int storeID = rt.getInt(4);
                String state = rt.getString(5);
//                public Bike(int bikeID, int currentHolderID, int storeID, boolean gender, double seatHeight, char availability, String type, String picture)
                Bike bike = new Bike(1,2,3,true,1.2,'y', "asdf", "www.bike.com");
                bikeList.add(bike);
            }
            request.setAttribute("bikeList", bikeList);
        } catch (SQLException sqle) {
            System.out.println("sqle: " + sqle.getMessage());
        } catch (ClassNotFoundException cnfe) {
            System.out.println("cnfe: " + cnfe.getMessage());
        } finally {
            try {
                if (rt != null) {
                    rt.close();
                }
                if (st != null) {
                    st.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException sqle) {
                System.out.println(sqle.getMessage());
            }
        }
        String nextJSP = "/displayBikes.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
        dispatcher.forward(request, response);
        for (int i = 0; i < bikeList.size(); i++) {
            System.out.println(bikeList.get(i).getPicture());
        }
    }
}
