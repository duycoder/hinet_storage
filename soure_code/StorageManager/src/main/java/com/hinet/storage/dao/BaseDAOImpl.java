/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.dao;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

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
}