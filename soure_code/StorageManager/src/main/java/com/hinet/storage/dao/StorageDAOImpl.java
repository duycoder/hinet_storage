/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.dao;

import com.hinet.storage.model.Storage;
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
 * @create_date 11/12/2017
 */
@Repository("storageDAO")
public class StorageDAOImpl extends BaseDAOImpl implements StorageDAO {

    @Override
    public List<Storage> getStorages() {
        Session session = this.openSession();
        String sql = "from Storage as s where s.isDelete != true";
        Query query = session.createQuery(sql, Storage.class);
        List<Storage> storages = query.list();
        session.close();
        return storages;
    }

    @Override
    @Transactional
    public boolean addStorage(Storage storage) {
        try {
            storage.setDateCreate(new Date());
            storage.setDateModify(new Date());
            storage.setUserCreate(Integer.MAX_VALUE);
            storage.setUserModify(Integer.MAX_VALUE);
            storage.setIsDelete(false);
            this.openSession().save(storage);
            return true;
        } catch (GenericJDBCException ex) {
            System.out.println(ex.getCause().toString().toUpperCase());
            return false;
        }
    }

    @Override
    public boolean updateStorage(Storage storage) {
        Session session = this.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        try {
            String sql = "update Storage as s set s.storageCode = :code,"
                    + "s.storageName = :name,"
                    + "s.storageAddress = :address,"
                    + "s.isActive = :isActive "
                    + "where s.id = :id";
            Query query = session.createQuery(sql);
            query.setParameter("code", storage.getStorageCode());
            query.setParameter("name", storage.getStorageName());
            query.setParameter("address", storage.getStorageAddress());
            query.setParameter("isActive", storage.getIsActive());
            query.setParameter("id", storage.getId());
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
    public boolean deleteStorage(int id) {
        Session session = this.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        try {
            String sql = "update Storage as s set s.isDelete = true where s.id = :id";
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
    public Storage getStorageById(int id) {
        Storage storage = this.openSession().find(Storage.class, id);
        return storage;
    }

}
