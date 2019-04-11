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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String gender = request.getParameter("gender");
        String seatHeight = request.getParameter("seatHeight");
        String type = request.getParameter("type");
        String picture = request.getParameter("picture");
        String model = request.getParameter("model");

        try {
            Bike.Gender.valueOf(gender);
        } catch (IllegalArgumentException iae) {
            response.getWriter().print("gender");
            return;
        }

        try {
            Double.parseDouble(seatHeight);
        } catch (NumberFormatException nfe) {
            response.getWriter().print("seatHeight");
            return;
        }

        try {
            Bike.Type.valueOf(type);
        } catch (IllegalArgumentException iae) {
            response.getWriter().print("type");
            return;
        }

        if (picture==null||picture.equals("")){
            picture = "https://d.pr/i/B9mSGr+";
        }


        Bike b = new Bike(0, 0, Bike.Gender.valueOf(gender), Double.parseDouble(seatHeight), Bike.Availability.valueOf("available"),
                Bike.Type.valueOf(type), picture, model);
        BikeDAO bikeDAO = new BikeDAOImpl();
        bikeDAO.insertBike(b);
        response.getWriter().print("success");
    }

}
