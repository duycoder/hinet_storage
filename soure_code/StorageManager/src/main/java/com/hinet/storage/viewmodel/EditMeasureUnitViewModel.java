/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.viewmodel;

import com.hinet.storage.model.MeasureUnit;
import java.util.Map;

/**
 *
 * @author duynn
 * @create_date 10/12/2017
 */
public class EditMeasureUnitViewModel {

    private MeasureUnit measureUnit;
    private Map<Integer, String> unitTypes;

    public MeasureUnit getMeasureUnit() {
        return measureUnit;
    }

    public void setMeasureUnit(MeasureUnit measureUnit) {
        this.measureUnit = measureUnit;
    }

    public Map<Integer, String> getUnitTypes() {
        return unitTypes;
    }

    public void setUnitTypes(Map<Integer, String> unitTypes) {
        this.unitTypes = unitTypes;
    }

}
