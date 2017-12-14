/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.dao;

import com.google.common.base.Strings;
import com.hinet.storage.model.Product;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.exception.GenericJDBCException;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author duynn
 * @create_date: 11/12/2017
 */
@Repository("productDAO")
public class ProductDAOImpl extends BaseDAOImpl implements ProductDAO {

    @Override
    public List<Product> getProducts() {
        Session session = this.openSession();
        String sql = "from Product as p where p.isDelete != true";
        Query query = session.createQuery(sql, Product.class);
        List<Product> products = query.list();
        session.close();
        return products;
    }

    @Override
    @Transactional
    public boolean addProduct(Product product) {
        return this.insertEntity(product);
    }

    @Override
    @Transactional
    public boolean updateProduct(Product product) {
        Product oldProduct = this.getById(Product.class, product.getId());
        product.setIsDelete(oldProduct.getIsDelete());
        product.setUserCreate(oldProduct.getUserCreate());
        return this.updateEntity(product);
    }

    @Override
    public boolean deleteProduct(long id) {
        Session session = this.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        try {
            String sql = "update Product as p set p.isDelete = true where p.id = :id";
            Query query = session.createQuery(sql);
            query.setParameter("id", id);
            boolean result = query.executeUpdate() > 0;
            transaction.commit();
            return result;
        } catch (Exception ex) {
            transaction.rollback();
            System.out.println(ex.getCause().toString().toUpperCase());
            return false;
        }
    }

    @Override
    public Product getProductById(long id) {
        return this.getById(Product.class, id);
    }

    @Override
    public Product getProductByProductCode(long id, String productCode) {
        Session session = this.openSession();
        String sql = "from Product as p where p.productCode = :product_code";
        if (id > 0) {
            sql += " and p.id != :id";
        }
        Query query = session.createQuery(sql, Product.class);
        query.setParameter("product_code", productCode);
        if (id > 0) {
            query.setParameter("id", id);
        }
        query.setMaxResults(1);
        Product product = (Product) query.uniqueResult();
        session.close();
        return product;
    }

    @Override
    public Product getProductByOfficialName(long id, String officialName) {
        Session session = this.openSession();
        String sql = "from Product as p where p.officialName = :official_name";
        if (id > 0) {
            sql += " and p.id != :id";
        }
        Query query = session.createQuery(sql, Product.class);
        query.setParameter("official_name", officialName);
        if (id > 0) {
            query.setParameter("id", id);
        }
        query.setMaxResults(1);
        Product product = (Product) query.uniqueResult();
        session.close();
        return product;
    }
}
