/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.dao;

import com.google.common.base.Strings;
import java.io.Serializable;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.exception.GenericJDBCException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author duynn
 * @create_date 9/12/2017
 */
@Repository("baseDAO")
public class BaseDAOImpl implements BaseDAO {

    @Autowired
    SessionFactory sessionFactory;

    @Autowired
    @Qualifier("entityManagerFactory")
    private EntityManagerFactory entityManagerFactory;

    public EntityManager getEntityManager() {
        return entityManagerFactory.createEntityManager();
    }

    @SuppressWarnings("unchecked")
    @Override
    public <T> List<T> getAll(Class<T> tClass) {
        return this.openSession().createQuery("from " + tClass.getName()).list();
    }

    protected final Session openSession() {
        return sessionFactory.openSession();
    }

    protected final Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public <T> void Save(T tClass) throws DataAccessException {
        getCurrentSession().saveOrUpdate(tClass);
    }

    @Override
    public <T> void delete(T tClass) throws DataAccessException {
        getCurrentSession().delete(tClass);
    }

    /**
     * Retrieve an object that was previously persisted to the database using
     * the indicated id as primary key
     *
     * @param <T>
     */
    @SuppressWarnings("unchecked")
    @Override
    public <T> T findByPrimaryKey(Class<T> tClass, Serializable id) {
        return (T) getCurrentSession().get(tClass, id);
    }

    @SuppressWarnings("unchecked")
    @Override
    public <T> List<T> GetListByNamedQuery(String query, Object... params) {
        Query q = getCurrentSession().getNamedQuery(query);

        int i = 1;
        String arg = "arg";
        if (params != null) {
            for (Object o : params) {
                if (o != null) {
                    q.setParameter(arg + i, o);
                    i++;
                }
            }
        }

        List<T> list = (List<T>) q.list();
        return list;
    }

    @SuppressWarnings("unchecked")
    @Override
    public <T> T GetUniqueEntityByNamedQuery(String query, Object... params) {

        Query q = getCurrentSession().getNamedQuery(query);

        int i = 1;
        String arg = "arg";
        for (Object o : params) {
            q.setParameter(arg + i, o);
            i++;
        }

        List<T> results = q.list();

        T foundentity = null;
        if (!results.isEmpty()) {
            // ignores multiple results
            foundentity = results.get(0);
        }
        return foundentity;
    }

    @Override
    public <T> Long getQueryCount(String query, Object... params) {

        Query q = getCurrentSession().getNamedQuery(query);
        int i = 1;
        String arg = "arg";
        Long count = (long) 0;

        if (params != null) {
            for (Object o : params) {
                if (o != null) {
                    q.setParameter(arg + i, o);
                    i++;
                }
            }
        }
        count = (Long) q.uniqueResult();
        return count;
    }

    @Override
    @Transactional
    public <T> boolean insertEntity(T entity) {
        Session session = this.openSession();
        boolean result = true;
        try {
            Class<?> entityClass = entity.getClass();
            Field dateCreateField = entityClass.getDeclaredField("dateCreate");
            Field dateModifyField = entityClass.getDeclaredField("dateModify");
            Field isDeleteField = entityClass.getDeclaredField("isDelete");

            if (dateCreateField != null) {
                dateCreateField.setAccessible(true);
                dateCreateField.set(entity, new Date());
            }
            if (dateModifyField != null) {
                dateModifyField.setAccessible(true);
                dateModifyField.set(entity, new Date());
            }
            if (isDeleteField != null) {
                isDeleteField.setAccessible(true);
                isDeleteField.set(entity, false);
            }
            session.save(entity);
            session.close();
        } catch (NoSuchFieldException ex) {
            Logger.getLogger(BaseDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SecurityException ex) {
            Logger.getLogger(BaseDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalArgumentException ex) {
            Logger.getLogger(BaseDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(BaseDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (GenericJDBCException ex) {
            Logger.getLogger(BaseDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            result = false;
        }
        return result;
    }

    @Override
    @Transactional
    public <T> boolean updateEntity(T entity){
        Session session = this.openSession();
        Transaction transaction = session.beginTransaction();
        boolean result = true;
        try {
            Class<?> entityClass = entity.getClass();
            Field dateModifyField = entityClass.getDeclaredField("dateModify");

            if (dateModifyField != null) {
                dateModifyField.setAccessible(true);
                dateModifyField.set(entity, new Date());
            }
            session.update(entity);
            transaction.commit();
            session.close();
        } catch (NoSuchFieldException ex) {
            Logger.getLogger(BaseDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SecurityException ex) {
            Logger.getLogger(BaseDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalArgumentException ex) {
            Logger.getLogger(BaseDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(BaseDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (GenericJDBCException ex) {
            Logger.getLogger(BaseDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            result = false;
        }
        return result;
    }
    
    @Override
    public <T> List<T> getEntities(Class<T> entityClass) {
        Session session = this.openSession();
        String sql = "from " + entityClass.getName() + " as e";
        try {
            if (entityClass.getDeclaredField("isDelete") != null) {
                sql += " where e.isDelete != true ";
            }
        } catch (NoSuchFieldException ex) {
            Logger.getLogger(BaseDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SecurityException ex) {
            Logger.getLogger(BaseDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        sql += " order by e.id desc";

        org.hibernate.query.Query query = session.createQuery(sql);
        List<T> result = query.list();
        session.close();
        return result;
    }

    @Override
    public <T> String generateEntityCode(Class<T> entityClass, String prefix) {
        String code = "";
        if (Strings.isNullOrEmpty(prefix) == false) {
            Session session = this.openSession();
            org.hibernate.query.Query query = session.createQuery("from " + entityClass.getName() + " as e order by e.id desc", entityClass);
            query.setMaxResults(1);
            T entity = (T) query.uniqueResult();
            long serialNumber = 1;
            if (entity != null) {
                Serializable id = session.getIdentifier(entity);
                serialNumber += (long)id;
            }
            code = prefix.toUpperCase() + "-" + String.format("%010d", serialNumber);
            session.close();
        }
        return code;
    }

    @Override
    public <T> T getById(Class<T> entityClass, Serializable id) {
        Session session = this.openSession();
        T entity = session.find(entityClass, id);
        session.close();
        return entity;
    }
}
