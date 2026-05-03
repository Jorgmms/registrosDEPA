package Utilidades;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class ServicioCorreo {
    
    // <-- AHORA RECIBIMOS EL NOMBRE TAMBIÉN AQUÍ
    public static void enviarConfirmacion(String destinatario, String nombrePersona) { 
        
        final String usuario = "jorgeyuremmartinez@gmail.com"; // PON TU CORREO
        final String clave = "npvm bbxl hbyf ckhy";         // PON TU CLAVE DE 16 LETRAS

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
          new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(usuario, clave);
            }
          });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(usuario));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinatario));
            message.setSubject("Confirmación de Registro - UMG");
            
            // <-- AQUÍ INCLUIMOS EL NOMBRE DEL USUARIO EN EL MENSAJE
            message.setText("Hola " + nombrePersona + ",\n\nSu registro se completó satisfactoriamente en el sistema.");

            Transport.send(message);
            System.out.println("DEBUG: Correo enviado exitosamente a " + destinatario);

        } catch (MessagingException e) {
            System.err.println("DEBUG: Error al enviar correo: " + e.getMessage());
        }
    }
}