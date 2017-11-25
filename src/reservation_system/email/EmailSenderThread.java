package reservation_system.email;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailSenderThread extends Thread {
    private final String from = "bikeup.usc@gmail.com";
    private final String password = "bikeup201";

    private String subject;
    private String msg;
    private String to;

    public EmailSenderThread(String subject, String msg, String to) {
        this.subject = subject;
        this.msg = msg;
        this.to = to;
    }

    private void send() {

        //Get properties object
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        //get Session
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(from, password);
                    }
                });

        //compose message
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setContent(msg, "text/html; charset=utf-8");
            //send message
            Transport.send(message);
            System.out.println("message sent successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public void run(){
        send();
    }
}
