/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.controller;

import com.hinet.storage.dao.MeasureUnitDAO;
import com.hinet.storage.dao.ProductCategoryDAO;
import com.hinet.storage.model.MeasureUnit;
import com.hinet.storage.model.ProductCategory;
import com.hinet.storage.viewmodel.EditProductCategoryViewModel;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author hi
 */
@Controller
public class ProductCategoryController {

    @Autowired
    private ProductCategoryDAO productCategoryDAO;

    @Autowired
    private MeasureUnitDAO measureUnitDAO;

    @RequestMapping(value = "/productCategoryManager.html", method = RequestMethod.GET)
    public String productCategoryManager(ModelMap model) {
        List<ProductCategory> categories = productCategoryDAO.getProductCategories();
        model.addAttribute("categories", categories);
        return "productCategoryManager";
    }

    @ResponseBody
    @RequestMapping(value = "/addProductCategory.json", method = RequestMethod.POST)
    public boolean addProductCategory(@RequestBody ProductCategory category) {
        boolean result = productCategoryDAO.addProductCategory(category);
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/updateProductCategory.json", method = RequestMethod.POST)
    public boolean updateProductCategory(@RequestBody ProductCategory category) {
        boolean result = productCategoryDAO.updateProductCategory(category);
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/deleteProductCategory.json", method = RequestMethod.POST)
    public boolean deleteProductCategory(@RequestParam("id") int id) {
        boolean result = productCategoryDAO.deleteProductCategory(id);
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/getProductCategoryById.json/{id}", method = RequestMethod.GET)
    public EditProductCategoryViewModel getProductCategoryById(@PathVariable("id") int id) {

        ProductCategory category = productCategoryDAO.getProductCategoryById(id);
        List<MeasureUnit> measureUnits = measureUnitDAO.getMeasureUnits();

        EditProductCategoryViewModel model = new EditProductCategoryViewModel();
        model.setCategory(category);
        model.setMeasureUnits(measureUnits);
        return model;
    }
}
