package servlets;

import database.dao.BikeDAO;
import database.dao_impl.BikeDAOImpl;
import objects.Bike;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddBikeServlet", urlPatterns = "/addBike")
public class AddBikeServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String gender = request.getParameter("gender");
        String seatHeight = request.getParameter("seatHeight");
        String type = request.getParameter("type");
        String picture = request.getParameter("picture");

        try{
            Double shDouble = Double.parseDouble(seatHeight);
        }catch(NumberFormatException nfe){
            response.getWriter().print("seatHeight");
            return;
        }

        try{
            Bike.Gender.valueOf("female");
        }catch(IllegalArgumentException iae){
            response.getWriter().print("gender");
            return;
        }

        try {
            Bike.Type.valueOf(type);
        }catch(IllegalArgumentException iae){
            response.getWriter().print("type");
            return;
        }

        Bike b = new Bike(0,0,Bike.Gender.valueOf(gender), Double.parseDouble(seatHeight), Bike.Availability.valueOf("available"),
                Bike.Type.valueOf(type),picture);
        BikeDAO bikeDAO = new BikeDAOImpl();
        bikeDAO.insertBike(b);
        response.getWriter().print("success");
    }

}
