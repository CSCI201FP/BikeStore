package reservation_system;

import database.dao.ReservationDAO;
import database.dao_impl.ReservationDAOImpl;
import objects.Reservation;
import objects.User;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSessionBindingEvent;
import java.util.Queue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@WebListener()
public class ReservationCenter implements ServletContextListener,
        HttpSessionListener, HttpSessionAttributeListener {
    private ReservationDAO reservationDAO;
    private Queue<Reservation> reservations;
    private ExecutorService pool;

    // Public constructor is required by servlet spec
    public ReservationCenter() {
        reservationDAO = new ReservationDAOImpl();
        reservations = reservationDAO.getAllReservation();
        pool = Executors.newCachedThreadPool();
    }

    // -------------------------------------------------------
    // ServletContextListener implementation
    // -------------------------------------------------------
    public void contextInitialized(ServletContextEvent sce) {
        //This method is called when the servlet context is
        //initialized(when the Web application is deployed).
        //You can initialize servlet context related data here.


    }

    public void contextDestroyed(ServletContextEvent sce) {
        //This method is invoked when the Servlet Context
        //(the Web application)is undeployed or
        //Application Server shuts down.


    }

    // -------------------------------------------------------
    // HttpSessionListener implementation
    // -------------------------------------------------------
    public void sessionCreated(HttpSessionEvent se) {
        //Session is created.

                User user = (User) se.getSession().getAttribute("user");

        if (user.isManager()) {

        }
    }

    public void sessionDestroyed(HttpSessionEvent se) {
        //Session is destroyed.

                User user = (User) se.getSession().getAttribute("user");

        if (user.isManager()) {

        }
    }

    // -------------------------------------------------------
    // HttpSessionAttributeListener implementation
    // -------------------------------------------------------

    public void attributeAdded(HttpSessionBindingEvent sbe) {
        //This method is called when an attribute
        //is added to a session.


    }

    public void attributeRemoved(HttpSessionBindingEvent sbe) {
        //This method is called when an attribute
        //is removed from a session.


    }

    public void attributeReplaced(HttpSessionBindingEvent sbe) {
        //This method is invoked when an attibute
        //is replaced in a session.


    }
}
