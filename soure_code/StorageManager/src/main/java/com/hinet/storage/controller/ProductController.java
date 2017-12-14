/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.controller;

import com.hinet.storage.constants.AttachmentTypeConstant;
import com.hinet.storage.constants.CalculateMethodConstant;
import com.hinet.storage.constants.PrefixCodeConstant;
import com.hinet.storage.constants.ProductStatusConstant;
import com.hinet.storage.constants.VatTaxConstant;
import com.hinet.storage.dao.BaseDAO;
import com.hinet.storage.dao.MeasureUnitDAO;
import com.hinet.storage.dao.ProductCategoryDAO;
import com.hinet.storage.dao.ProductDAO;
import com.hinet.storage.model.Product;
import com.hinet.storage.utility.Utilities;
import com.hinet.storage.validator.ProductFormValidator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

;

/**
 *
 * @author duynn
 * @create date: 11/12/2017
 */
@Controller
public class ProductController {

    private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

    @Autowired
    private ProductDAO productDAO;

    @Autowired
    private BaseDAO baseDAO;

    @Autowired
    private ProductCategoryDAO productCategoryDAO;

    @Autowired
    private MeasureUnitDAO measureUnitDAO;

    @Autowired
    @Qualifier("productFormValidator")
    private ProductFormValidator productFormValidator;

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.setValidator(productFormValidator);
    }

    @RequestMapping(value = "/productManager.html", method = RequestMethod.GET)
    public String productManager(ModelMap model) {
        List<Product> products = productDAO.getProducts();
        model.addAttribute("products", products);
        return "productManager";
    }

    @RequestMapping(value = "/addProduct.html", method = RequestMethod.GET)
    public String addProduct(ModelMap model) {
        Product product = new Product();
        product.setProductCode(baseDAO.generateEntityCode(Product.class, PrefixCodeConstant.PRODUCT_PREFIX));
        this.setDataEditProductModel(model, product);
        return "editProduct";
    }

    @RequestMapping(value = "/updateProduct.html", method = RequestMethod.GET)
    public String updateProduct(@RequestParam("id") long id, ModelMap model) {
        Product product = productDAO.getProductById(id);
        this.setDataEditProductModel(model, product);
        return "editProduct";
    }

    @RequestMapping(value = "/saveProduct.html", method = RequestMethod.POST)
    public String saveProduct(
            @ModelAttribute("product") @Validated Product product,
            @RequestParam("attachment") List<MultipartFile> attachment,
            BindingResult bindingResult,
            HttpServletRequest request,
            ModelMap model,
            final RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            this.setDataEditProductModel(model, product);
            return "editProduct";
        }
        boolean result = false;
        if (product.getId() <= 0) {
            result = productDAO.addProduct(product);
        } else {
            result = productDAO.updateProduct(product);
        }
        if (result) {
            Utilities utils = new Utilities();
            utils.uploadFiles(request, attachment, AttachmentTypeConstant.ANH_SANPHAM_LON_IDENTITY, AttachmentTypeConstant.ANH_SANPHAM_LON_TEXT, product.getId());
        }
        redirectAttributes.addFlashAttribute("css", result ? "success" : "danger");
        redirectAttributes.addFlashAttribute("message", result ? "Cập nhật mặt hàng thành công" : "Cập nhật mặt hàng thất bại");
        return "redirect:productManager.html";
    }

    @ResponseBody
    @RequestMapping(value = "/deleteProduct.json", method = RequestMethod.POST)
    public boolean deleteProduct(@RequestParam("id") long id) {
        boolean result = productDAO.deleteProduct(id);
        return result;
    }

    private void setDataEditProductModel(ModelMap model, Product product) {
        model.addAttribute("product", product);
        model.addAttribute("productCategories", productCategoryDAO.getProductCategories());
        model.addAttribute("calculateMethods", CalculateMethodConstant.getCalculateMethods());
        model.addAttribute("measureUnits", measureUnitDAO.getMeasureUnits());
        model.addAttribute("listStatus", ProductStatusConstant.getStatus());
        model.addAttribute("taxes", VatTaxConstant.getTaxes());
        model.addAttribute("actionUrl", "saveProduct.html");
    }
}
