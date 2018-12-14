/*
 * Copyright (c) 2017 Business News Americas Limitada - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 */

package com.mis_ofertas.app.controller;

import com.cloudinary.Cloudinary;
import com.mis_ofertas.app.model.*;
import org.cloudinary.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;


@Controller
@RequestMapping("/store")
public class StoreController extends MainController {


    private final static Map<Object, Object> CONFIG = new HashMap<>();

    static {
        CONFIG.put("cloud_name", "duzvu8wmg");
        CONFIG.put("api_key", "595457353713571");
        CONFIG.put("api_secret", "RxV3bs5fiChrbbl1UFRcBe3b9cc");
    }

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public String home(Model model, HttpServletRequest request) {
        SystemUser usuario = user(request);

        List<Store> storeList = restService.stores();
        model.addAttribute("textSearch", "");
        model.addAttribute("commune", new Commune(Long.parseLong("0")));
        model.addAttribute("communes", restService.communes());
        model.addAttribute("storeList", storeList);
        return "Tienda/tiendas";
    }

    @RequestMapping(path = "/filter", method = RequestMethod.POST)
    public String filter(Model model,
                         HttpServletRequest request,
                         @RequestParam("communeId") Long communeId,
                         @RequestParam("textSearch") String textSearch) {
        SystemUser usuario = user(request);
        Commune commune=restService.commune(communeId);
        if(commune==null){
            commune=new Commune(Long.parseLong("0"));
        }
        List<Store> storeList = restService.stores(commune,textSearch);
        model.addAttribute("textSearch", textSearch);
        model.addAttribute("commune", commune);
        model.addAttribute("communes", restService.communes());
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
            @RequestParam("country") Long countryId,
            @RequestParam("image") MultipartFile image) throws IOException {
        SystemUser usuario = user(request);

        String uploadsDir = configProperties.getProperty("imagesLocalPath");

        if (!new File(uploadsDir).exists()) {
            new File(uploadsDir).mkdir();
        }
        Image imagep = new Image();
        Random rand = new Random();

        int n = rand.nextInt(50000000) + 1;

        String orgName = image.getOriginalFilename();
        String filePath = uploadsDir + n + orgName;
        File dest = new File(filePath);
        image.transferTo(dest);
        imagep.setPath(n + orgName);

        Store store = new Store();
        store.setName(name);
        store.setDirection(direction);
        store.setCommune(restService.commune(communeId));
        store.setImage(imagep);
        store = restService.create(store);
        return "redirect:/store/";
    }

    @RequestMapping(path = "/edit", method = RequestMethod.POST)
    public String edit(
            Model model,
            HttpServletRequest request,
            @RequestParam(value = "image", required = false) MultipartFile image,
            @RequestParam("id") Long id,
            @RequestParam("name") String name,
            @RequestParam("direction") String direction,
            @RequestParam("commune") Long communeId,
            @RequestParam("city") Long cityId,
            @RequestParam("country") Long countryId) throws IOException {
        SystemUser usuario = user(request);

        Store store = restService.store(id);

        if (!image.isEmpty()) {
            try {
                File convFile = new File(image.getOriginalFilename());
                convFile.createNewFile();
                FileOutputStream fos = new FileOutputStream(convFile);
                fos.write(image.getBytes());
                fos.close();
                File cloudinaryFile = convFile;

                Cloudinary cloudinary = new Cloudinary("cloudinary://595457353713571:RxV3bs5fiChrbbl1UFRcBe3b9cc@duzvu8wmg");
                CONFIG.put("folder","images");
                JSONObject result = new JSONObject(cloudinary.uploader().upload(cloudinaryFile, CONFIG));
                Image imagep = new Image();
                imagep.setPath(result.getString("url"));
                store.setImage(imagep);
                System.out.println("done");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }


        store.setName(name);
        store.setDirection(direction);
        store.setCommune(restService.commune(communeId));

        store = restService.edit(store);
        return "redirect:/store/";
    }

    @RequestMapping(path = "/edit/{storeId}", method = RequestMethod.GET)
    public String edit(Model model, HttpServletRequest request, @PathVariable Long storeId) throws ParseException {
        SystemUser usuario = user(request);
        Store store = restService.store(storeId);

        model.addAttribute("communes", restService.communes());
        model.addAttribute("citys", restService.citys());
        model.addAttribute("countrys", restService.countrys());

        model.addAttribute("store", store);
        return "Tienda/editarT";

    }


    @RequestMapping(path = "/detail/{storeId}", method = RequestMethod.GET)
    public String detail(Model model, HttpServletRequest request, @PathVariable Long storeId) throws ParseException {
        SystemUser usuario = user(request);
        Store store = restService.store(storeId);
        List<Product>productList=restService.products(store);
        model.addAttribute("store", store);
        model.addAttribute("productList", productList);
        return "Tienda/detalleT";


    }


}