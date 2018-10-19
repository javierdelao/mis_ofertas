package com.mis_ofertas.app.controller;

import com.mis_ofertas.app.model.SystemUser;
import com.mis_ofertas.app.service.RestService;
import com.mis_ofertas.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class MainController extends ModelAttributesController{


    protected RestService restService;

    protected UserService userService;

    @Autowired
    public void setRestService(RestService restService) {
        this.restService = restService;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    protected SystemUser user(HttpServletRequest request){
        HttpSession session = request.getSession();
        return (SystemUser)session.getAttribute("user");
    }

}
