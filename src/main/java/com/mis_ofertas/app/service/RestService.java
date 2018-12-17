package com.mis_ofertas.app.service;

import com.mis_ofertas.app.model.*;
import com.mis_ofertas.app.response.LoginResponse;
import com.mis_ofertas.app.util.CustomProductList;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;
import java.util.Date;
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

    public List<SystemUser> systemUsers() {
        RestTemplate restTemplate = new RestTemplate();
        SystemUser[] systemUsers = restTemplate.getForObject(
                "http://localhost:8181/user/list",
                SystemUser[].class);
        return Arrays.asList(systemUsers);
    }

    public Integer qta(Product product) {
        RestTemplate restTemplate = new RestTemplate();
        Visit[] visits = restTemplate.getForObject(
                "http://localhost:8181/visit/qta/"+product.getId(),
                Visit[].class);
        return visits.length;
    }

    public Integer visitPerDay(Product product, Date date) {
        RestTemplate restTemplate = new RestTemplate();
        Visit[] visits = restTemplate.postForObject(
                "http://localhost:8181/visit/visitperday/"+product.getId(),
                date,
                Visit[].class);
        return visits.length;
    }


    public List<Product> products(Store store) {
        RestTemplate restTemplate = new RestTemplate();
        Product[] productList = restTemplate.getForObject(
                "http://localhost:8181/store/products/" + store.getId(),
                Product[].class);
        return Arrays.asList(productList);
    }


    public List<Note> notes(Product Product) {
        RestTemplate restTemplate = new RestTemplate();
        Note[] noteList = restTemplate.getForObject(
                "http://localhost:8181/note/product/" + Product.getId(),
                Note[].class);
        return Arrays.asList(noteList);
    }

    public Valoration valoration(Product Product, SystemUser systemUser) {
        RestTemplate restTemplate = new RestTemplate();
        Valoration valoration = restTemplate.getForObject(
                "http://localhost:8181/valoration/" + Product.getId() + "/" + systemUser.getId(),
                Valoration.class);
        return valoration;
    }

    public Double productAverage(Product Product) {
        RestTemplate restTemplate = new RestTemplate();
        Valoration[] valorations = restTemplate.getForObject(
                "http://localhost:8181/valoration/average/" + Product.getId(),
                Valoration[].class);
        Double cont=0.0;
        Double total=0.0;
        for(Valoration valoration:Arrays.asList(valorations)){
            cont++;
            total=total+valoration.getValoration_star();
        }
        Double result= total/cont;
        return result;
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
        System.out.println("http://localhost:8181/product/list/custom/" + user.getId());
        CustomProductList customProductList = restTemplate.getForObject(
                "http://localhost:8181/product/list/custom/" + user.getId(),
                CustomProductList.class);
        System.out.println(customProductList.getCustomProductListItems().size());
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

    public List<Offer> offerHistory(Product product) {
        RestTemplate restTemplate = new RestTemplate();
        Offer[] offerList = restTemplate.getForObject(
                "http://localhost:8181/offer/history/" + product.getId(),
                Offer[].class);
        return Arrays.asList(offerList);
    }

    public Product product(Long id) {
        RestTemplate restTemplate = new RestTemplate();
        Product product = restTemplate.getForObject(
                "http://localhost:8181/product/" + id,
                Product.class);
        return product;
    }

    public Product delete(Product product) {
        RestTemplate restTemplate = new RestTemplate();
        Product productResponse = restTemplate.postForObject(
                "http://localhost:8181/product/delete",
                product,
                Product.class);
        return productResponse;
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

    public List<Area> areas(String textSearch) {
        RestTemplate restTemplate = new RestTemplate();
        if (textSearch == null || textSearch.equals("")) {
            textSearch = "null";
        }
        Area[] areas = restTemplate.getForObject(
                "http://localhost:8181/area/list/" + textSearch,
                Area[].class);
        return Arrays.asList(areas);
    }

    public List<Area> areas(SystemUser user, Boolean owner, Boolean active) {
        RestTemplate restTemplate = new RestTemplate();
        Area[] areas = restTemplate.getForObject(
                "http://localhost:8181/area/list",
                Area[].class);
        return Arrays.asList(areas);
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

    public Document create(Document document) {
        RestTemplate restTemplate = new RestTemplate();
        Document documentResponse = restTemplate.postForObject(
                "http://localhost:8181/document/create",
                document,
                Document.class);
        return documentResponse;
    }


    public Note create(Note note) {
        RestTemplate restTemplate = new RestTemplate();
        Note noteResponse = restTemplate.postForObject(
                "http://localhost:8181/note/create",
                note,
                Note.class);
        return noteResponse;
    }

    public Valoration create(Valoration valoration) {
        RestTemplate restTemplate = new RestTemplate();
        Valoration valorationResponse = restTemplate.postForObject(
                "http://localhost:8181/valoration/create",
                valoration,
                Valoration.class);
        return valorationResponse;
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

    public Area create(Area area) {
        RestTemplate restTemplate = new RestTemplate();
        Area areaResponse = restTemplate.postForObject(
                "http://localhost:8181/area/create",
                area,
                Area.class);
        return areaResponse;
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

    public Area edit(Area area) {
        RestTemplate restTemplate = new RestTemplate();
        Area areaResponse = restTemplate.postForObject(
                "http://localhost:8181/area/edit",
                area,
                Area.class);
        return areaResponse;
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


    public List<SystemUser> systemUser() {
        RestTemplate restTemplate = new RestTemplate();
        SystemUser[] systemUser = restTemplate.getForObject(
                "http://localhost:8181/user/list",
                SystemUser[].class);
        return Arrays.asList(systemUser);
    }

    public SystemUser systemUser(Long id) {
        RestTemplate restTemplate = new RestTemplate();
        SystemUser systemUser = restTemplate.getForObject(
                "http://localhost:8181/user/" + id,
                SystemUser.class);
        return systemUser;
    }

    public List<SystemUser> systemUser(SystemUser user, Boolean owner, Boolean active) {
        RestTemplate restTemplate = new RestTemplate();
        SystemUser[] systemUser = restTemplate.getForObject(
                "http://localhost:8181/user/list",
                SystemUser[].class);
        return Arrays.asList(systemUser);
    }

    public SystemUser edit(SystemUser systemUser) {
        RestTemplate restTemplate = new RestTemplate();
        SystemUser systemUserResponse = restTemplate.postForObject(
                "http://localhost:8181/user/edit",
                systemUser,
                SystemUser.class);
        return systemUserResponse;
    }

    public SystemUser create(SystemUser systemUser) {
        RestTemplate restTemplate = new RestTemplate();
        SystemUser systemUserResponse = restTemplate.postForObject(
                "http://localhost:8181/user/create",
                systemUser,
                SystemUser.class);
        return systemUserResponse;
    }

    public SystemUser detail(SystemUser systemUser) {
        RestTemplate restTemplate = new RestTemplate();
        SystemUser systemUserResponse = restTemplate.postForObject(
                "http://localhost:8181/user/detail",
                systemUser,
                SystemUser.class);
        return systemUserResponse;
    }


    public List<Discount> discounts(SystemUser systemUser) {
        RestTemplate restTemplate = new RestTemplate();
        Discount[] discounts = restTemplate.getForObject(
                "http://localhost:8181/discount/list/" + systemUser.getId(),
                Discount[].class);
        return Arrays.asList(discounts);
    }

    public Boolean existCode(String code) {
        RestTemplate restTemplate = new RestTemplate();
        Boolean exist = restTemplate.getForObject(
                "http://localhost:8181/discount/exist/" + code,
                Boolean.class);
        return exist;
    }

    public Discount create(Discount discount) {
        RestTemplate restTemplate = new RestTemplate();
        Discount discountResponse = restTemplate.postForObject(
                "http://localhost:8181/discount/create",
                discount,
                Discount.class);
        return discountResponse;
    }


}
