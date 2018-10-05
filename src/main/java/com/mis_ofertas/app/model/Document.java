package com.mis_ofertas.app.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
public class Document {

    private Long id;

    private Date uploadDate;

    private String path;


    public Document() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
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


