/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.dao;

import com.hinet.storage.model.Function;
import com.hinet.storage.model.Regency;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author hi
 */
@Repository("functionDAO")
public class FunctionDAOImpl extends BaseDAOImpl implements FunctionDAO {

    @Override
    public List<Function> getFunctions() {
        Session session = this.openSession();
        String sql = "from Function as f where f.isDelete != true order by f.id desc";
        Query query = session.createQuery(sql, Function.class);
        List<Function> functions = query.list();
        session.close();
        return functions;
    }

    @Override
    public boolean addFunction(Function function) {
        try {
            Session session = this.getCurrentSession();
            Transaction transaction = session.beginTransaction();
            function.setIsDelete(false);
            function.setDateCreate(new Date());
            function.setDateModify(new Date());
            function.setUserCreate(Integer.MIN_VALUE);
            function.setUserModify(Integer.MIN_VALUE);
            session.persist(function);
            transaction.commit();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    public boolean updateFunction(Function function) {
        try {
            EntityManager em = this.getEntityManager();
            em.getTransaction().begin();
            String sql = "update Function f set f.function_name = :function_name,"
                    + "f.function_code = :function_code,"
                    + "f.is_active = :is_active where f.ID = :id";
            javax.persistence.Query query = em.createNativeQuery(sql)
                    .setParameter("function_name", function.getFunctionName())
                    .setParameter("function_code", function.getFunctionCode())
                    .setParameter("is_active", function.getIsActive())
                    .setParameter("id", function.getId());
            boolean result = query.executeUpdate() > 0;
            em.getTransaction().commit();
            return result;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    public boolean deleteFunction(int id) {
        try {
            EntityManager em = this.getEntityManager();
            em.getTransaction().begin();
            Function function = em.find(Function.class, id);
            function.setIsDelete(true);
            function.setDateModify(new Date());
            em.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    public Function getFunctionById(int id) {
        Session session = this.openSession();
        String sql = "from Function as f where f.isDelete != true and f.id = :id";
        Query query = session.createQuery(sql);
        query.setParameter("id", id);
        Function function = (Function) query.uniqueResult();
        session.close();
        return function;
    }

}
