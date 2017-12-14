/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.dao;

import com.hinet.storage.model.MeasureUnit;
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
 * @create_date: 10/12/2017
 */
@Repository("measureUnitDAO")
public class MeasureUnitDAOImpl extends BaseDAOImpl implements MeasureUnitDAO {

    @Override
    public List<MeasureUnit> getMeasureUnits() {
       return this.getEntities(MeasureUnit.class);
    }

    @Override
    @Transactional
    public boolean addMeasureUnit(MeasureUnit measureUnit) {
        try {
            Session session = this.openSession();
            measureUnit.setDateCreate(new Date());
            measureUnit.setDateModify(new Date());
            measureUnit.setUserCreate(Integer.MAX_VALUE);
            measureUnit.setUserModify(Integer.MAX_VALUE);
            measureUnit.setIsDelete(false);
            session.save(measureUnit);
            session.close();
            return true;
        } catch (GenericJDBCException ex) {
            System.out.println(ex.getCause().toString().toUpperCase());
            return false;
        }
    }

    @Override
    public boolean updateMeasureUnit(MeasureUnit unit) {
        Session session = this.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        try {
            String sql = "update MeasureUnit as m set m.measureUnitCode = :code,"
                    + "m.engName = :eng_name,"
                    + "m.vnName = :vn_name,"
                    + "m.unitTypeId = :unit_type_id "
                    + "where m.id =:id";
            Query query = session.createQuery(sql)
                    .setParameter("code", unit.getMeasureUnitCode())
                    .setParameter("eng_name", unit.getEngName())
                    .setParameter("vn_name", unit.getVnName())
                    .setParameter("unit_type_id", unit.getUnitTypeId())
                    .setParameter("id", unit.getId());
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
    public boolean deleteMeasureUnit(int id) {
        Session session = this.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        try {
            String sql = "update MeasureUnit as m set m.isDelete = true where m.id = :id";
            Query query = session.createQuery(sql)
                    .setParameter("id", id);
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
    public MeasureUnit getMeasureUnitById(int id) {
        Session session = this.openSession();
        String sql = "from MeasureUnit as m where m.isDelete !=true and m.id = :id";
        Query query = session.createQuery(sql)
                .setParameter("id", id);
        query.setMaxResults(1);
        MeasureUnit unit = (MeasureUnit) query.uniqueResult();
        session.close();
        return unit;
    }

}
