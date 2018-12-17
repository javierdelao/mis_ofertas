package com.mis_ofertas.app.controller;

import com.mis_ofertas.app.model.Area;
import com.mis_ofertas.app.model.SystemUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/typeCat")
public class CategoryController extends MainController {

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public String home(Model model, HttpServletRequest request) {
        if (!hasAccess(request)) {
            return "login";
        }
        if (!hasAccess(request, "ADMIN")) {
            return "redirect:/";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);

        List<Area> areas = restService.areas();
        model.addAttribute("textSearch", "");
        model.addAttribute("areas", areas);


        return "tipoCategoria/categoria";
    }

    @RequestMapping(path = "/filter", method = RequestMethod.POST)
    public String filter(Model model,
                         HttpServletRequest request,
                         @RequestParam("textSearch") String textSearch) {
        if (!hasAccess(request)) {
            return "login";
        }
        if (!hasAccess(request, "ADMIN")) {
            return "redirect:/";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);

        List<Area> areas = restService.areas(textSearch);
        model.addAttribute("textSearch", textSearch);
        model.addAttribute("areas", areas);
        return "tipoCategoria/categoria";
    }


    @RequestMapping(path = "/create", method = RequestMethod.GET)
    public String create(Model model, HttpServletRequest request) {
        if (!hasAccess(request)) {
            return "login";
        }
        if (!hasAccess(request, "ADMIN")) {
            return "redirect:/";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);

        return "tipoCategoria/agregarCat";
    }

    @RequestMapping(path = "/create", method = RequestMethod.POST)
    public String create(
            Model model,
            HttpServletRequest request,
            @RequestParam("description") String description,
            @RequestParam("name") String name) {
        if (!hasAccess(request)) {
            return "login";
        }
        if (!hasAccess(request, "ADMIN")) {
            return "redirect:/";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);
        Area typeCat = new Area();
        typeCat.setDescription(description);
        typeCat.setName(name);
        typeCat = restService.create(typeCat);
        return "redirect:/typeCat/";
    }

    @RequestMapping(path = "/edit", method = RequestMethod.POST)
    public String edit(
            Model model,
            HttpServletRequest request,
            @RequestParam("id") Long id,
            @RequestParam("description") String description,
            @RequestParam("name") String name) {
        if (!hasAccess(request)) {
            return "login";
        }
        if (!hasAccess(request, "ADMIN")) {
            return "redirect:/";
        }
        if (!hasAccess(request)) {
            return "redirect:/";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);
        Area typeCat = restService.area(id);
        typeCat.setDescription(description);
        typeCat.setName(name);
        typeCat = restService.edit(typeCat);
        return "redirect:/typeCat/";
    }

    @RequestMapping(path = "/edit/{areaId}", method = RequestMethod.GET)
    public String edit(Model model, HttpServletRequest request, @PathVariable Long areaId) {
        if (!hasAccess(request)) {
            return "login";
        }
        if (!hasAccess(request, "ADMIN")) {
            return "redirect:/";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);
        Area area = restService.area(areaId);

        model.addAttribute("area", area);
        return "tipoCategoria/editarCat";

    }

}
