/*
 * Copyright (c) 2017 Business News Americas Limitada - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 */

package com.mis_ofertas.app.controller;

import com.mis_ofertas.app.model.Area;
import com.mis_ofertas.app.model.Email;
import com.mis_ofertas.app.model.Product;
import com.mis_ofertas.app.model.SystemUser;
import com.mis_ofertas.app.response.LoginResponse;
import com.mis_ofertas.app.util.CustomProductList;
import com.mis_ofertas.app.util.CustomProductListItem;
import net.sourceforge.barbecue.Barcode;
import net.sourceforge.barbecue.BarcodeFactory;
import net.sourceforge.barbecue.BarcodeImageHandler;
import org.krysalis.barcode4j.impl.code39.Code39Bean;
import org.krysalis.barcode4j.output.bitmap.BitmapCanvasProvider;
import org.krysalis.barcode4j.tools.UnitConv;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Created by Juan Francisco Rodríguez
 * <p>
 * Controls general views
 **/
@Controller
@RequestMapping("/")
public class HomeController extends MainController {


    @RequestMapping(path = "/home", method = RequestMethod.GET)
    public String home(Model model, HttpServletRequest request) {
        SystemUser usuario = user(request);
        CustomProductList customProductList = restService.custom(usuario);
        List<Area> areas = restService.areas();
        model.addAttribute("ok", "ok");
        model.addAttribute("customProductList", customProductList);
        model.addAttribute("areas", areas);
        model.addAttribute("area", null);


        return "index";
    }


    @RequestMapping(path = "/home/{areaId}", method = RequestMethod.GET)
    public String home(Model model, HttpServletRequest request, @PathVariable Long areaId) {
        SystemUser usuario = user(request);
        Area area = restService.area(areaId);
        List<Product> products = restService.products(area);
        CustomProductList customProductList = new CustomProductList();
        customProductList.setCustomProductListItems(new ArrayList<CustomProductListItem>());
        CustomProductListItem customProductListItem = new CustomProductListItem();
        customProductListItem.setProducts(products);
        customProductList.getCustomProductListItems().add(customProductListItem);
        List<Area> areas = restService.areas();
        model.addAttribute("ok", "ok");
        model.addAttribute("customProductList", customProductList);
        model.addAttribute("areas", areas);
        model.addAttribute("area", area);

        return "index";
    }


    @RequestMapping(path = {"/", "/login"}, method = RequestMethod.GET)
    public String login(Model model) {
        return "login";
    }


    @RequestMapping(path = {"/", "/login"}, method = RequestMethod.POST)
    public String login2(Model model, HttpServletRequest request, SystemUser user) {
        LoginResponse loginResponse = restService.login(user);
        HttpSession session = request.getSession();
        if (loginResponse.getStatus().equals("invalid")) {
            model.addAttribute("error", true);
            return "login";
        } else {

            session.setAttribute("user", loginResponse.getUser());
            return "redirect:/home";
        }
    }


    @RequestMapping(path = "/register", method = RequestMethod.POST)
    public String register(Model model, HttpServletRequest request, SystemUser user) {
        if (user != null) {
            user.setPoints(0);
        }
        user = userService.insert(user);
        return "login";
    }

    @RequestMapping(path = "/testMail", method = RequestMethod.GET)
    public String testMail(Model model, HttpServletRequest request) {
        List<SystemUser> systemUsers = restService.systemUsers();

         for (SystemUser systemUser : systemUsers ) {
            CustomProductList customProductList = restService.custom(systemUser);
            Email email = new Email();
            email.setAsunto("Este es un asunto de prueba");
            email.setDestino(systemUser.getEmail());
            String html = "<html>";
                    html += "<head>" ;
                    html += "</head>" ;
                    html +="<body>" ;

                    html +="<img align='left' width='100' height='100' src= '" + configProperties.getProperty("url-base") + "/default/" + systemUser.getAvatar() + "<br>" +"' />";
                    html +="<br>";
             html += "<br>"+"</br>";
             html += "<br>"+"</br>";
                    html +="<p align='left'>"+" <b>" + " " + "Saludos" + " " +  systemUser.getFirstName() + " " + systemUser.getLastName() + "</b>" + "</p>";
             html += "<br>"+"</br>";
             html += "<br>"+"</br>";
             html += "<br>"+"</br>";
                    html += "<p align='center'> <h3>Por que sabemos lo que quieres, tenemos estos productos para ti :</h3>"+"  </p>" ;
             html += "<br>"+"</br>";
             html += "<br>"+"</br>";
             html += "<a href='http://localhost:8181/store/detail' > Para mas detalles,has click aquí!</a>";
             for (CustomProductListItem customProductListItem : customProductList.getCustomProductListItems()) {
                        html += "<h3 Are de :" + customProductListItem.getArea() + "</h3>";

                        html += "<br>"+"</br>";
                        for (Product product : customProductListItem.getProducts()) {
                            html +="<img src= '" + configProperties.getProperty("url-base") + "/images/" + product.getImage().getPath() +"' />";
                            html += "<h3> Nombre :" + product.getName() +"<br>"+"</br>"+ "Detalle  :"+ product.getDescription() +"<br>"+"</br>" +"Precio  : $"+ product
                        .getPrice()+ "</h3>";
                        }
                    }
             html += "";
             html += "</body>";
             html += "</hmtl>";

             email.setMensaje(html);
            mailService.enviarCorreo(email);
        }

        return "redirect:/home";
    }


