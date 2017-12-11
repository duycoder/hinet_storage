/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.controller;

import com.hinet.storage.constants.CalculateMethodConstant;
import com.hinet.storage.constants.ProductStatusConstant;
import com.hinet.storage.constants.VatTaxConstant;
import com.hinet.storage.dao.MeasureUnitDAO;
import com.hinet.storage.dao.ProductDAO;
import com.hinet.storage.model.Product;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author duynn
 * @create date: 11/12/2017
 */
@Controller
public class ProductController {
    @Autowired
    private ProductDAO productDAO;
    
    @Autowired
    private MeasureUnitDAO measureUnitDAO;
    
    @RequestMapping(value = "/productManager.html", method = RequestMethod.GET)
    public String productManager(ModelMap model){
        List<Product> products = productDAO.getProducts();
        model.addAttribute("products", products);
        return "productManager";
    }
    
    @RequestMapping(value = "/addProduct.html", method = RequestMethod.GET)
    public String addProduct(ModelMap model){
        Product product = new Product();
        model.addAttribute("product", product);
        model.addAttribute("calculateMethods", CalculateMethodConstant.getCalculateMethods());
        model.addAttribute("measureUnits", measureUnitDAO.getMeasureUnits());
        model.addAttribute("listStatus", ProductStatusConstant.getStatus());
        model.addAttribute("taxes", VatTaxConstant.getTaxes());
        model.addAttribute("actionUrl", "saveProduct.html");
        return "editProduct";
    }
    
    @RequestMapping(value = "/saveProduct.html", method = RequestMethod.POST)
    public String saveProduct(@ModelAttribute("product") Product product, HttpServletRequest request ){
        boolean saveResult = false;
        if(product.getId() <= 0){
            saveResult = productDAO.addProduct(product); 
        }else{
            saveResult = productDAO.updateProduct(product);
        }
        return "redirect:productManager.html";
    }
}
