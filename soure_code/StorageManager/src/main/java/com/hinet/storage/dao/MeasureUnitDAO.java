/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.dao;

import com.hinet.storage.model.MeasureUnit;
import java.util.List;

/**
 *
 * @author hi
 */
public interface MeasureUnitDAO {
    List<MeasureUnit> getMeasureUnits();

    boolean addMeasureUnit(MeasureUnit measureUnit);

    boolean updateMeasureUnit(MeasureUnit measureUnit);

    boolean deleteMeasureUnit(int id);

    MeasureUnit getMeasureUnitById(int id);
}