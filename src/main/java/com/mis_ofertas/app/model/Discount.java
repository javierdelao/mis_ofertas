package com.mis_ofertas.app.model;

import java.util.Date;

public class Discount {


    private Long id;


    private String code;

    private Boolean used;

    private String usedString;

    private Date creationDate;

    private Date expirationDate;

    private String formatCreationDate;

    private String formatExpirationDate;

    private String path;

    private SystemUser user;

    private Integer percentage;

    public Discount() {
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Boolean getUsed() {
        return used;
    }

    public void setUsed(Boolean used) {
        this.used = used;
    }

    public SystemUser getUser() {
        return user;
    }

    public void setUser(SystemUser user) {
        this.user = user;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getFormatCreationDate() {
        return formatCreationDate;
    }

    public void setFormatCreationDate(String formatCreationDate) {
        this.formatCreationDate = formatCreationDate;
    }

    public String getFormatExpirationDate() {
        return formatExpirationDate;
    }

    public void setFormatExpirationDate(String formatExpirationDate) {
        this.formatExpirationDate = formatExpirationDate;
    }

    public Integer getPercentage() {
        return percentage;
    }

    public void setPercentage(Integer percentage) {
        this.percentage = percentage;
    }

    public String getUsedString() {
        return usedString;
    }

    public void setUsedString(String usedString) {
        this.usedString = usedString;
    }
}
