package com.mis_ofertas.app.controller;

import com.mis_ofertas.app.model.SystemUser;
import net.sourceforge.barbecue.Barcode;
import net.sourceforge.barbecue.BarcodeFactory;
import net.sourceforge.barbecue.BarcodeImageHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/usuario")
public class MyAccountController extends MainController{

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public String home(Model model, HttpServletRequest request) {
        SystemUser usuario = user(request);
        SystemUser SystemUser = restService.systemUser(usuario.getId());
        model.addAttribute("user", SystemUser);
        return "myAccount/account";
    }

    @RequestMapping(path = "/avatar", method = RequestMethod.POST)
    public String create(
            Model model,
            HttpServletRequest request,
            @RequestParam("avatar") String avatar){
        HttpSession session = request.getSession();

        SystemUser user=user(request);
        if(avatar!=null){
            user.setAvatar(avatar);
            user=restService.edit(user);
            session.setAttribute("user",user);
        }
        return "redirect:/usuario/";
    }

    @RequestMapping(path = "/show", method = RequestMethod.GET)
    public String show(
            Model model,
            HttpServletRequest request){
        SystemUser usuario = user(request);
        Long a = usuario.getId();
        return userData(model,request,a);
    }

    @RequestMapping(path = "/detail/{userId}", method = RequestMethod.GET)
    public String userData(Model model, HttpServletRequest request, @PathVariable Long userId) {
        SystemUser usuario = user(request);
        SystemUser systemUser = restService.systemUser(userId);
        /*
        model.addAttribute("productTypes", restService.productTypes());
        model.addAttribute("areas", restService.areas());
        model.addAttribute("statuses", restService.statuses());
        */
        model.addAttribute("usuarioList",systemUser);
        return "myAccount/account";

    }

    @RequestMapping(path = "/testCodeBar", method = RequestMethod.GET)
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

    @RequestMapping(path = "/generarD/{userId}", method = RequestMethod.GET)
    public String generarD(Model model, HttpServletRequest request, @PathVariable Long userId) {
        SystemUser usuario = user(request);
        SystemUser systemUser = restService.systemUser(userId);
        /*
        model.addAttribute("productTypes", restService.productTypes());
        model.addAttribute("areas", restService.areas());
        model.addAttribute("statuses", restService.statuses());
        */
        model.addAttribute("usuarioList",systemUser);
        return "myAccount/generaDescuento";

    }
    @RequestMapping(path = "/edit", method = RequestMethod.GET)
    public String edit(Model model, HttpServletRequest request) {
        SystemUser usuario = user(request);

        System.out.println("+++ACTUALES: "+usuario.getPoints());
        System.out.println("+++DESCUENTO: "+(usuario.getPoints()-1));
        usuario.setPoints((usuario.getPoints()-1));

        usuario = restService.edit(usuario);
        /*
        model.addAttribute("productTypes", restService.productTypes());
        model.addAttribute("areas", restService.areas());
        model.addAttribute("statuses", restService.statuses());
        */
        model.addAttribute("usuarioList",usuario);
        return "myAccount/account";

    }


}
