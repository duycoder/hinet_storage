/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.dao;

import com.hinet.storage.model.ProductCategory;
import java.util.ArrayList;
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
 * @created_date 10/12/2017
 */
@Repository("productCategoryDAO")
public class ProductCategoryDAOImpl extends BaseDAOImpl implements ProductCategoryDAO {

    @Override
    public List<ProductCategory> getProductCategories() {
        return this.getEntities(ProductCategory.class);
    }

    @Override
    @Transactional
    public boolean addProductCategory(ProductCategory category) {
        try {
            category.setDateCreate(new Date());
            category.setDateModify(new Date());
            category.setUserCreate(Integer.MAX_VALUE);
            category.setUserModify(Integer.MAX_VALUE);
            category.setIsDelete(false);
            this.openSession().save(category);
            return true;
        } catch (GenericJDBCException ex) {
            System.out.println(ex.getCause().toString().toUpperCase());
            return false;
        }
    }

    @Override
    public boolean updateProductCategory(ProductCategory category) {
        Session session = this.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        try {
            String sql = "update ProductCategory as p set p.productCategoryCode = :code,"
                    + "p.productCategoryName = :name,"
                    + "p.isActive = :is_active,"
                    + "p.measureUnitId = :unitId "
                    + "where p.id =:id";
            Query query = session.createQuery(sql);
            query.setParameter("code", category.getProductCategoryCode());
            query.setParameter("name", category.getProductCategoryName());
            query.setParameter("is_active", category.getIsActive());
            query.setParameter("unitId", category.getMeasureUnitId());
            query.setParameter("id", category.getId());
            boolean result = query.executeUpdate() > 0;
            transaction.commit();
            return result;
        } catch (GenericJDBCException ex) {
            transaction.rollback();
            System.out.println(ex.getCause().toString().toUpperCase());
            return false;
        }
    }

    @Override
    public boolean deleteProductCategory(int id) {
        Session session = this.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        try {
            String sql = "update ProductCategory as p set p.isDelete = true where p.id = :id";
            Query query = session.createQuery(sql);
            query.setParameter("id", id);
            boolean result = query.executeUpdate() > 0;
            transaction.commit();
            return result;
        } catch (GenericJDBCException ex) {
            transaction.rollback();
            System.out.println(ex.getCause().toString().toUpperCase());
            return false;
        }
    }

    @Override
    public ProductCategory getProductCategoryById(int id) {
        ProductCategory category;
        try (Session session = this.openSession()) {
            category = session.find(ProductCategory.class, id);
        }
        return category;
    }

}
