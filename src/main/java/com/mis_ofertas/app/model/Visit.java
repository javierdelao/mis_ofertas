package com.mis_ofertas.app.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


public class Visit {


    private Long id;


    private Date visitDate;


    private Product product;


    private SystemUser systemUser;

    public Visit() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Date getVisitDate() {
        return visitDate;
    }

    public void setVisitDate(Date visitDate) {
        this.visitDate = visitDate;
    }

    public void fetchCollections() {

    }


}


