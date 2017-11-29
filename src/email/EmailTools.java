package email;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailTools {
    private static final String from = "bikeup.usc@gmail.com";
    private static final String password = "bikeup201";


    public static void sendEmail(String subject, String msg, String to) {

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
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }


}

