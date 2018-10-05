package com.mis_ofertas.app.service;

import com.mis_ofertas.app.model.SystemUser;
import com.mis_ofertas.app.response.LoginResponse;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class UserService {


    public SystemUser insert(SystemUser user) {
        RestTemplate restTemplate = new RestTemplate();
        SystemUser systemUser = restTemplate.postForObject(
                "http://localhost:8181/user/create/",
                user,
                SystemUser.class
        );
        return systemUser;
    }

}
