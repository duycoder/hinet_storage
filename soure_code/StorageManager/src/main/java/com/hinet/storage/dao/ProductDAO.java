/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.dao;

import com.hinet.storage.model.Product;
import java.util.List;

/**
 *
 * @author duynn
 * @create_date: 11/12/2017
 */
public interface ProductDAO {

    List<Product> getProducts();

    boolean addProduct(Product product);

    boolean updateProduct(Product product);

    boolean deleteProduct(long id);

    Product getProductById(long id);
    
    Product getProductByProductCode(long id, String productCode);
    
    Product getProductByOfficialName(long id, String officialName);
}
