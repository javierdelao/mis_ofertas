package com.mis_ofertas.app.model;

import javax.persistence.*;
import java.io.Serializable;


public class Commune {


    private Long id;


    private String name;


    private City city;

    public Commune() {
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

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

}
