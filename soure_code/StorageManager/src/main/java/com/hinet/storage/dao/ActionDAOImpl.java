/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.dao;

import com.hinet.storage.model.Action;
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
 * @author hi
 */
@Repository("actionDAO")
public class ActionDAOImpl extends BaseDAOImpl implements ActionDAO {

    @Override
    public List<Action> getActions() {
        Session session = this.openSession();
        String sql = "from Action as act where act.isDelete != true order by act.id desc";
        Query query = session.createQuery(sql, Action.class);
        List<Action> actions = query.list();
        session.close();
        return actions;
    }

    @Override
    @Transactional
    public boolean addAction(Action action) {
        try {
            action.setDateCreate(new Date());
            action.setDateModify(new Date());
            action.setUserCreate(Integer.SIZE);
            action.setUserModify(Integer.MAX_VALUE);
            action.setIsDelete(false);
            this.openSession().save(action);
            return true;
        } catch (GenericJDBCException ex) {
            return false;
        }
    }

    @Override
    @Transactional
    public boolean updateAction(Action action) {
        Session session = this.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            String sql = "update Action as act set act.actionName = :action_name,"
                    + "act.actionCode = :action_code,"
                    + "act.functionId = :function_id,"
                    + "act.isActive = :is_active "
                    + "where act.id = :id";
            Query query = session.createQuery(sql);
            query.setParameter("action_name", action.getActionName());
            query.setParameter("action_code", action.getActionCode());
            query.setParameter("is_active", action.getIsActive());
            query.setParameter("function_id", action.getFunctionId());
            query.setParameter("id", action.getId());
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
    @Transactional
    public boolean deleteAction(long id) {
        Session session = this.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            String sql = "update Action as act set act.isDelete = true where act.id = :id";
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
    public Action getActionById(long id) {
        Session session = this.openSession();
        Query query = session.createQuery("from Action as act where act.id = :id");
        query.setParameter("id", id);
        query.setMaxResults(1);
        Action action = (Action) query.uniqueResult();
        return action;
    }
}
