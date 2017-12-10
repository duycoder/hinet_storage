/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.dao;

import com.hinet.storage.model.ProductCategory;
import java.util.List;

/**
 *
 * @author duynn
 * @created_date 10/12/2017
 */
public interface ProductCategoryDAO {

    List<ProductCategory> getProductCategories();

    boolean addProductCategory(ProductCategory action);

    boolean updateProductCategory(ProductCategory action);

    boolean deleteProductCategory(int id);

    ProductCategory getProductCategoryById(int id);
}
