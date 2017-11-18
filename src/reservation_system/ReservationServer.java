package reservation_system;
import objects.Reservation;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.event.Observes;
import javax.enterprise.event.Reception;
import javax.inject.Named;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;

@Named
@ApplicationScoped
@ServerEndpoint(value = "/rs")
public class ReservationServer {
    private static final Set<Session> sessions = Collections.synchronizedSet(new HashSet<Session>());

    @OnOpen
    public void open(Session session) {
        System.out.println("Connection made!");
        sessions.add(session);
    }

    @OnClose
    public void close(Session session) {
        System.out.println("Disconnecting!");
        sessions.remove(session);
    }

    @OnError
    public void error(Throwable error) {
        error.printStackTrace();
        System.err.println("Error: " + error.getMessage());
    }

    public void sendReservation2Manager(@Observes(notifyObserver = Reception.ALWAYS) Reservation reservation) {
        synchronized (sessions){
            for (Session s : sessions) {
                new Thread(()->{
                    try {
                        s.getBasicRemote().sendText(reservation.toString());
                    } catch (IOException e) {
                        //e.printStackTrace();
                        close(s);
                    }
                }).start();
            }
        }
    }

    public void logger(@Observes(notifyObserver = Reception.ALWAYS) Reservation reservation){
        System.out.println("Reservation Event: "+reservation.toString());
    }
}

