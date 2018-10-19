/*
 * Copyright (c) 2017 Business News Americas Limitada - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 */

package com.mis_ofertas.app.controller;

import com.mis_ofertas.app.model.Image;
import com.mis_ofertas.app.model.Product;
import com.mis_ofertas.app.model.SystemUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

        List<Product> productList = restService.products();
        model.addAttribute("productList", productList);
        return "producto/productos";
    }

    @RequestMapping(path = "/create", method = RequestMethod.GET)
    public String create(Model model, HttpServletRequest request) {
        SystemUser usuario = user(request);
        model.addAttribute("productTypes", restService.productTypes());
        model.addAttribute("areas", restService.areas());
        model.addAttribute("statuses", restService.statuses());
        return "producto/agregar";

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
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(expirationDate);
        product.setExpirationDate(date);
        product.setPublicationDate(new Date());
        product.setPrice(price);

        product.setUser(usuario);

        product.setProductType(restService.productType(productTypeId));

        product.setArea(restService.area(areaId));

        product.setStatus(restService.status(statusId));
        product = restService.create(product);
        return "redirect:/product/";
    }


}