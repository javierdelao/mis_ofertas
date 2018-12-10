package com.mis_ofertas.app.service;

import com.mis_ofertas.app.model.Email;
import org.springframework.stereotype.Service;

import java.util.Properties;
import javax.mail.Session;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;



@Service
public class MailService {

    public String enviarCorreo(Email c){

        try {
            Properties p=new Properties();
            p.put("mail.smtp.host", "smtp.gmail.com");
            p.setProperty("mail.smtp.starttls.enable", "true");
            p.setProperty("mail.smtp.port", "587");
            p.setProperty("mail.smtp.user", c.getUsuarioCorreo());
            p.setProperty("mail.smtp.auth", "true");


            Session s=Session.getDefaultInstance(p,null);

            BodyPart texto=new MimeBodyPart();
            texto.setText(c.getMensaje());
            texto.setContent(c.getMensaje(),"text/html");
            BodyPart adjunto=new MimeBodyPart();

            if(c.getRutaArchivo()!=null && !c.getRutaArchivo().equals("")){

                adjunto.setDataHandler(new DataHandler(new FileDataSource(c.getRutaArchivo())));
                adjunto.setFileName(c.getNombreArchivo());
                System.out.println(adjunto);
            }

            MimeMultipart m=new MimeMultipart();
            m.addBodyPart(texto);

            if(c.getRutaArchivo()!=null && !c.getRutaArchivo().equals("")){
                m.addBodyPart(adjunto);
            }
            MimeMessage mensaje=new MimeMessage(s);
            mensaje.setFrom(new InternetAddress(c.getUsuarioCorreo()));
            mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(c.getDestino()));
            mensaje.setSubject(c.getAsunto());
            mensaje.setContent(m);

            Transport t=s.getTransport("smtp");
            t.connect(c.getUsuarioCorreo(),c.getPass());
            t.sendMessage(mensaje, mensaje.getAllRecipients());

            t.close();
            return "enviado";



        } catch (Exception e) {
            System.out.println("error" + e.getMessage());
            return e.getMessage();
        }


    }



}
