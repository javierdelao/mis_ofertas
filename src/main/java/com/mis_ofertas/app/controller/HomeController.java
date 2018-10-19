/*
 * Copyright (c) 2017 Business News Americas Limitada - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 */

package com.mis_ofertas.app.controller;

import com.mis_ofertas.app.model.Product;
import com.mis_ofertas.app.model.SystemUser;
import com.mis_ofertas.app.response.LoginResponse;
import com.mis_ofertas.app.service.RestService;
import com.mis_ofertas.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

        List<Product> productList=restService.products();
        model.addAttribute("ok","ok");

        model.addAttribute("productList",productList);
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




}