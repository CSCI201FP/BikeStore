package ajax_data_source;

import com.google.gson.Gson;
import database.dao.ReservationDAO;
import database.dao_impl.ReservationDAOImpl;
import objects.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;
import java.util.stream.Collectors;

@WebServlet(name = "ReservationsSourceServlet", urlPatterns = "/get-reservations")
public class ReservationsSourceServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        ReservationDAO reservationDAO = new ReservationDAOImpl();
        Set<Reservation> reservations = reservationDAO.getAllReservation();

        reservations.forEach(Reservation::extendFields);

        response.getWriter().print(gson.toJson(reservations));
    }
}
