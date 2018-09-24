package com.mis_ofertas.app.model;

import javax.persistence.*;
import java.io.Serializable;

public class User {

        private Long id;

        private String rut;

        private String firstName;

        private String lastName;

        private String email;

        private String password;

        private Rol rol;

        public User() {
        }

        public Long getId() {
                return id;
                }

        public void setId(Long id) {
                this.id = id;
                }

        public String getRut() {
                return rut;
                }

        public void setRut(String rut) {
                this.rut = rut;
                }

        public String getFirstName() {
                return firstName;
                }

        public void setFirstName(String firstName) {
                this.firstName = firstName;
                }

        public String getLastName() {
                return lastName;
                }

        public void setLastName(String lastName) {
                this.lastName = lastName;
                }

        public Rol getRol() {
                return rol;
                }

        public void setRol(Rol rol) {
                this.rol = rol;
                }

        public String getEmail() {
                return email;
        }

        public void setEmail(String email) {
                this.email = email;
        }

        public String getPassword() {
                return password;
        }

        public void setPassword(String password) {
                this.password = password;
        }

}


