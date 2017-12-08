/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.dao;

import com.hinet.storage.model.Regency;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author duynn
 * @create_date 9/12/2017
 */
@Repository("regencyDAO")
public class RegencyDAOImpl extends BaseDAOImpl implements RegencyDAO {

    @Override
    public List<Regency> getRegencies() {
        Session session = this.openSession();
        String sql = "from Regency as re where re.isDelete != true";
        Query query = session.createQuery(sql, Regency.class);
        List<Regency> regencies = query.list();
        session.close();
        return regencies;
    }

    @Override
    public boolean addRegency(Regency regency) {
        try {
            Session session = this.getCurrentSession();
            Transaction transaction = session.beginTransaction();
            regency.setIsDelete(false);
            regency.setDateCreate(new Date());
            regency.setDateModify(new Date());
            regency.setUserCreate(Integer.MIN_VALUE);
            regency.setUserModify(Integer.MIN_VALUE);
            session.persist(regency);
            transaction.commit();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    public Regency getRegencyById(int id) {
        Session session = this.openSession();
        String sql = "from Regency as re where re.isDelete != true and re.id = :id";
        Query query = session.createQuery(sql);
        query.setParameter("id", id);
        Regency regency = (Regency) query.uniqueResult();
        session.close();
        return regency;
    }

    @Override
    public boolean updateRegency(Regency regency) {
        try {
            EntityManager em = this.getEntityManager();
            em.getTransaction().begin();
            String sql = "update Regency re set re.RegencyCode = :regencyCode,"
                    + "re.RegencyName =:regencyName where re.id = :id";
            javax.persistence.Query query = em.createNativeQuery(sql)
                    .setParameter("regencyCode", regency.getRegencyCode())
                    .setParameter("regencyName", regency.getRegencyName())
                    .setParameter("id", regency.getId());
            boolean result = query.executeUpdate() > 0;
            em.getTransaction().commit();
            return result;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    public boolean deleteRegency(int id) {
        try {
            EntityManager em = this.getEntityManager();
            em.getTransaction().begin();
            Regency regency = em.find(Regency.class, id);
            regency.setIsDelete(true);
            regency.setDateModify(new Date());
            em.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
}
