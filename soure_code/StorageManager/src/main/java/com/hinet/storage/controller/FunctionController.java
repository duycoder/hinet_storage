/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.controller;

import com.hinet.storage.dao.FunctionDAO;
import com.hinet.storage.model.Function;
import java.util.List;
import javax.ws.rs.core.MediaType;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
 * @author hi
 */
@Controller
public class FunctionController {

    @Autowired
    private FunctionDAO functionDAO;

    @RequestMapping(value = "/functionManager.html", method = RequestMethod.GET)
    public String functionManager(ModelMap model) {
        List<Function> functions = functionDAO.getFunctions();
        model.addAttribute("functions", functions);
        return "functionManager";
    }

    @ResponseBody
    @RequestMapping(value = "/addFunction.json", method = RequestMethod.POST)
    public boolean addFunction(@RequestBody Function function) {
        boolean result = functionDAO.addFunction(function);
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/getFunction.json/{id}", method = RequestMethod.GET)
    public Function getFunction(@PathVariable("id") int id) {
        Function function = functionDAO.getFunctionById(id);
        return function;
    }

    @ResponseBody
    @RequestMapping(value = "/updateFunction.json", method = RequestMethod.POST)
    public boolean updateFunction(@RequestBody Function function) {
        boolean result = functionDAO.updateFunction(function);
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/deleteFunction.json", method = RequestMethod.POST)
    public boolean deleteFunction(@RequestParam("id") int id) {
        boolean result = functionDAO.deleteFunction(id);
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/getJsonFunctions.json", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON)
    public List<Function> getJsonFunctions() {
        List<Function> functions = functionDAO.getFunctions();
        return functions;
    }
}
