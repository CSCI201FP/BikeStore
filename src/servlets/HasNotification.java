package servlets;

import objects.Manager;
import objects.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Queue;

@WebServlet(name = "HasNotification")
public class HasNotification extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }



    public boolean hasNotification(Manager manager){

    }

    public Queue<Reservation> getReservations(Manager manager){

    }
}
