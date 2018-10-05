package com.mis_ofertas.app.model;

import javax.persistence.Entity;

@Entity
public class Store {


    private Long id;


    private String name;

    private String direction;

    private Commune commune;

    public Store() {
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

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public Commune getCommune() {
        return commune;
    }

    public void setCommune(Commune commune) {
        this.commune = commune;
    }

    public void fetchCollections() {

    }
}
