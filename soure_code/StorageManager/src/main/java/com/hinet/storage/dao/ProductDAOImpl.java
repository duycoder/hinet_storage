/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.dao;

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
        try {
            Session session = this.openSession();
            product.setDateCreate(new Date());
            product.setDateModify(new Date());
            product.setUserCreate(Integer.MAX_VALUE);
            product.setUserModify(Integer.MAX_VALUE);
            product.setIsDelete(false);
            session.save(product);
            session.close();
            return true;
        } catch (GenericJDBCException ex) {
            System.out.println(ex.getCause().toString().toUpperCase());
            return false;
        }
    }

    @Override
    public boolean updateProduct(Product product) {
        Session session = this.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.merge(product);
            transaction.commit();
            return true;
        } catch (Exception ex) {
            transaction.rollback();
            System.out.println(ex.getCause().toString().toUpperCase());
            return false;
        }
    }

    @Override
    public boolean deleteProduct(long id) {
        Session session = this.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        try {
            String sql = "update Product as p set p.isDelete = true where p.id = :id";
            Query query = session.createQuery(sql);
            query.setParameter("id", id);
            transaction.commit();
            return true;
        } catch (Exception ex) {
            transaction.rollback();
            System.out.println(ex.getCause().toString().toUpperCase());
            return false;
        }
    }

    @Override
    public Product getProductById(long id) {
        Session session = this.openSession();
        Product product = session.find(Product.class, id);
        return product;
    }
}
