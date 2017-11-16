package reservation_system;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.Vector;

import javax.ejb.EJB;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/rs")
public class ReservationServer {
    private static final Set<Session> sessions = Collections.synchronizedSet(new HashSet<Session>());

    @EJB

    @OnOpen
    public void open(Session session) {
        System.out.println("Connection made!");
        sessions.add(session);
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println(message);
        try {
            for(Session s : sessions) {
                s.getBasicRemote().sendText(message);
            }
        } catch (IOException ioe) {
            System.out.println("ioe: " + ioe.getMessage());
            close(session);
        }
    }

    @OnClose
    public void close(Session session) {
        System.out.println("Disconnecting!");
        sessions.remove(session);
    }

    @OnError
    public void error(Throwable error) {
        System.out.println("Error!");
    }

}
