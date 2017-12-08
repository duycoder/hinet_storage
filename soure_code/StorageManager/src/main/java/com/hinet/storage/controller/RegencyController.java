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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author hi
 */
@Controller
public class RegencyController {
    
    @Autowired
    private RegencyDAO regencyDAO;
    
    
    @RequestMapping(value="/regencyManager.html", method = RequestMethod.GET)
    public String rengencyManager(Model model){
        List<Regency> regencies = regencyDAO.getRegencies();
        model.addAttribute("regencies", regencies);
        return "regency";
    }
}
