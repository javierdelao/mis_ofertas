package com.mis_ofertas.app.service;

import com.mis_ofertas.app.model.User;
import com.mis_ofertas.app.response.LoginResponse;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class RestService {

    public LoginResponse login(User user){
        RestTemplate restTemplate = new RestTemplate();
        LoginResponse loginResponse = restTemplate.getForObject(
                "http://localhost:8181/api/login/"+user.getRut()+"/"+user.getPassword(),
                LoginResponse.class);
        return loginResponse;
    }


}
