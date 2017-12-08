/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.controller;

import com.hinet.storage.dao.RegencyDAO;
import com.hinet.storage.model.Regency;
import java.util.List;
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
 * @create_date 9/12/2017
 */
@Controller
public class RegencyController {

    @Autowired
    private RegencyDAO regencyDAO;

    /**
     * @author duynn
     * @create_date 9/12/2017
     * @param model
     * @return 
     */
    @RequestMapping(value = "/regencyManager.html", method = RequestMethod.GET)
    public String rengencyManager(ModelMap model) {
        List<Regency> regencies = regencyDAO.getRegencies();
        model.addAttribute("regencies", regencies);
        return "regency";
    }

    /**
     * @author duynn
     * @create_date 9/12/2017
     * @param regency
     * @return 
     */
    @ResponseBody
    @RequestMapping(value = "/addRegency.json", method = RequestMethod.POST)
    public boolean addRegency(@RequestBody Regency regency) {
        boolean result = regencyDAO.addRegency(regency);
        return result;
    }

    /**
     * @author duynn
     * @create_date 9/12/2017
     * @param id
     * @return 
     */
    @ResponseBody
    @RequestMapping(value = "/getRegency.json/{id}", method = RequestMethod.GET)
    public Regency getRegency(@PathVariable("id") int id) {
        Regency regency = regencyDAO.getRegencyById(id);
        return regency;
    }

    /**
     * @author duynn
     * @create_date 9/12/2017
     * @param regency
     * @return 
     */
    @ResponseBody
    @RequestMapping(value = "/updateRegency.json", method = RequestMethod.POST)
    public boolean updateRegency(@RequestBody Regency regency) {
        boolean result = regencyDAO.updateRegency(regency);
        return result;
    }
    
    /**
     * @author duynn
     * @create_date 9/12/2017
     * @param id
     * @return 
     */
    @ResponseBody
    @RequestMapping(value = "/deleteRegency.json", method = RequestMethod.POST)
    public boolean deleteRegency(@RequestParam("id") int id){
        boolean result = regencyDAO.deleteRegency(id);
        return result;
    }
}
