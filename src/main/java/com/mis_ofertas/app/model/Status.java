package com.mis_ofertas.app.model;

import javax.persistence.*;
import java.io.Serializable;

public class Status  {

    private Long id;

    private String name;

    private String description;


    public Status() {
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void fetchCollections() {

    }
}
