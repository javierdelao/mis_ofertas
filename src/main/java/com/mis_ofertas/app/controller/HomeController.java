/*
 * Copyright (c) 2017 Business News Americas Limitada - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 */

package com.mis_ofertas.app.controller;

import com.mis_ofertas.app.model.*;
import com.mis_ofertas.app.response.LoginResponse;
import com.mis_ofertas.app.service.RestService;
import com.mis_ofertas.app.service.UserService;
import com.mis_ofertas.app.util.CustomProductList;
import com.mis_ofertas.app.util.CustomProductListItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Juan Francisco Rodríguez
 * <p>
 * Controls general views
 **/
@Controller
@RequestMapping("/")
public class HomeController extends MainController{


    @RequestMapping(path = "/home", method = RequestMethod.GET)
    public String home(Model model,HttpServletRequest request) {
        SystemUser usuario=user(request);
        CustomProductList customProductList=restService.custom(usuario);
        List<Area>areas=restService.areas();
        model.addAttribute("ok","ok");
        model.addAttribute("customProductList",customProductList);
        model.addAttribute("areas",areas);
        model.addAttribute("area",null);


        return "index";
    }


    @RequestMapping(path = "/home/{areaId}", method = RequestMethod.GET)
    public String home(Model model, HttpServletRequest request, @PathVariable Long areaId) {
        SystemUser usuario=user(request);
        Area area=restService.area(areaId);
        List<Product>products=restService.products(area);
        CustomProductList customProductList=new CustomProductList();
        customProductList.setCustomProductListItems(new ArrayList<CustomProductListItem>());
        CustomProductListItem customProductListItem=new CustomProductListItem();
        customProductListItem.setProducts(products);
        customProductList.getCustomProductListItems().add(customProductListItem);
        List<Area>areas=restService.areas();
        model.addAttribute("ok","ok");
        model.addAttribute("customProductList",customProductList);
        model.addAttribute("areas",areas);
        model.addAttribute("area",area);

        return "index";
    }





    @RequestMapping(path = {"/","/login"}, method = RequestMethod.GET)
    public String login(Model model) {
        return "login";
    }


    @RequestMapping(path = {"/","/login"}, method = RequestMethod.POST)
    public String login2(Model model, HttpServletRequest request, SystemUser user) {
        LoginResponse loginResponse=restService.login(user);
        HttpSession session = request.getSession();
       if(loginResponse.getStatus().equals("invalid")){
           model.addAttribute("error",true);
           return "login";
       }else{

           session.setAttribute("user",loginResponse.getUser());
           return "redirect:/home";
       }
    }


    @RequestMapping(path = "/register", method = RequestMethod.POST)
    public String register(Model model, HttpServletRequest request, SystemUser user) {
        user = userService.insert(user);
        return "login";
    }


    @RequestMapping(path = "/testMail", method = RequestMethod.GET)
    public String testMail(Model model, HttpServletRequest request) {
        Email email=new Email();
        email.setAsunto("Este es un asunto de prueba");
        email.setDestino("portafolioduoc2018@yopmail.com");
        email.setMensaje("<html>" +
                "<head>" +
                "</head>" +
                "<body>" +
                "<b>hola mundo</b>"+
                "<a href='www.google.com'>esto es un link</a>"+
                "</body>" +
                "</html>");
        mailService.enviarCorreo(email);
        return "redirect:/home";
    }







}