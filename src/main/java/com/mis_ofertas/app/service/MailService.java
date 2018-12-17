package com.mis_ofertas.app.service;

import com.mis_ofertas.app.model.Email;
import com.mis_ofertas.app.model.Product;
import com.mis_ofertas.app.model.SystemUser;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;


@Service
public class MailService {

    /**
     * The engine to parse templates
     */
    private VelocityEngine velocityEngine;

    @Autowired
    public void setVelocityEngine(VelocityEngine velocityEngine) {
        this.velocityEngine = velocityEngine;
    }

    public String enviarCorreo(Email c) {

        try {
            Properties p = new Properties();
            p.put("mail.smtp.host", "smtp.gmail.com");
            p.setProperty("mail.smtp.starttls.enable", "true");
            p.setProperty("mail.smtp.port", "587");
            p.setProperty("mail.smtp.user", c.getUsuarioCorreo());
            p.setProperty("mail.smtp.auth", "true");


            Session s = Session.getDefaultInstance(p, null);

            BodyPart texto = new MimeBodyPart();
            texto.setText(c.getMensaje());
            texto.setContent(c.getMensaje(), "text/html");
            BodyPart adjunto = new MimeBodyPart();

            if (c.getRutaArchivo() != null && !c.getRutaArchivo().equals("")) {

                adjunto.setDataHandler(new DataHandler(new FileDataSource(c.getRutaArchivo())));
                adjunto.setFileName(c.getNombreArchivo());
                System.out.println(adjunto);
            }

            MimeMultipart m = new MimeMultipart();
            m.addBodyPart(texto);

            if (c.getRutaArchivo() != null && !c.getRutaArchivo().equals("")) {
                m.addBodyPart(adjunto);
            }
            MimeMessage mensaje = new MimeMessage(s);
            mensaje.setFrom(new InternetAddress(c.getUsuarioCorreo()));
            mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(c.getDestino()));
            mensaje.setSubject(c.getAsunto());
            mensaje.setContent(m);

            Transport t = s.getTransport("smtp");
            t.connect(c.getUsuarioCorreo(), c.getPass());
            t.sendMessage(mensaje, mensaje.getAllRecipients());

            t.close();
            return "enviado";


        } catch (Exception e) {
            System.out.println("error" + e.getMessage());
            return e.getMessage();
        }


    }


    public void sendNewsLetterEmail(SystemUser user) {
        try {
            String subjectString = "Este es el asunto";

            Map<String, Object> emailModel = new HashMap<>();
            emailModel.put("user", user);

            String bodyString = makeEmailContent("newsletter", emailModel);
            System.out.println(bodyString);
            Email email=new Email();
            email.setDestino(user.getEmail());
            email.setAsunto(subjectString);
            email.setMensaje(bodyString);
            enviarCorreo(email);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void sendOfferAlertEmail(SystemUser user, Product product) {
        try {
            String subjectString = "Este es el asunto";

            Map<String, Object> emailModel = new HashMap<>();
            emailModel.put("user", user);
            emailModel.put("product", product);
            Integer newPrice=product.getPrice()-product.getPrice()*product.getOffer().getDiscount()/100;
            SimpleDateFormat format = new SimpleDateFormat("dd-MM-YYYY");

            emailModel.put("expirationDate",format.format(product.getOffer().getExpirationDate()));
            emailModel.put("newPrice",newPrice);
            String bodyString = makeEmailContent("offerAlert", emailModel);
            System.out.println(bodyString);
            Email email=new Email();
            email.setDestino(user.getEmail());
            email.setAsunto(subjectString);
            email.setMensaje(bodyString);
            enviarCorreo(email);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    private String makeEmailContent(String viewName, Map model) {
        String path = "mail/" + viewName + ".vm";
        return VelocityEngineUtils.mergeTemplateIntoString(
                velocityEngine,
                path,
                "UTF8",
                model
        );
    }


}
