package com.mis_ofertas.app.controller;

import com.mis_ofertas.app.model.SystemUser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class MainController {

    protected SystemUser user(HttpServletRequest request){
        HttpSession session = request.getSession();
        return (SystemUser)session.getAttribute("user");
    }

}
