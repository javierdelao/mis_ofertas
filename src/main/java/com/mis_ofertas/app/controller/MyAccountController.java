package com.mis_ofertas.app.controller;

import com.mis_ofertas.app.model.SystemUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/usuario")
public class MyAccountController extends MainController{

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public String home(Model model, HttpServletRequest request) {
        SystemUser usuario = user(request);
        SystemUser SystemUser = restService.systemUser(usuario.getId());
        model.addAttribute("user", SystemUser);
        return "myAccount/account";
    }

    @RequestMapping(path = "/avatar", method = RequestMethod.POST)
    public String create(
            Model model,
            HttpServletRequest request,
            @RequestParam("avatar") String avatar){
        HttpSession session = request.getSession();

        SystemUser user=user(request);
        if(avatar!=null){
            user.setAvatar(avatar);
            user=restService.edit(user);
            session.setAttribute("user",user);
        }
        return "redirect:/usuario/";
    }

    @RequestMapping(path = "/show", method = RequestMethod.GET)
    public String show(
            Model model,
            HttpServletRequest request){
        SystemUser usuario = user(request);
        Long a = usuario.getId();
        return userData(model,request,a);
    }

    @RequestMapping(path = "/detail/{userId}", method = RequestMethod.GET)
    public String userData(Model model, HttpServletRequest request, @PathVariable Long userId) {
        SystemUser usuario = user(request);
        SystemUser systemUser = restService.systemUser(userId);
        /*
        model.addAttribute("productTypes", restService.productTypes());
        model.addAttribute("areas", restService.areas());
        model.addAttribute("statuses", restService.statuses());
        */
        model.addAttribute("usuarioList",systemUser);
        return "myAccount/account";

    }

    @RequestMapping(path = "/generarD/{userId}", method = RequestMethod.GET)
    public String generarD(Model model, HttpServletRequest request, @PathVariable Long userId) {
        SystemUser usuario = user(request);
        SystemUser systemUser = restService.systemUser(userId);
        /*
        model.addAttribute("productTypes", restService.productTypes());
        model.addAttribute("areas", restService.areas());
        model.addAttribute("statuses", restService.statuses());
        */
        model.addAttribute("usuarioList",systemUser);
        return "myAccount/generaDescuento";

    }
    /*
    @RequestMapping(path = "/generarD/{userId}", method = RequestMethod.GET)
    public String generarD(Model model, HttpServletRequest request, @PathVariable Long ){
        SystemUser usuario = user(request);
        int a = usuario.getPoints();

        return "myAccount/generaDescuento";
    }
    */
    /*
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
    */

/*
    @RequestMapping(path = "/edit/{userId}", method = RequestMethod.GET)
    public String edit(
            Model model,
            HttpServletRequest request,
            @RequestParam("id") Long id,
            @RequestParam("email") String email,
            @RequestParam("firstname") String firstname,
            @RequestParam("lastname") String lastname,
            @RequestParam("password") String password,
            @RequestParam("rut") String rut){
        SystemUser usuario = user(request);
        SystemUser systemUser = restService.systemUser(id);
        systemUser.setEmail(email);
        systemUser.setFirstName(firstname);
        systemUser.setLastName(lastname);
        systemUser.setPassword(password);
        systemUser.setRut(rut);
        systemUser = restService.edit(systemUser);
        return "redirect:/usuario/";
    }
*/
}
