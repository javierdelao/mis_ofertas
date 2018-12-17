/*
 * Copyright (c) 2017 Business News Americas Limitada - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 */

package com.mis_ofertas.app.controller;

import com.cloudinary.Cloudinary;
import com.mis_ofertas.app.model.*;
import com.mis_ofertas.app.util.ProductValorationAverage;
import com.mis_ofertas.app.util.VisitReport;
import org.cloudinary.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.util.*;


@Controller
@RequestMapping("/report")
public class ReportController extends MainController {


    @RequestMapping(path = "/", method = RequestMethod.GET)
    public String home(Model model, HttpServletRequest request) {
        if(!hasAccess(request)){
            return "login";
        }
        if (!hasAccess(request,"ADMIN")) {
            return "redirect:/home";
        }
        SystemUser usuario = user(request);
        model.addAttribute("user", usuario);        List<Product> products = restService.products(usuario, true, null, null, null, null);
        List<VisitReport> visitReports = new ArrayList<>();
        Integer contadorProductosMasVisitados = 0;
        for (Product product : products) {
            VisitReport visitReport = new VisitReport();
            visitReport.setProduct(product);
            visitReport.setVisitQta(restService.qta(product));
            contadorProductosMasVisitados = contadorProductosMasVisitados + visitReport.getVisitQta();
            visitReports.add(visitReport);
        }
        List<ProductValorationAverage> productValorationAveragesAsc = new ArrayList<>();
        List<ProductValorationAverage> productValorationAveragesDesc = new ArrayList<>();
        for (Product product : products) {
            ProductValorationAverage productValorationAverage = new ProductValorationAverage();
            productValorationAverage.setProduct(product);
            productValorationAverage.setAverageValorationProduct(restService.productAverage(product));
            productValorationAveragesDesc.add(productValorationAverage);
            productValorationAveragesAsc.add(productValorationAverage);
        }
        Collections.sort(productValorationAveragesDesc, new Comparator<ProductValorationAverage>() {
            @Override
            public int compare(ProductValorationAverage z1, ProductValorationAverage z2) {
                if (z1.getAverageValorationProduct() > z2.getAverageValorationProduct())
                    return 1;
                if (z1.getAverageValorationProduct() < z2.getAverageValorationProduct())
                    return -1;
                return 0;
            }
        });
        Collections.sort(productValorationAveragesAsc, new Comparator<ProductValorationAverage>() {
            @Override
            public int compare(ProductValorationAverage z1, ProductValorationAverage z2) {
                if (z1.getAverageValorationProduct() > z2.getAverageValorationProduct())
                    return 1;
                if (z1.getAverageValorationProduct() < z2.getAverageValorationProduct())
                    return -1;
                return 0;
            }
        });
        Collections.reverse(productValorationAveragesAsc);
        model.addAttribute("productValorationAveragesDesc", productValorationAveragesDesc);

        model.addAttribute("productValorationAveragesAsc", productValorationAveragesAsc);

        model.addAttribute("visitProductResport", visitReports);
        model.addAttribute("contadorProductosMasVisitados", contadorProductosMasVisitados);
        return "reporte/reportes";
    }


    @RequestMapping(method = RequestMethod.GET,
            path = "testtxt")
    public void export(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        if(!hasAccess(request)){
            return ;
        }
        if (!hasAccess(request,"ADMIN")) {
            return ;
        }
        SystemUser usuario = user(request);
        List<Product> products = restService.products(usuario, false, null, null, null, null);
        String myString = "";
        for (Product product : products) {
            myString = myString + product.getId() + ";" +
                    product.getName() + ";" +
                    product.getDescription() + ";" +
                    product.getPublicationDate() + ";" +
                    product.getExpirationDate() + ";" +
                    product.getImage() + ";" +
                    product.getPrice() + ";" +
                    product.getArea().getId() + ";" +
                    product.getProductType().getId() + ";" +
                    product.getIs_perishable() + ";" +
                    product.getUser().getId() + "; \n";
        }
        response.setContentType("text/plain");
        response.setHeader("Content-Disposition", "attachment;filename=myFile.txt");
        ServletOutputStream out = response.getOutputStream();
        out.println(myString);
        out.flush();
        out.close();
    }


}