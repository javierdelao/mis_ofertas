package com.mis_ofertas.app.controller;

import com.mis_ofertas.app.model.SystemUser;
import com.mis_ofertas.app.util.ConfigProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;

public class ModelAttributesController {

    protected ConfigProperties configProperties;

    @Autowired
    public void setConfigProperties(ConfigProperties configProperties) {
        this.configProperties = configProperties;
    }

    @ModelAttribute("urlBase")
    public String urlBase() {
        return configProperties.getProperty("url-base");
    }



}
