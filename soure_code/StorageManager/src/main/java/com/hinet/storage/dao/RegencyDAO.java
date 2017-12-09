/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.dao;

import com.hinet.storage.model.Regency;
import java.util.List;

/**
 *
 * @author duynn
 * @create_date 9/12/2017
 */
public interface RegencyDAO {

    List<Regency> getRegencies();

    boolean addRegency(Regency regency);

    boolean updateRegency(Regency regency);

    boolean deleteRegency(int id);

    Regency getRegencyById(int id);
}
