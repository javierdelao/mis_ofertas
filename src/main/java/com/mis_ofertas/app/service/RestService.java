package com.mis_ofertas.app.service;

import com.mis_ofertas.app.model.*;
import com.mis_ofertas.app.response.LoginResponse;
import com.mis_ofertas.app.util.CustomProductList;
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

    public List<Product> products(Store store) {
        RestTemplate restTemplate = new RestTemplate();
        Product[] productList = restTemplate.getForObject(
                "http://localhost:8181/store/products/" + store.getId(),
                Product[].class);
        return Arrays.asList(productList);
    }


    public List<Product> products() {
        RestTemplate restTemplate = new RestTemplate();
        Product[] productList = restTemplate.getForObject(
                "http://localhost:8181/product/list",
                Product[].class);
        return Arrays.asList(productList);
    }

    public List<Product> products(Area area) {
        RestTemplate restTemplate = new RestTemplate();
        Product[] productList = restTemplate.getForObject(
                "http://localhost:8181/product/list/" + area.getId(),
                Product[].class);
        return Arrays.asList(productList);
    }

    public CustomProductList custom(SystemUser user) {
        RestTemplate restTemplate = new RestTemplate();
        CustomProductList customProductList = restTemplate.getForObject(
                "http://localhost:8181/product/list/custom/" + user.getId(),
                CustomProductList.class);
        return customProductList;
    }

    public List<Offer> offers() {
        RestTemplate restTemplate = new RestTemplate();
        Offer[] offers = restTemplate.getForObject(
                "http://localhost:8181/offer/list",
                Offer[].class);
        return Arrays.asList(offers);
    }

    public List<OfferType> offerTypes() {
        RestTemplate restTemplate = new RestTemplate();
        OfferType[] offerTypes = restTemplate.getForObject(
                "http://localhost:8181/offertype/list",
                OfferType[].class);
        return Arrays.asList(offerTypes);
    }

    public OfferType offerType(Long id) {
        RestTemplate restTemplate = new RestTemplate();
        OfferType offerType = restTemplate.getForObject(
                "http://localhost:8181/offertype/" + id,
                OfferType.class);
        return offerType;
    }

    public Offer offer(Long id) {
        RestTemplate restTemplate = new RestTemplate();
        Offer offer = restTemplate.getForObject(
                "http://localhost:8181/offer/" + id,
                Offer.class);
        return offer;
    }

    public Product product(Long id) {
        RestTemplate restTemplate = new RestTemplate();
        Product product = restTemplate.getForObject(
                "http://localhost:8181/product/" + id,
                Product.class);
        return product;
    }


    public List<Product> products(SystemUser user, Boolean owner, Boolean active) {
        RestTemplate restTemplate = new RestTemplate();
        Product[] productList = restTemplate.getForObject(
                "http://localhost:8181/product/list/" + user.getId() + "/" + owner + "/" + active,
                Product[].class);
        return Arrays.asList(productList);
    }

    public List<Product> products(SystemUser user,
                                  Boolean owner,
                                  Status status,
                                  Area area,
                                  ProductType productType,
                                  String textSearch) {
        RestTemplate restTemplate = new RestTemplate();
        String statusId = status == null ? "0" : status.getId().toString();
        String areaId = area == null ? "0" : area.getId().toString();
        String productTypeId = productType == null ? "0" : productType.getId().toString();
        if (textSearch == null || textSearch.equals("")) {
            textSearch = "null";
        }
        String url = "http://localhost:8181/product/list/"
                + user.getId() + "/"
                + owner + "/"
                + statusId + "/"
                + areaId + "/"
                + productTypeId + "/"
                + textSearch;
        Product[] productList = restTemplate.getForObject(
                url,
                Product[].class);
        return Arrays.asList(productList);
    }


    public List<Store> stores() {
        RestTemplate restTemplate = new RestTemplate();
        Store[] storeList = restTemplate.getForObject(
                "http://localhost:8181/store/list",
                Store[].class);
        return Arrays.asList(storeList);
    }

    public Store store(Long id) {
        RestTemplate restTemplate = new RestTemplate();
        Store store = restTemplate.getForObject(
                "http://localhost:8181/store/" + id,
                Store.class);
        return store;
    }

    public List<Store> stores(Commune commune, String textSearch) {
        String communeId = commune == null ? "0" : commune.getId().toString();
        if (textSearch == null || textSearch.equals("")) {
            textSearch = "null";
        }
        RestTemplate restTemplate = new RestTemplate();
        Store[] storeList = restTemplate.getForObject(
                "http://localhost:8181/store/list/"
                        + communeId + "/" +
                        textSearch,
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

    public List<ProductType> productTypes(String textSearch) {
        RestTemplate restTemplate = new RestTemplate();
        if (textSearch == null || textSearch.equals("")) {
            textSearch = "null";
        }
        ProductType[] productTypes = restTemplate.getForObject(
                "http://localhost:8181/producttype/list/" + textSearch,
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

    public List<ProductType> productTypes(SystemUser user, Boolean owner, Boolean active) {
        RestTemplate restTemplate = new RestTemplate();
        ProductType[] productTypes = restTemplate.getForObject(
                "http://localhost:8181/producttype/list",
                ProductType[].class);
        return Arrays.asList(productTypes);
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
                "http://localhost:8181/commune/" + id,
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

    public Offer create(Offer offer) {
        RestTemplate restTemplate = new RestTemplate();
        Offer offerResponse = restTemplate.postForObject(
                "http://localhost:8181/offer/create",
                offer,
                Offer.class);
        return offerResponse;
    }


    public Store create(Store store) {
        RestTemplate restTemplate = new RestTemplate();
        Store storeResponse = restTemplate.postForObject(
                "http://localhost:8181/store/create",
                store,
                Store.class);
        return storeResponse;
    }

    public ProductType create(ProductType productType) {
        RestTemplate restTemplate = new RestTemplate();
        ProductType productTypeResponse = restTemplate.postForObject(
                "http://localhost:8181/producttype/create",
                productType,
                ProductType.class);
        return productTypeResponse;
    }

    public Product edit(Product product) {
        RestTemplate restTemplate = new RestTemplate();
        Product product1 = restTemplate.postForObject(
                "http://localhost:8181/product/edit",
                product,
                Product.class);
        return product1;
    }

    public Offer edit(Offer offer) {
        RestTemplate restTemplate = new RestTemplate();
        Offer offerResponse = restTemplate.postForObject(
                "http://localhost:8181/offer/edit",
                offer,
                Offer.class);
        return offerResponse;
    }

    public Store edit(Store store) {
        RestTemplate restTemplate = new RestTemplate();
        Store storeResponse = restTemplate.postForObject(
                "http://localhost:8181/store/edit",
                store,
                Store.class);
        return storeResponse;
    }

    public ProductType edit(ProductType productType) {
        RestTemplate restTemplate = new RestTemplate();
        ProductType productTypeResponse = restTemplate.postForObject(
                "http://localhost:8181/producttype/edit",
                productType,
                ProductType.class);
        return productTypeResponse;
    }


    public Visit create(Visit visit) {
        RestTemplate restTemplate = new RestTemplate();
        Visit visitResponse = restTemplate.postForObject(
                "http://localhost:8181/visit/create",
                visit,
                Visit.class);
        return visitResponse;
    }

    public Store detail(Store store) {
        RestTemplate restTemplate = new RestTemplate();
        Store storeResponse = restTemplate.postForObject(
                "http://localhost:8181/store/detail",
                store,
                Store.class);
        return storeResponse;
    }

    public Product detail(Product product) {
        RestTemplate restTemplate = new RestTemplate();
        Product storeResponse = restTemplate.postForObject(
                "http://localhost:8181/product/detail",
                product,
                Product.class);
        return product;
    }


}
