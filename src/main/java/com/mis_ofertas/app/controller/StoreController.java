/*
 * Copyright (c) 2017 Business News Americas Limitada - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 */

package com.mis_ofertas.app.controller;

import com.mis_ofertas.app.model.Store;
import com.mis_ofertas.app.model.SystemUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
@RequestMapping("/store")
public class StoreController extends MainController {


    @RequestMapping(path = "/", method = RequestMethod.GET)
    public String home(Model model, HttpServletRequest request) {
        SystemUser usuario = user(request);

        List<Store> storeList = restService.stores(usuario, true, true);
        model.addAttribute("storeList", storeList);
        return "Tienda/tiendas";
    }

    @RequestMapping(path = "/create", method = RequestMethod.GET)
    public String create(Model model, HttpServletRequest request) {
        SystemUser usuario = user(request);
        model.addAttribute("communes", restService.communes());
        model.addAttribute("citys", restService.citys());
        model.addAttribute("countrys", restService.countrys());
        return "Tienda/agregarT";
    }


    @RequestMapping(path = "/create", method = RequestMethod.POST)
    public String create(
            Model model,
            HttpServletRequest request,
            @RequestParam("name") String name,
            @RequestParam("direction") String direction,
            @RequestParam("commune") Long communeId,
            @RequestParam("city") Long cityId,
            @RequestParam("country") Long countryId) {
        SystemUser usuario = user(request);

        Store store = new Store();


        store.setName(name);
        store.setDirection(direction);
        store.setCommune(restService.commune(communeId));

        store = restService.create(store);
        return "redirect:/store/";
    }


    @RequestMapping(path = "/edit", method = RequestMethod.GET)
    public String create(Model model, @RequestParam(value = "fdsgs") String nombre) {
        List<Store> stores = restService.stores();

        Store store = stores.get(0);

        store.setName(nombre);

        restService.edit(store);

        return "";


    }

}
