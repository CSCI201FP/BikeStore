package reservation_system;

import com.google.gson.Gson;
import objects.Reservation;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.*;
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
    private static final BlockingQueue<Reservation> reservationQueue =new ArrayBlockingQueue<>(20);
    private static final ExecutorService consumerPool = Executors.newCachedThreadPool();

    class Consumer extends Thread {
        @Override
        public void run() {
            try {
                Reservation reservation = reservationQueue.take();

                String reservationJSONStr = new Gson().toJson(
                        new ReservationJSON(reservation.toString(), reservation.getReservationID()));

                synchronized (sessions) {
                    for (Session s : sessions) {
                        new Thread(() -> {
                            try {
                                s.getBasicRemote().sendText(reservationJSONStr);
                            } catch (IOException e) {
                                close(s);
                            }
                        }).start();
                    }
                }


            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }



    public ReservationServer() {
        System.out.println("I was Called");
        consumerPool.execute(new Consumer());
    }

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

    public static void sendReservation2Manager(@Observes(notifyObserver = Reception.ALWAYS) Reservation reservation) {
        reservationQueue.add(reservation);
    }

    public static void logger(@Observes(notifyObserver = Reception.ALWAYS) Reservation reservation) {
        System.out.println("Reservation Event: " + reservation.toString());
    }


}

/*class ServletAwareConfig extends ServerEndpointConfig.Configurator {

    @Override
    public void modifyHandshake(ServerEndpointConfig config, HandshakeRequest request, HandshakeResponse response) {
        HttpSession httpSession = (HttpSession) request.getHttpSession();
        config.getUserProperties().put("httpSession", httpSession);
    }

}*/


class ReservationJSON {
    private String messageStr;
    private String reservationID;

    ReservationJSON(String messageStr, int reservationID) {
        this.messageStr = messageStr;
        this.reservationID = Integer.toString(reservationID);
    }
}

