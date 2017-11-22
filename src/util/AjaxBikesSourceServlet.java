package util;

import com.google.gson.Gson;
import database.dao.BikeDAO;
import database.dao_impl.BikeDAOImpl;
import objects.Bike;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

@WebServlet(name = "AjaxBikesSourceServlet", urlPatterns = "/get-available-bikes")
public class AjaxBikesSourceServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        BikeDAO bd = new BikeDAOImpl();
        Set<Bike> bikes = bd.getAllAvailableBikes();
        String bikesJSONString = gson.toJson(bikes);
        response.getWriter().print(bikesJSONString);

    }
}
