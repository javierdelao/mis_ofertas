package com.mis_ofertas.app.util;

import java.util.Date;

public class VisitPerDayReport {

    private Integer visitQta;

    private Date date;

    private String dateString;

    public VisitPerDayReport( ) {

    }

    public Integer getVisitQta() {
        return visitQta;
    }

    public void setVisitQta(Integer visitQta) {
        this.visitQta = visitQta;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDateString() {
        return dateString;
    }

    public void setDateString(String dateString) {
        this.dateString = dateString;
    }
}
