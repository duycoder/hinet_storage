/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.viewmodel;

import com.hinet.storage.model.MeasureUnit;
import com.hinet.storage.model.ProductCategory;
import java.util.List;

/**
 *
 * @author hi
 */
public class EditProductCategoryViewModel {

    private ProductCategory category;
    private List<MeasureUnit> measureUnits;

    public ProductCategory getCategory() {
        return category;
    }

    public void setCategory(ProductCategory category) {
        this.category = category;
    }

    public List<MeasureUnit> getMeasureUnits() {
        return measureUnits;
    }

    public void setMeasureUnits(List<MeasureUnit> measureUnits) {
        this.measureUnits = measureUnits;
    }

}
