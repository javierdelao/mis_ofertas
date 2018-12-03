/*
 * Copyright (c) 2017 Business News Americas Limitada - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 */

package com.mis_ofertas.app.controller;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.mis_ofertas.app.model.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * Created by Juan Francisco Rodríguez
 * <p>
 * Controls general views
 **/
@Controller
@RequestMapping("/product")
public class ProductController extends MainController {


    @RequestMapping(path = "/", method = RequestMethod.GET)
    public String home(Model model, HttpServletRequest request) {
        SystemUser usuario = user(request);
        List<Product> productList = restService.products(usuario, true, null, null, null, "");
        for (Product product : productList) {
            if (product.getOffer() != null) {
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                product.getOffer().setPublicationDateString(format.format(product.getOffer().getPublicationDate()));
                product.getOffer().setExpirationDateString(format.format(product.getOffer().getExpirationDate()));
            }
        }
        model.addAttribute("textSearch", "");
        model.addAttribute("area", new Area(Long.parseLong("0")));
        model.addAttribute("status", new Status(Long.parseLong("0")));
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
        SystemUser usuario = user(request);
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
        SystemUser usuario = user(request);
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
        SystemUser usuario = user(request);
        model.addAttribute("productTypes", restService.productTypes());
        model.addAttribute("areas", restService.areas());
        model.addAttribute("statuses", restService.statuses());
        return "producto/agregar";

    }

    @RequestMapping(path = "/edit/{productoId}", method = RequestMethod.GET)
    public String edit(Model model, HttpServletRequest request, @PathVariable Long productoId) throws ParseException {
        SystemUser usuario = user(request);
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
        SystemUser usuario = user(request);
        String uploadsDir = configProperties.getProperty("imagesLocalPath");

        if (!new File(uploadsDir).exists()) {
            new File(uploadsDir).mkdir();
        }

        Image imagep = new Image();
        Random rand = new Random();

        int n = rand.nextInt(50000000) + 1;

        String orgName = image.getOriginalFilename();
        String filePath = uploadsDir + n + orgName;
        File dest = new File(filePath);
        image.transferTo(dest);
        imagep.setPath(n + orgName);
        Product product = new Product();
        product.setImage(imagep);
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
        product = restService.create(product);
      /*  Cloudinary cloudinary=new Cloudinary();
        cloudinary.uploader().upload(new File("http://www.example.com/sample.jpg"),
                ObjectUtils.asMap("duzvu8wmg", "samples"));
*/

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
        SystemUser usuario = user(request);
        Product product = restService.product(id);
        if (image != null && image.getSize() > 0) {
            String uploadsDir = configProperties.getProperty("imagesLocalPath");
            if (!new File(uploadsDir).exists()) {
                new File(uploadsDir).mkdir();
            }
            Image imagep = new Image();
            Random rand = new Random();
            int n = rand.nextInt(50000000) + 1;
            String orgName = image.getOriginalFilename();
            String filePath = uploadsDir + n + orgName;
            File dest = new File(filePath);
            image.transferTo(dest);
            imagep.setPath(n + orgName);
            product.setImage(imagep);
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
        SystemUser usuario = user(request);
        Product product = restService.product(productId);
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
        model.addAttribute("valoration", valoration);
        model.addAttribute("notes", notes);
        model.addAttribute("product", product);
        model.addAttribute("offerHistory", offers);
        return "producto/detalle";
    }


    @RequestMapping(path = "/comment", method = RequestMethod.POST)
    public String comment(HttpServletRequest request,
                          @RequestParam(value = "images", required = false) MultipartFile[] images,
                          @RequestParam("text") String text,
                          @RequestParam("productId") Long productId) throws ParseException, IOException {
        HttpSession session = request.getSession();
        SystemUser user = user(request);
        List<Document> documents = new ArrayList<>();
        if (images != null) {
            for (int i = 0; i < images.length; i++) {
                MultipartFile image = images[i];
                if (image != null && image.getSize() > 0) {
                    String uploadsDir = configProperties.getProperty("documentsLocalPath");
                    if (!new File(uploadsDir).exists()) {
                        new File(uploadsDir).mkdir();
                    }
                    Document document = new Document();
                    Random rand = new Random();
                    int n = rand.nextInt(50000000) + 1;
                    String orgName = image.getOriginalFilename();
                    String filePath = uploadsDir + n + orgName;
                    File dest = new File(filePath);
                    image.transferTo(dest);
                    document.setPath(n + orgName);
                    document.setUploadDate(new Date());
                    document = restService.create(document);
                    documents.add(document);
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
        user.setPoints(user.getPoints()+1);
        SystemUser user1=restService.edit(user);
        session.setAttribute("user",user1);

        return "redirect:/product/detail/" + productId;
    }

    @RequestMapping(path = "/valoration", method = RequestMethod.POST)
    public String valoration(HttpServletRequest request,
                             @RequestParam("valorationNumber") Integer valorationNumber,
                             @RequestParam("productId") Long productId) throws ParseException {
        HttpSession session = request.getSession();

        SystemUser user = user(request);
        Valoration valoration = new Valoration();
        valoration.setProduct(restService.product(productId));
        valoration.setValoration_star(valorationNumber);
        valoration.setSystemUser(user);
        valoration = restService.create(valoration);
        user.setPoints(user.getPoints()+1);
        SystemUser user1=restService.edit(user);
        session.setAttribute("user",user1);

        return "redirect:/product/detail/" + productId;
    }


}