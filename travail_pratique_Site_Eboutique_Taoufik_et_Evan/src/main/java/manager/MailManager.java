package manager;

import java.io.IOException;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.util.ByteArrayDataSource;

public class MailManager {

    private static String user = "isi.mail.java2@gmx.com";
    private static String pwd = "VzKKe4PEx2znmfs";
    // qui envoie
    private static String from = "isi.mail.java2@gmx.com";

    public static void sendEmail(String msg, String to, String sujet) throws MessagingException, IOException {
        System.out.println(user);
        System.out.println(pwd);
        System.out.println(from);
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "mail.gmx.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS
        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pwd);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        message.setRecipients(
                Message.RecipientType.TO,
                InternetAddress.parse(to)
        );
        message.setSubject(sujet);
//        message.setText(msg);
        StringBuffer sb = new StringBuffer();
        sb.append(msg);
        message.setDataHandler(new DataHandler(
                new ByteArrayDataSource(sb.toString(), "text/html")
        ));
        Transport.send(message);
    }
}
