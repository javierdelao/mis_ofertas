/*
 * Copyright (c) 2017 Business News Americas Limitada - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 */

package com.mis_ofertas.app.controller;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.mis_ofertas.app.model.*;
import com.mis_ofertas.app.util.VisitPerDayReport;
import org.cloudinary.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Juan Francisco Rodríguez
 * <p>
 * Controls general views
 **/
@Controller
@RequestMapping("/product")
public class ProductController extends MainController {

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
        if (!hasAccess(request,"REPRESENTATIVE")) {
            return "redirect:/home";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);
        List<Product> productList = restService.products(usuario, true, restService.statuses().get(1), null, null, "");
        for (Product product : productList) {
            if (product.getOffer() != null) {
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                product.getOffer().setPublicationDateString(format.format(product.getOffer().getPublicationDate()));
                product.getOffer().setExpirationDateString(format.format(product.getOffer().getExpirationDate()));
            }
        }
        model.addAttribute("textSearch", "");
        model.addAttribute("area", new Area(Long.parseLong("0")));
        model.addAttribute("status", restService.statuses().get(1));
        model.addAttribute("productType", new ProductType(Long.parseLong("0")));
        model.addAttribute("statuses", restService.statuses());
        model.addAttribute("areas", restService.areas());
        model.addAttribute("productTypes", restService.productTypes());
        model.addAttribute("productList", productList);
        return "producto/productos";
    }

    @RequestMapping(path = "filter", method = RequestMethod.POST)
    public String home(Model model, HttpServletRequest request,
                       @RequestParam("statusId") Long statusId,
                       @RequestParam("areaId") Long areaId,
                       @RequestParam("productTypeId") Long productTypeId,
                       @RequestParam("textSearch") String textSearch) {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"REPRESENTATIVE")) {
            return "redirect:/home";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);
        Area area = restService.area(areaId);
        if (area == null) {
            area = new Area(Long.parseLong("0"));
        }
        Status status = restService.status(statusId);
        if (status == null) {
            status = new Status(Long.parseLong("0"));
        }
        ProductType productType = restService.productType(productTypeId);
        if (productType == null) {
            productType = new ProductType(Long.parseLong("0"));
        }
        List<Product> productList = restService.products(usuario, true, status, area, productType, textSearch);
        for (Product product : productList) {
            if (product.getOffer() != null) {
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                product.getOffer().setPublicationDateString(format.format(product.getOffer().getPublicationDate()));
                product.getOffer().setExpirationDateString(format.format(product.getOffer().getExpirationDate()));
            }
        }
        model.addAttribute("textSearch", textSearch);
        model.addAttribute("area", area);
        model.addAttribute("status", status);
        model.addAttribute("productType", productType);
        model.addAttribute("statuses", restService.statuses());
        model.addAttribute("areas", restService.areas());
        model.addAttribute("productTypes", restService.productTypes());
        model.addAttribute("productList", productList);
        return "producto/productos";
    }


    @RequestMapping(path = "/{productId}", method = RequestMethod.GET)
    public String product(Model model, HttpServletRequest request, @PathVariable Long productId) {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"CLIENT")) {
            return "redirect:/home";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);
        Product product = restService.product(productId);
        Visit visit = new Visit();
        visit.setProduct(product);
        visit.setSystemUser(usuario);
        visit.setVisitDate(new Date());
        visit = restService.create(visit);
        return "producto/producto";
    }

    @RequestMapping(path = "/create", method = RequestMethod.GET)
    public String create(Model model, HttpServletRequest request) {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"REPRESENTATIVE")) {
            return "redirect:/home";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);
        model.addAttribute("productTypes", restService.productTypes());
        model.addAttribute("areas", restService.areas());
        model.addAttribute("statuses", restService.statuses());
        return "producto/agregar";

    }

    @RequestMapping(path = "/edit/{productoId}", method = RequestMethod.GET)
    public String edit(Model model, HttpServletRequest request, @PathVariable Long productoId) throws ParseException {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"REPRESENTATIVE")) {
            return "redirect:/home";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);
        Product product = restService.product(productoId);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        if (product.getExpirationDate() != null) {
            String dateString = format.format(product.getExpirationDate());
            product.setExpirationDateString(dateString);
        }
        model.addAttribute("productTypes", restService.productTypes());
        model.addAttribute("areas", restService.areas());
        model.addAttribute("statuses", restService.statuses());
        model.addAttribute("producto", product);
        return "producto/editar";

    }

    @RequestMapping(path = "/delete/{productoId}", method = RequestMethod.GET)
    public String delete(Model model, HttpServletRequest request, @PathVariable Long productoId) throws ParseException {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"REPRESENTATIVE")) {
            return "redirect:/home";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);
        Product product = restService.product(productoId);
        product=restService.delete(product);
        return "redirect:/product/";

    }


    @RequestMapping(path = "/create", method = RequestMethod.POST)
    public String create(
            Model model,
            HttpServletRequest request,
            @RequestParam("image") MultipartFile image,
            @RequestParam("name") String name,
            @RequestParam("description") String description,
            @RequestParam("expirationDate") String expirationDate,
            @RequestParam("is_perishable") Boolean is_perishable,
            @RequestParam("price") Integer price,
            @RequestParam("productType") Long productTypeId,
            @RequestParam("area") Long areaId,
            @RequestParam("status") Long statusId) throws ParseException, IOException {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"REPRESENTATIVE")) {
            return "redirect:/home";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);

        Product product = new Product();
        product.setName(name);
        product.setDescription(description);
        product.setIs_perishable(is_perishable);
        if (expirationDate != null && !expirationDate.equals("")) {
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(expirationDate);
            product.setExpirationDate(date);
        }
        product.setPublicationDate(new Date());
        product.setPrice(price);

        product.setUser(usuario);

        product.setProductType(restService.productType(productTypeId));

        product.setArea(restService.area(areaId));

        product.setStatus(restService.status(statusId));

        if (!image.isEmpty()) {
            try {
                File convFile = new File(image.getOriginalFilename());
                convFile.createNewFile();
                FileOutputStream fos = new FileOutputStream(convFile);
                fos.write(image.getBytes());
                fos.close();
                File cloudinaryFile = convFile;

                Cloudinary cloudinary = new Cloudinary("cloudinary://595457353713571:RxV3bs5fiChrbbl1UFRcBe3b9cc@duzvu8wmg");
                CONFIG.put("folder","images");
                JSONObject result = new JSONObject(cloudinary.uploader().upload(cloudinaryFile, CONFIG));
                Image imagep = new Image();
                imagep.setPath(result.getString("url"));
                product.setImage(imagep);
                System.out.println("done");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        product = restService.create(product);



        return "redirect:/product/";
    }


    @RequestMapping(path = "/edit", method = RequestMethod.POST)
    public String edit(
            Model model,
            HttpServletRequest request,
            @RequestParam("id") Long id,
            @RequestParam(value = "image", required = false) MultipartFile image,
            @RequestParam("name") String name,
            @RequestParam("description") String description,
            @RequestParam("expirationDate") String expirationDate,
            @RequestParam("is_perishable") Boolean is_perishable,
            @RequestParam("price") Integer price,
            @RequestParam("productType") Long productTypeId,
            @RequestParam("area") Long areaId,
            @RequestParam("status") Long statusId) throws ParseException, IOException {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"REPRESENTATIVE")) {
            return "redirect:/home";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);
        Product product = restService.product(id);

        if (!image.isEmpty()) {
            try {
                File convFile = new File(image.getOriginalFilename());
                convFile.createNewFile();
                FileOutputStream fos = new FileOutputStream(convFile);
                fos.write(image.getBytes());
                fos.close();
                File cloudinaryFile = convFile;

                Cloudinary cloudinary = new Cloudinary("cloudinary://595457353713571:RxV3bs5fiChrbbl1UFRcBe3b9cc@duzvu8wmg");
                CONFIG.put("folder","images");
                JSONObject result = new JSONObject(cloudinary.uploader().upload(cloudinaryFile, CONFIG));
                Image imagep = new Image();
                imagep.setPath(result.getString("url"));
                product.setImage(imagep);
                System.out.println("done");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        product.setName(name);
        product.setDescription(description);
        product.setIs_perishable(is_perishable);
        if (expirationDate != null && !expirationDate.equals("")) {
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(expirationDate);
            product.setExpirationDate(date);
        }

        product.setPublicationDate(new Date());
        product.setPrice(price);
        product.setUser(usuario);
        product.setProductType(restService.productType(productTypeId));
        product.setArea(restService.area(areaId));
        product.setStatus(restService.status(statusId));
        product = restService.edit(product);
        return "redirect:/product/";
    }

    @RequestMapping(path = "/detail/{productId}", method = RequestMethod.GET)
    public String detail(Model model, HttpServletRequest request, @PathVariable Long productId) throws ParseException {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"CLIENT")) {
            return "redirect:/home";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);
        Product product = restService.product(productId);
        Integer qtaVisit=restService.qta(product);
        Visit visit = new Visit();
        visit.setProduct(product);
        visit.setSystemUser(usuario);
        visit.setVisitDate(new Date());
        visit = restService.create(visit);
        List<Offer> offers = restService.offerHistory(product);
        SimpleDateFormat format = new SimpleDateFormat("dd-MM-YYYY");

        for (Offer offer : offers) {
            if (offer.getExpirationDate() != null) {
                String dateString = format.format(offer.getExpirationDate());
                offer.setExpirationDateString(dateString);
            }
            if (offer.getPublicationDate() != null) {
                String dateString = format.format(offer.getPublicationDate());
                offer.setPublicationDateString(dateString);
            }
        }

        List<Note> notes = restService.notes(product);
        Valoration valoration = restService.valoration(product, usuario);
        model.addAttribute("qtaVisit", qtaVisit);
        model.addAttribute("valoration", valoration);
        model.addAttribute("notes", notes);
        model.addAttribute("product", product);
        model.addAttribute("offerHistory", offers);
        List<VisitPerDayReport>visitPerDayReports=new ArrayList<>();
        for(int i=15;i>=0;i--){
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(new Date());
            calendar.add(Calendar.DAY_OF_YEAR, -1*i);
            Date date=calendar.getTime();
            Integer visits=restService.visitPerDay(product,date);
            VisitPerDayReport visitPerDayReport=new VisitPerDayReport();
            visitPerDayReport.setDate(date);
            visitPerDayReport.setVisitQta(visits);
            String dateString = format.format(date);
            visitPerDayReport.setDateString(dateString);
            visitPerDayReports.add(visitPerDayReport);
            System.out.println(visits);
        }
        model.addAttribute("visitPerDayReports", visitPerDayReports);



        return "producto/detalle";
    }


    @RequestMapping(path = "/comment", method = RequestMethod.POST)
    public String comment(HttpServletRequest request,
                          @RequestParam(value = "images", required = false) MultipartFile[] images,
                          @RequestParam("text") String text,
                          @RequestParam("productId") Long productId) throws ParseException, IOException {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"CLIENT")) {
            return "redirect:/home";
        }
        HttpSession session = request.getSession();
        SystemUser user = user(request);
        List<Document> documents = new ArrayList<>();
        if (images != null) {
            for (int i = 0; i < images.length; i++) {
                MultipartFile image = images[i];

                if (!image.isEmpty()) {
                    try {
                        Document document = new Document();

                        File convFile = new File(image.getOriginalFilename());
                        convFile.createNewFile();
                        FileOutputStream fos = new FileOutputStream(convFile);
                        fos.write(image.getBytes());
                        fos.close();
                        File cloudinaryFile = convFile;

                        Cloudinary cloudinary = new Cloudinary("cloudinary://595457353713571:RxV3bs5fiChrbbl1UFRcBe3b9cc@duzvu8wmg");
                        CONFIG.put("folder","images");
                        JSONObject result = new JSONObject(cloudinary.uploader().upload(cloudinaryFile, CONFIG));
                        document.setPath(result.getString("url"));
                        document.setUploadDate(new Date());
                        document = restService.create(document);
                        documents.add(document);
                        System.out.println("done");
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        Note note = new Note();
        note.setCommentDate(new Date());
        note.setProduct(restService.product(productId));
        note.setText(text);
        note.setSystemUser(user);
        note.setDocuments(documents);
        note = restService.create(note);
        user.setPoints(user.getPoints() + 1);
        SystemUser user1 = restService.edit(user);
        session.setAttribute("user", user1);

        return "redirect:/product/detail/" + productId;
    }

    @RequestMapping(path = "/valoration", method = RequestMethod.POST)
    public String valoration(HttpServletRequest request,
                             @RequestParam("valorationNumber") Integer valorationNumber,
                             @RequestParam("productId") Long productId) throws ParseException {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"CLIENT")) {
            return "redirect:/home";
        }
        HttpSession session = request.getSession();

        SystemUser user = user(request);
        Valoration valoration = new Valoration();
        valoration.setProduct(restService.product(productId));
        valoration.setValoration_star(valorationNumber);
        valoration.setSystemUser(user);
        valoration = restService.create(valoration);
        user.setPoints(user.getPoints() + 1);
        SystemUser user1 = restService.edit(user);
        session.setAttribute("user", user1);

        return "redirect:/product/detail/" + productId;
    }


}