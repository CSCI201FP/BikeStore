package email;

import objects.User;
import org.apache.commons.io.IOUtils;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

public class ReservationDecisionEmailSenderThread extends Thread {

    public static final String APPROVAL_EMAIL_PATH = "/res/email_template/ApproveReservation.html";
    public static final String REFUSAL_EMAIL_PATH = "/res/email_template/RefuseReservation.html";

    public enum Decision{
        approve, refuse
    }

    private User user;
    private Decision decision;
    private ServletContext context;

    public ReservationDecisionEmailSenderThread(User user, Decision decision, ServletContext context) {
        this.user = user;
        this.decision = decision;
        this.context = context;
    }

    private void send() throws IOException{
        String to;
        String msg;
        String subject;

        to = user.getEmail();

        switch (decision){
            case approve:
                subject = "Congratulations! Your Bike is Ready";
                msg = IOUtils.toString(context.getResourceAsStream(APPROVAL_EMAIL_PATH), StandardCharsets.UTF_8);
                break;

            case refuse:
                subject = "Sorry, We are Unable to Offer You a Bike";
                msg = IOUtils.toString(context.getResourceAsStream(REFUSAL_EMAIL_PATH), StandardCharsets.UTF_8);
                break;
            default:
                subject = "Sorry, We are Unable to Offer You a Bike";
                msg = IOUtils.toString(context.getResourceAsStream(REFUSAL_EMAIL_PATH), StandardCharsets.UTF_8);
                break;
        }

        msg = msg.replace("${CUSTOMER_NAME}", user.getName());
        msg = msg.replace("${BUTTON_LINK}", "http://localhost:8080/login.jsp");

        EmailTools.sendEmail(subject,msg,to);
    }

    public void run(){
        try {
            send();
        } catch (IOException e) {
            context.log("Fail to Send Decision Email");
            e.printStackTrace();
        }
    }

}
