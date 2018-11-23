package com.mis_ofertas.app.model;

import javax.persistence.*;
import java.io.Serializable;


public class Valoration {

    private Long id;


    private Integer valoration_star;


    private Product product;

    private SystemUser systemUser;


    public Valoration() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getValoration_star() {
        return valoration_star;
    }

    public void setValoration_star(Integer valoration_star) {
        this.valoration_star = valoration_star;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public SystemUser getSystemUser() {
        return systemUser;
    }

    public void setSystemUser(SystemUser systemUser) {
        this.systemUser = systemUser;
    }




}


