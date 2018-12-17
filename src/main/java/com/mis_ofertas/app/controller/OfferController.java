/*
 * Copyright (c) 2017 Business News Americas Limitada - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 */

package com.mis_ofertas.app.controller;

import com.mis_ofertas.app.model.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
@RequestMapping("/offer")
public class OfferController extends MainController {


    @RequestMapping(path = "/create/{productId}", method = RequestMethod.GET)
    public String create(Model model, HttpServletRequest request, @PathVariable Long productId) {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"REPRESENTATIVE")) {
            return "redirect:/home";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);
        Product product = restService.product(productId);
        model.addAttribute("producto", product);
        model.addAttribute("offerTypes", restService.offerTypes());
        return "oferta/agregar";
    }

    @RequestMapping(path = "/create", method = RequestMethod.POST)
    public String create(
            Model model,
            HttpServletRequest request,
            @RequestParam("productId") Long productId,
            @RequestParam("discount") Integer discount,
            @RequestParam("publicationDate") String publicationDate,
            @RequestParam("expirationDate") String expirationDate,
            @RequestParam("quantityAvailable") Integer quantityAvailable,
            @RequestParam("offerTypeId") Long offerTypeId) throws ParseException {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"REPRESENTATIVE")) {
            return "redirect:/home";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);
        Offer offer = new Offer();
        offer.setDiscount(discount);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        offer.setPublicationDate(new SimpleDateFormat("yyyy-MM-dd").parse(publicationDate));
        offer.setExpirationDate(new SimpleDateFormat("yyyy-MM-dd").parse(expirationDate));
        offer.setQuantityAvailable(quantityAvailable);
        offer.setOfferType(restService.offerType(offerTypeId));
        offer.setProduct(restService.product(productId));
        offer = restService.create(offer);
        if (offer.getPublicationDate().before(new Date()) && offer.getExpirationDate().after(new Date())) {
            for(SystemUser systemUser:restService.systemUsers()){
                Product product=offer.getProduct();
                product.setOffer(offer);
                mailService.sendOfferAlertEmail(systemUser,product);
            }

        }
        return "redirect:/product/";
    }

    @RequestMapping(path = "/{offerId}", method = RequestMethod.GET)
    public String offer(Model model, HttpServletRequest request, @PathVariable Long offerId) {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"REPRESENTATIVE")) {
            return "redirect:/home";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);
        Offer offer = restService.offer(offerId);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        offer.setPublicationDateString(format.format(offer.getPublicationDate()));
        offer.setExpirationDateString(format.format(offer.getPublicationDate()));
        model.addAttribute("offer", offer);
        model.addAttribute("offerTypes", restService.offerTypes());
        return "oferta/ver";
    }

    @RequestMapping(path = "/cancel", method = RequestMethod.POST)
    public String cancel(Model model, HttpServletRequest request, @RequestParam("offerId") Long offerId) {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"REPRESENTATIVE")) {
            return "redirect:/home";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);
        Offer offer = restService.offer(offerId);
        offer.setExpirationDate(new Date());
        offer = restService.edit(offer);
        return "redirect:/product/";
    }


}