package com.mis_ofertas.app.response;

import com.mis_ofertas.app.model.User;

public class LoginResponse {

    private User user;

    private String status;

    public LoginResponse() {
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
