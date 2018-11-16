package com.mis_ofertas.app.controller;
import com.mis_ofertas.app.model.ProductType;
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
@RequestMapping("/typeProd")
public class TypeProductController extends MainController {

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public String home(Model model, HttpServletRequest request) {
        SystemUser usuario = user(request);

        List<ProductType> productTypes = restService.productTypes();
        model.addAttribute("textSearch", "");
        model.addAttribute("productTypes", productTypes);
        return "tipoProducto/productoT";
    }

    @RequestMapping(path = "/filter", method = RequestMethod.POST)
    public String filter(Model model,
                         HttpServletRequest request,
                         @RequestParam("textSearch") String textSearch) {
        SystemUser usuario = user(request);

        List<ProductType> productTypes = restService.productTypes(textSearch);
        model.addAttribute("textSearch", textSearch);
        model.addAttribute("productTypes", productTypes);
        return "tipoProducto/productoT";
    }


    @RequestMapping(path = "/create", method = RequestMethod.GET)
    public String create(Model model, HttpServletRequest request) {
        SystemUser usuario = user(request);

        return "tipoProducto/agregarT";
    }
    @RequestMapping(path = "/create", method = RequestMethod.POST)
    public String create(
            Model model,
            HttpServletRequest request,
            @RequestParam("description") String description,
            @RequestParam("name") String name){
                SystemUser usuario = user(request);
                ProductType typeProd = new ProductType();
                typeProd.setDescription(description);
                typeProd.setName(name);
                typeProd = restService.create(typeProd);
                return "redirect:/typeProd/";
    }

    @RequestMapping(path = "/edit", method = RequestMethod.POST)
    public String edit(
            Model model,
            HttpServletRequest request,
            @RequestParam("id") Long id,
            @RequestParam("description") String description,
            @RequestParam("name") String name){
        SystemUser usuario = user(request);
        ProductType typeProd = restService.productType(id);
        typeProd.setDescription(description);
        typeProd.setName(name);
        typeProd = restService.edit(typeProd);
        return "redirect:/typeProd/";
    }

    @RequestMapping(path = "/edit/{productoTipoId}", method = RequestMethod.GET)
    public String edit(Model model, HttpServletRequest request, @PathVariable Long productoTipoId) {
        SystemUser usuario = user(request);
        ProductType typeProd = restService.productType(productoTipoId);
        /*
        model.addAttribute("productTypes", restService.productTypes());
        model.addAttribute("areas", restService.areas());
        model.addAttribute("statuses", restService.statuses());
        */
        model.addAttribute("productoTipo",typeProd);
        return "tipoProducto/editarT";

    }

}
