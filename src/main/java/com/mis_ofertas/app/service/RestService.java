package com.mis_ofertas.app.service;

import com.mis_ofertas.app.model.Product;
import com.mis_ofertas.app.model.SystemUser;
import com.mis_ofertas.app.response.LoginResponse;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;
import java.util.List;

@Service
public class RestService {

    public LoginResponse login(SystemUser user){
        RestTemplate restTemplate = new RestTemplate();
        LoginResponse loginResponse = restTemplate.getForObject(
                "http://localhost:8181/user/login/"+user.getRut()+"/"+user.getPassword(),
                LoginResponse.class);
        return loginResponse;
    }


    public List<Product> products(){
        RestTemplate restTemplate = new RestTemplate();
        Product[] productList = restTemplate.getForObject(
                "http://localhost:8181/product/list",
                Product[].class);
        return Arrays.asList(productList);
    }


}
