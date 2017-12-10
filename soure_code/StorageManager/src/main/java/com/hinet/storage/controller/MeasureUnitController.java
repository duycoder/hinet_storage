/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.controller;

import com.hinet.storage.constants.UnitTypeConstant;
import com.hinet.storage.dao.MeasureUnitDAO;
import com.hinet.storage.model.MeasureUnit;
import com.hinet.storage.viewmodel.EditMeasureUnitViewModel;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author duynn
 * @create_date 10/12/2017
 */
@Controller
public class MeasureUnitController {

    @Autowired
    private MeasureUnitDAO measureUnitDAO;

    @RequestMapping(value = "/measureUnitManager.html", method = RequestMethod.GET)
    public String measureUnitManager(ModelMap model) {
        List<MeasureUnit> measureUnits = measureUnitDAO.getMeasureUnits();
        model.addAttribute("measureUnits", measureUnits);
        model.addAttribute("unitTypes", UnitTypeConstant.getUnitTypes());
        return "measureUnitManager";
    }
    
    @ResponseBody
    @RequestMapping(value = "/addMeasureUnit.json", method = RequestMethod.POST)
    public boolean addMeasureUnit(@RequestBody MeasureUnit unit){
        boolean result = measureUnitDAO.addMeasureUnit(unit);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value = "/updateMeasureUnit.json", method = RequestMethod.POST)
    public boolean updateMeasureUnit(@RequestBody MeasureUnit unit){
        boolean result = measureUnitDAO.updateMeasureUnit(unit);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value = "/getMeasureUnit.json/{id}", method = RequestMethod.GET)
    public MeasureUnit getMeasureUnitById(@PathVariable("id") int id){
        MeasureUnit unit = measureUnitDAO.getMeasureUnitById(id);
        return unit;
    }
    
    @ResponseBody
    @RequestMapping(value = "/deleteMeasureUnit.json", method = RequestMethod.POST)
    public boolean deleteMeasureUnit(@RequestParam("id") int id){
        boolean result = measureUnitDAO.deleteMeasureUnit(id);
        return result;
    }
}
