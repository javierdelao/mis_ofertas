package com.mis_ofertas.app.util;

import com.mis_ofertas.app.model.Product;

import java.util.Date;

public class VisitReport {

    private Integer visitQta;

    private Product product;

    public VisitReport( ) {

    }

    public Integer getVisitQta() {
        return visitQta;
    }

    public void setVisitQta(Integer visitQta) {
        this.visitQta = visitQta;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
