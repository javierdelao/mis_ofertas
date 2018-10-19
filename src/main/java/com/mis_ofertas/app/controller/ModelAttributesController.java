package com.mis_ofertas.app.controller;

import com.mis_ofertas.app.util.ConfigProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

public class ModelAttributesController {

    private ConfigProperties configProperties;

    @Autowired
    public void setConfigProperties(ConfigProperties configProperties) {
        this.configProperties = configProperties;
    }

    @ModelAttribute("urlBase")
    public String segmentJavascriptKey() {
        return configProperties.getProperty("url-base");
    }

}
