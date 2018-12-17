package com.mis_ofertas.app.controller;

import com.mis_ofertas.app.model.SystemUser;
import com.mis_ofertas.app.service.MailService;
import com.mis_ofertas.app.service.RestService;
import com.mis_ofertas.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class MainController extends ModelAttributesController {


    protected RestService restService;

    protected UserService userService;

    protected MailService mailService;

    @Autowired
    public void setRestService(RestService restService) {
        this.restService = restService;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setMailService(MailService mailService) {
        this.mailService = mailService;
    }

    protected SystemUser user(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return (SystemUser) session.getAttribute("user");
    }

    protected Boolean hasAccess(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return (SystemUser) session.getAttribute("user") != null;
    }

    protected Boolean hasAccess(HttpServletRequest request, String rol) {
        HttpSession session = request.getSession();
        if ((SystemUser) session.getAttribute("user") == null) {
            return false;
        }
        SystemUser systemUser = (SystemUser) session.getAttribute("user");
        switch (rol) {
            case "CLIENT": {
                if (systemUser.getRol().getName().equals("CLIENT") ||
                        systemUser.getRol().getName().equals("REPRESENTATIVE") ||
                        systemUser.getRol().getName().equals("ADMIN")) {
                    return true;
                }
                break;
            }
            case "REPRESENTATIVE": {
                if (systemUser.getRol().getName().equals("REPRESENTATIVE") ||
                        systemUser.getRol().getName().equals("ADMIN")) {
                    return true;
                }
                break;
            }
            case "ADMIN": {
                if (systemUser.getRol().getName().equals("ADMIN")) {
                    return true;
                }
                break;
            }
            default: {
                return false;
            }
        }
        return false;
    }

}