    @RequestMapping(path = "/testMail2", method = RequestMethod.GET)
    public String testMail2(Model model, HttpServletRequest request) {
        SystemUser usuario = user(request);

        List<SystemUser> systemUsers = restService.systemUsers();

        mailService.sendNewsLetterEmail(usuario);

        return "redirect:/home";
    }




    @RequestMapping(path = "/testCodeBar", method = RequestMethod.GET)
    public void testCodeBar(Model model, HttpServletRequest request,HttpServletResponse response) throws FileNotFoundException {
        try {
            Code39Bean bean = new Code39Bean();
            final int dpi = 150;
            bean.setModuleWidth(UnitConv.in2mm(1.0f / dpi));
            bean.setWideFactor(3);
            bean.doQuietZone(false);
            File outputFile = new File("out.jpg");
            OutputStream out = new FileOutputStream(outputFile);
            try {
                // Set up the canvas provider for monochrome JPEG output
                BitmapCanvasProvider canvas = new BitmapCanvasProvider(out,
                        "image/jpeg", dpi, BufferedImage.TYPE_BYTE_BINARY,
                        false, 0);

                // Generate the barcode
                bean.generateBarcode(canvas, "123456");

                // Signal end of generation
                canvas.finish();
                response.setContentType("image/jpeg");
                response.setHeader("Content-disposition", String.format("attachment; filename=%s.%s", "out", "jpg"));
                out.flush();


            } catch (IOException e1) {
                e1.printStackTrace();
            } finally {
            }
        } catch (
                Exception e)

        {
            e.printStackTrace();
        }
    }

    @RequestMapping(path = "/testCodeBar2", method = RequestMethod.GET)
    public void testCodeBar2(Model model, HttpServletRequest request,HttpServletResponse response) throws FileNotFoundException {
        String uploadsDir = configProperties.getProperty("barcodesLocalPath");

        try {
            Random rand = new Random();
            int n = rand.nextInt(50000000) + 1;
            Barcode barcode = BarcodeFactory.createCode128B(n+"");
            BufferedImage image = new BufferedImage(500, 500,
                    BufferedImage.TYPE_BYTE_GRAY);
            Graphics2D g = (Graphics2D) image.getGraphics();
            barcode.draw(g, 10, 56);
            File f = new File(uploadsDir+n+".png");
            BarcodeImageHandler.savePNG(barcode, f);
            FileOutputStream fop = new FileOutputStream(f);
            fop.flush();
            response.setContentType("image/jpeg");
            response.setHeader("Content-disposition", String.format("attachment; filename=%s.%s", "out", "jpg"));

        }catch (Exception e){

        }

    }

    @RequestMapping(path = "/testCodeBar3", method = RequestMethod.GET)
    public void testCodeBar3(Model model, HttpServletRequest request,HttpServletResponse response) throws FileNotFoundException {
        String uploadsDir = configProperties.getProperty("barcodesLocalPath");

        try {
            Random rand = new Random();
            int n = rand.nextInt(50000000) + 1;
            Barcode barcode = BarcodeFactory.createCode128B(n+"");
            JLabel priceLabel = new JLabel("Price: 100");
            BufferedImage image = new BufferedImage(1500, 1500,
                    BufferedImage.TYPE_BYTE_GRAY);
            Graphics2D g = (Graphics2D) image.getGraphics();
            g.drawString("hola mundo",20,56);
            barcode.add(priceLabel);
            barcode.setDrawingText(true);
            barcode.draw(g, 20, 56);
            File f = new File(uploadsDir+n+".png");
            BarcodeImageHandler.savePNG(barcode, f);
            response.setContentType("image/png");
            response.setHeader("Content-disposition", String.format("attachment; filename=%s.%s", n, "jpg"));
            OutputStream out = response.getOutputStream();
            BarcodeImageHandler.writePNG(barcode, out);
            out.flush();

        }catch (Exception e){

        }

    }




}