package com.mis_ofertas.app.controller;

import com.cloudinary.Cloudinary;
import com.mis_ofertas.app.model.Discount;
import com.mis_ofertas.app.model.SystemUser;
import net.sourceforge.barbecue.Barcode;
import net.sourceforge.barbecue.BarcodeFactory;
import net.sourceforge.barbecue.BarcodeImageHandler;
import org.apache.commons.io.FileUtils;
import org.cloudinary.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;

@Controller
@RequestMapping("/usuario")
public class MyAccountController extends MainController {

    private final static Map<Object, Object> CONFIG = new HashMap<>();

    static {
        CONFIG.put("cloud_name", "duzvu8wmg");
        CONFIG.put("api_key", "595457353713571");
        CONFIG.put("api_secret", "RxV3bs5fiChrbbl1UFRcBe3b9cc");
    }


    @RequestMapping(path = "/", method = RequestMethod.GET)
    public String home(Model model, HttpServletRequest request) {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"CLIENT")) {
            return "redirect:/home";
        }
        SystemUser usuario = user(request);
        SystemUser SystemUser = restService.systemUser(usuario.getId());
        model.addAttribute("user", SystemUser);
        return "myAccount/account";
    }

    @RequestMapping(path = "/avatar", method = RequestMethod.POST)
    public String create(
            Model model,
            HttpServletRequest request,
            @RequestParam("avatar") String avatar) {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"CLIENT")) {
            return "redirect:/home";
        }
        HttpSession session = request.getSession();

        SystemUser user = user(request);
        if (avatar != null) {
            user.setAvatar(avatar);
            user = restService.edit(user);
            session.setAttribute("user", user);
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);
        return "redirect:/usuario/";
    }

    @RequestMapping(path = "/show", method = RequestMethod.GET)
    public String show(
            Model model,
            HttpServletRequest request) {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"CLIENT")) {
            return "redirect:/home";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);
        Long a = usuario.getId();
        return userData(model, request, a);
    }

    @RequestMapping(path = "/detail/{userId}", method = RequestMethod.GET)
    public String userData(Model model, HttpServletRequest request, @PathVariable Long userId) {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"CLIENT")) {
            return "redirect:/home";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);
        SystemUser systemUser = restService.systemUser(userId);

        model.addAttribute("user", systemUser);
        /*
        model.addAttribute("productTypes", restService.productTypes());
        model.addAttribute("areas", restService.areas());
        model.addAttribute("statuses", restService.statuses());
        */
        model.addAttribute("usuarioList", systemUser);
        return "myAccount/account";

    }

    @RequestMapping(path = "/discount/generate/{typediscount}", method = RequestMethod.GET)
    public void testCodeBar3(@PathVariable Integer typediscount, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        if(!hasAccess(request)){
            return ;
        }
        if (!hasAccess(request,"CLIENT")) {
            return ;
        }
        SystemUser systemUser = user(request);
        String uploadsDir = configProperties.getProperty("barcodesLocalPath");
        Discount discount=new Discount();
        discount.setUser(systemUser);
        discount.setUsed(false);
        switch (typediscount) {
            case 1: {
                if (systemUser.getPoints() < 100) {
                    throw new Exception();
                }
                systemUser.setPoints(systemUser.getPoints()-100);
                discount.setPercentage(5);
                break;
            }
            case 2: {
                if (systemUser.getPoints() < 500) {
                    throw new Exception();
                }
                systemUser.setPoints(systemUser.getPoints()-500);
                discount.setPercentage(10);
                break;
            }
            case 3: {
                if (systemUser.getPoints() < 1000) {
                    throw new Exception();
                }
                systemUser.setPoints(systemUser.getPoints()-1000);
                discount.setPercentage(15);
                break;
            }
            default: {
                throw new Exception();
            }
        }
        int n=0;
        do {
            Random rand = new Random();
             n = rand.nextInt(50000000) + 1;
        }while (restService.existCode(n+""));
        discount.setCode(n+"");
        discount.setCreationDate(new Date());
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.DAY_OF_YEAR, 15);
        discount.setExpirationDate(calendar.getTime());

        try {
            Barcode barcode = BarcodeFactory.createCode128B(n + "");
            JLabel priceLabel = new JLabel("Price: 100");
            BufferedImage image = new BufferedImage(1500, 1500,
                    BufferedImage.TYPE_BYTE_GRAY);
            Graphics2D g = (Graphics2D) image.getGraphics();
            g.drawString("hola mundo", 20, 56);
            barcode.add(priceLabel);
            barcode.setDrawingText(true);
            barcode.draw(g, 20, 56);
            File f = new File(+n + ".png");
            BarcodeImageHandler.savePNG(barcode, f);
            response.setContentType("image/png");
            response.setHeader("Content-disposition", String.format("attachment; filename=%s.%s", n, "jpg"));
            OutputStream out = response.getOutputStream();
            BarcodeImageHandler.writePNG(barcode, out);
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            Barcode barcode = BarcodeFactory.createCode128B(n + "");
            JLabel priceLabel = new JLabel("Price: 100");
            BufferedImage image = new BufferedImage(1500, 1500,
                    BufferedImage.TYPE_BYTE_GRAY);
            Graphics2D g = (Graphics2D) image.getGraphics();
            g.drawString("hola mundo", 20, 56);
            barcode.add(priceLabel);
            barcode.setDrawingText(true);
            barcode.draw(g, 20, 56);
            File f = new File(n + ".png");
            BarcodeImageHandler.savePNG(barcode, f);
            response.setContentType("image/png");
            response.setHeader("Content-disposition", String.format("attachment; filename=%s.%s", n, "jpg"));
            OutputStream out = response.getOutputStream();
            BarcodeImageHandler.writePNG(barcode, out);


            BufferedImage bufferedImage= BarcodeImageHandler.getImage(barcode);

            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write( bufferedImage, "jpg", baos );
            baos.flush();
            byte[] imageInByte = baos.toByteArray();
            baos.close();
            File file=new File(n+".png");
            FileUtils.writeByteArrayToFile(file, imageInByte);


            FileOutputStream fos = new FileOutputStream(file);
            fos.write(imageInByte);
            fos.close();

            File cloudinaryFile=file;

            Cloudinary cloudinary = new Cloudinary("cloudinary://595457353713571:RxV3bs5fiChrbbl1UFRcBe3b9cc@duzvu8wmg");
            CONFIG.put("folder","images");
            JSONObject result = new JSONObject(cloudinary.uploader().upload(cloudinaryFile, CONFIG));
            discount.setPath(result.getString("url"));
            discount=restService.create(discount);
            System.out.println(discount.getId());
            HttpSession session = request.getSession();
            session.setAttribute("user",  restService.edit(systemUser));
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @RequestMapping(path = "/generarD/{userId}", method = RequestMethod.GET)
    public String generarD(Model model, HttpServletRequest request, @PathVariable Long userId) {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"CLIENT")) {
            return "redirect:/home";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);
        SystemUser systemUser = restService.systemUser(userId);
        List<Discount> discounts = restService.discounts(usuario);
        for (Discount discount : discounts) {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

            if (discount.getExpirationDate() != null) {
                String dateString = format.format(discount.getExpirationDate());
                discount.setFormatExpirationDate(dateString);
            }
            if (discount.getCreationDate() != null) {
                String dateString = format.format(discount.getCreationDate());
                discount.setFormatCreationDate(dateString);
            }
            if(discount.getUsed()){
                discount.setUsedString("Usado");
            }else {
                if(discount.getExpirationDate().before(new Date())){
                    discount.setUsedString("Vencido");
                }else {
                    discount.setUsedString("Disponible");
                }
            }
        }
        model.addAttribute("discounts", discounts);
        model.addAttribute("usuario", systemUser);
        return "myAccount/generaDescuento";

    }

    @RequestMapping(path = "/edit", method = RequestMethod.GET)
    public String edit(Model model, HttpServletRequest request) {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"CLIENT")) {
            return "redirect:/home";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);

        System.out.println("+++ACTUALES: " + usuario.getPoints());
        System.out.println("+++DESCUENTO: " + (usuario.getPoints() - 1));
        usuario.setPoints((usuario.getPoints() - 1));

        usuario = restService.edit(usuario);
        /*
        model.addAttribute("productTypes", restService.productTypes());
        model.addAttribute("areas", restService.areas());
        model.addAttribute("statuses", restService.statuses());
        */
        model.addAttribute("usuarioList", usuario);
        return "myAccount/account";

    }


}
