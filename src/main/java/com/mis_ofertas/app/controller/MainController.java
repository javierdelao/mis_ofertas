package com.mis_ofertas.app.controller;

import com.mis_ofertas.app.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class MainController {

    protected User user(HttpServletRequest request){
        HttpSession session = request.getSession();
        return (User)session.getAttribute("user");
    }

}
