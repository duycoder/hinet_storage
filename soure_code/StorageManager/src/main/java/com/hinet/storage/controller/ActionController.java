/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.controller;

import com.hinet.storage.dao.ActionDAO;
import com.hinet.storage.dao.FunctionDAO;
import com.hinet.storage.model.Action;
import com.hinet.storage.model.Function;
import com.hinet.storage.viewmodel.EditActionViewModel;
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
 * @created_date 10/12/2017
 */
@Controller
public class ActionController {
    
    @Autowired
    private ActionDAO actionDAO;
    
    @Autowired
    private FunctionDAO functionDAO;
    
    @RequestMapping(value = "/actionManager.html", method = RequestMethod.GET)
    public String actionManager(ModelMap model){
        List<Action> actions = actionDAO.getActions();
        model.addAttribute("actions", actions);
        return "actionManager";
    }
    
    @ResponseBody
    @RequestMapping(value = "/addAction.json", method = RequestMethod.POST)
    public boolean addAction(@RequestBody Action action){
        boolean result = actionDAO.addAction(action);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value = "/updateAction.json", method = RequestMethod.POST)
    public boolean updateAction(@RequestBody Action action){
        boolean result = actionDAO.updateAction(action);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value = "/getAction.json/{id}", method = RequestMethod.GET)
    public EditActionViewModel getAction(@PathVariable("id") long id){
        EditActionViewModel model = new EditActionViewModel();
        Action action = actionDAO.getActionById(id);
        List<Function> functions = functionDAO.getFunctions();
        
        model.setAction(action);
        model.setFunctions(functions);
        return model;
    }
    
    
    @ResponseBody
    @RequestMapping(value = "/deleteAction.json", method = RequestMethod.POST)
    public boolean deleteAction(@RequestParam("id") long id){
        boolean result = actionDAO.deleteAction(id);
        return result;
    }
}
