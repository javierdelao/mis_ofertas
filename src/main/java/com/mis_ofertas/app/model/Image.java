package com.mis_ofertas.app.model;

import javax.persistence.*;
import java.io.Serializable;


public class Image {


    private Long id;


    private String path;


    public Image() {
    }


    public Long getId() {
        return id;
    }


    public void setId(Long id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }


    public void fetchCollections() {

    }
}
