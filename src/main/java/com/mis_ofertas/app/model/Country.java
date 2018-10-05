package com.mis_ofertas.app.model;

import javax.persistence.*;
import java.io.Serializable;


public class Country {


    private Long id;


    private String name;


    public Country() {
    }

    public Long getId() {
        return id;
    }


    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void fetchCollections() {

    }
}
