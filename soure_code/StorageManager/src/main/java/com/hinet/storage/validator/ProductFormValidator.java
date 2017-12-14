/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.validator;

import com.google.common.base.Strings;
import com.hinet.storage.dao.ProductDAO;
import com.hinet.storage.model.Product;
import java.math.BigDecimal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author duynn
 * @create_date 12/12/2017
 */
@Component
public class ProductFormValidator implements Validator {

    @Autowired
    private ProductDAO productDAO;

    @Override
    public boolean supports(Class<?> clazz) {
        return Product.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Product product = (Product) target;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "productCode", "NotEmpty.productForm.productCode");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "officialName", "NotEmpty.productForm.officialName");

        if (Strings.isNullOrEmpty(product.getProductCode()) == false) {
            if (product.getProductCode().trim().length() > 50) {
                errors.rejectValue("productCode", "MaxLength.productForm.productCode");
            } else if (productDAO.getProductByProductCode(product.getId(), product.getProductCode()) != null) {
                errors.rejectValue("productCode", "Duplicate.productForm.productCode");
            }
        }

        if (Strings.isNullOrEmpty(product.getOfficialName()) == false) {
            if (product.getOfficialName().trim().length() > 150) {
                errors.rejectValue("officialName", "MaxLength.productForm.officialName");
            } else if (productDAO.getProductByOfficialName(product.getId(), product.getOfficialName()) != null) {
                errors.rejectValue("officialName", "Duplicate.productForm.officialName");
            }
        }

        if (Strings.isNullOrEmpty(product.getOtherName()) == false && product.getOtherName().trim().length() > 150) {
            errors.rejectValue("otherName", "MaxLength.productForm.otherName");
        }
        if (Strings.isNullOrEmpty(product.getOrigin()) == false && product.getOrigin().trim().length() > 400) {
            errors.rejectValue("origin", "MaxLength.productForm.origin");
        }

        if (Strings.isNullOrEmpty(product.getManufacturer()) == false && product.getManufacturer().trim().length() > 200) {
            errors.rejectValue("manufacturer", "MaxLength.productForm.manufacturer");
        }

        if (product.getProductCategoryId() == null) {
            errors.rejectValue("productCategoryId", "NotNull.productForm.productCategoryId");
        }
        if (product.getCalculateMethodId() == null) {
            errors.rejectValue("calculateMethodId", "NotNull.productForm.calculateMethodId");
        }
        if (product.getPrice() == null) {
            errors.rejectValue("price", "NotNull.productForm.price");
        } else if (product.getPrice().compareTo(BigDecimal.ZERO) < 0) {
            errors.rejectValue("price", "Negative.productForm.price");
        }
        if (product.getSafeInventoryQuantity() != null && product.getSafeInventoryQuantity() < 0) {
            errors.rejectValue("safeInventoryQuantity", "Negative.productForm.safeInventoryQuantity");
        }
        if (product.getMeasureUnitId() == null) {
            errors.rejectValue("measureUnitId", "NotNull.productForm.measureUnitId");
        }

        if (product.getTariffTaxId() != null && product.getTariffTaxId() < 0) {
            errors.rejectValue("tariffTaxId", "Negative.productForm.tariffTaxId");
        }
    }

}
