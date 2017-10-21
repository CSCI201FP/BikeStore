package servlets;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import objects.Bike;

/**
 * Servlet implementation class InitServlet
 */
@WebServlet("/InitServlet")
public class InitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Bike> bikeList = new ArrayList<Bike>();
		Connection conn = null;
		Statement st = null;
		ResultSet rt = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Bike?user=root&password=JIAruoxi1997&useSSL=false");;
			st = (Statement) conn.createStatement();
			rt = st.executeQuery("SELECT * FROM Bike.Bikes");

			while(rt.next()){
				String name = rt.getString(1);
				String type = rt.getString(2);
				String picture = rt.getString(3);
				int storeID = rt.getInt(4);
				String state = rt.getString(5);
				Bike bike = new Bike(name,type,picture,storeID,state);
				bikeList.add(bike);
			}
			request.setAttribute("bikeList", bikeList);
		}catch(SQLException sqle){
			System.out.println("sqle: "+sqle.getMessage());
		}catch(ClassNotFoundException cnfe){
			System.out.println("cnfe: "+cnfe.getMessage());
		}finally {
			try {
				if (rt != null){
					rt.close();
				}
				if (st != null){
					st.close(); 
				}
				if (conn != null){
					conn.close(); 
				}
			} catch (SQLException sqle) {
				System.out.println(sqle.getMessage());
			}
		} 
		String nextJSP = "/displayBikes.jsp";
		RequestDispatcher dispatcher =getServletContext().getRequestDispatcher(nextJSP);
		dispatcher.forward(request,response);
		for (int i=0; i<bikeList.size(); i++){
			System.out.println(bikeList.get(i).getPicture());
		}
	}

	

}
