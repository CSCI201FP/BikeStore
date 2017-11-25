package servlets;

import database.dao.BikeDAO;
import database.dao_impl.BikeDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteBikeServlet", urlPatterns = "/delete-bike")
public class DeleteBikeServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int bikeID = Integer.valueOf(request.getParameter("bikeID"));
            BikeDAO bikeDAO = new BikeDAOImpl();
            bikeDAO.deleteBike(bikeID);
            response.getWriter().print("Bike Deleted");
        } catch (NumberFormatException e) {
            response.getWriter().print("ID Error");
            e.printStackTrace();
        }
    }
}
