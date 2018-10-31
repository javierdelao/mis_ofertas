package com.mis_ofertas.app.service;

import com.mis_ofertas.app.model.*;
import com.mis_ofertas.app.response.LoginResponse;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;
import java.util.List;

@Service
public class RestService {

    public LoginResponse login(SystemUser user) {
        RestTemplate restTemplate = new RestTemplate();
        LoginResponse loginResponse = restTemplate.getForObject(
                "http://localhost:8181/user/login/" + user.getRut() + "/" + user.getPassword(),
                LoginResponse.class);
        return loginResponse;
    }


    public List<Product> products() {
        RestTemplate restTemplate = new RestTemplate();
        Product[] productList = restTemplate.getForObject(
                "http://localhost:8181/product/list",
                Product[].class);
        return Arrays.asList(productList);
    }

    public Product product(Long id) {
        RestTemplate restTemplate = new RestTemplate();
        Product product = restTemplate.getForObject(
                "http://localhost:8181/product/"+id,
                Product.class);
        return product;
    }


    public List<Product> products(SystemUser user,Boolean owner,Boolean active) {
        RestTemplate restTemplate = new RestTemplate();
        Product[] productList = restTemplate.getForObject(
                "http://localhost:8181/product/list/"+user.getId()+"/"+owner+"/"+active,
                Product[].class);
        return Arrays.asList(productList);
    }

    public Product products(Long id) {
        RestTemplate restTemplate = new RestTemplate();
        Product product = restTemplate.getForObject(
                "http://localhost:8181/product/" + id,
                Product.class);
        return product;
    }

    public List<Store> stores() {
        RestTemplate restTemplate = new RestTemplate();
        Store[] storeList= restTemplate.getForObject(
                "http://localhost:8181/store/list",
                Store[].class);
        return Arrays.asList(storeList);
    }

    public Store store(Long id) {
        RestTemplate restTemplate = new RestTemplate();
        Store store = restTemplate.getForObject(
                "http://localhost:8181/store/"+id,
                Store.class);
        return store;
    }
    public List<Store> stores(SystemUser user,Boolean owner,Boolean active) {
        RestTemplate restTemplate = new RestTemplate();
        Store[] storeList = restTemplate.getForObject(
                "http://localhost:8181/store/list/",
                Store[].class);
        return Arrays.asList(storeList);
    }

    public List<ProductType> productTypes() {
        RestTemplate restTemplate = new RestTemplate();
        ProductType[] productTypes = restTemplate.getForObject(
                "http://localhost:8181/producttype/list",
                ProductType[].class);
        return Arrays.asList(productTypes);
    }

    public ProductType productType(Long id) {
        RestTemplate restTemplate = new RestTemplate();
        ProductType productType = restTemplate.getForObject(
                "http://localhost:8181/producttype/" + id,
                ProductType.class);
        return productType;
    }

    public List<Area> areas() {
        RestTemplate restTemplate = new RestTemplate();
        Area[] areas = restTemplate.getForObject(
                "http://localhost:8181/area/list",
                Area[].class);
        return Arrays.asList(areas);
    }

    public Area area(Long id) {
        RestTemplate restTemplate = new RestTemplate();
        Area area = restTemplate.getForObject(
                "http://localhost:8181/area/" + id,
                Area.class);
        return area;
    }

    public Commune commune(Long id) {
        RestTemplate restTemplate = new RestTemplate();
        Commune commune = restTemplate.getForObject(
                "http://localhost:8181/commuune/" + id,
                Commune.class);
        return commune;
    }

    public List<Commune> communes() {
        RestTemplate restTemplate = new RestTemplate();
        Commune[] commune = restTemplate.getForObject(
                "http://localhost:8181/commune/list",
                Commune[].class);
        return Arrays.asList(commune);
    }

    public City city(Long id) {
        RestTemplate restTemplate = new RestTemplate();
        City city = restTemplate.getForObject(
                "http://localhost:8181/city/" + id,
                City.class);
        return city;
    }

    public List<City> citys() {
        RestTemplate restTemplate = new RestTemplate();
        City[] city = restTemplate.getForObject(
                "http://localhost:8181/city/list",
                City[].class);
        return Arrays.asList(city);
    }

    public List<Country> countrys() {
        RestTemplate restTemplate = new RestTemplate();
        Country[] country = restTemplate.getForObject(
                "http://localhost:8181/country/list",
                Country[].class);
        return Arrays.asList(country);
    }


    public List<Status> statuses() {
        RestTemplate restTemplate = new RestTemplate();
        Status[] statuses = restTemplate.getForObject(
                "http://localhost:8181/status/list",
                Status[].class);
        return Arrays.asList(statuses);
    }

    public Status status(Long id) {
        RestTemplate restTemplate = new RestTemplate();
        Status status = restTemplate.getForObject(
                "http://localhost:8181/status/" + id,
                Status.class);
        return status;
    }

    public Product create(Product product) {
        RestTemplate restTemplate = new RestTemplate();
        Product productResponse = restTemplate.postForObject(
                "http://localhost:8181/product/create",
                product,
                Product.class);
        return productResponse;
    }


    public Store create(Store store) {
        RestTemplate restTemplate = new RestTemplate();
        Store storeResponse = restTemplate.postForObject(
                "http://localhost:8181/store/create",
                store,
                Store.class);
        return storeResponse;
    }

    public Product edit(Product product) {
        RestTemplate restTemplate = new RestTemplate();
        Product product1 = restTemplate.postForObject(
                "http://localhost:8181/product/edit",
                product,
                Product.class);
        return product1;
    }

    public Store edit(Store store) {
        RestTemplate restTemplate = new RestTemplate();
        Store storeResponse = restTemplate.postForObject(
                "http://localhost:8181/store/edit",
                store,
                Store.class);
        return storeResponse;
    }


}
