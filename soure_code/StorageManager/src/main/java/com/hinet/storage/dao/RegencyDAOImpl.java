/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.dao;

import com.hinet.storage.model.Regency;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author hi
 */
@Repository("regencyDAO")
public class RegencyDAOImpl extends BaseDAOImpl implements RegencyDAO{

    @Transactional(readOnly = true)
    @Override
    public List<Regency> getRegencies() {
        Session session = this.openSession();
        String sql = "from Regency as re where re.isDelete != true";
        Query query = session.createQuery(sql, Regency.class);
        List<Regency> regencies = query.list();
        session.close();
        return regencies;
    }
}
