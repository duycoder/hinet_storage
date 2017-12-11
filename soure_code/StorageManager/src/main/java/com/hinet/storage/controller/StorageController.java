/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.controller;

import com.hinet.storage.dao.StorageDAO;
import com.hinet.storage.model.Storage;
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
 * @create_date 11/12/2017
 */
@Controller
public class StorageController {

    @Autowired
    private StorageDAO storageDAO;

    @RequestMapping(value = "/storageManager.html", method = RequestMethod.GET)
    public String storageManager(ModelMap model) {
        List<Storage> storages = storageDAO.getStorages();
        model.addAttribute("storages", storages);
        return "storageManager";
    }

    @ResponseBody
    @RequestMapping(value = "/addStorage.json", method = RequestMethod.POST)
    public boolean addStorage(@RequestBody Storage storage) {
        boolean result = storageDAO.addStorage(storage);
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/updateStorage.json", method = RequestMethod.POST)
    public boolean updateStorage(@RequestBody Storage storage) {
        boolean result = storageDAO.updateStorage(storage);
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/getStorageById.json/{id}", method = RequestMethod.GET)
    public Storage getStorageById(@PathVariable("id") int id) {
        Storage storage = storageDAO.getStorageById(id);
        return storage;
    }
    
    @ResponseBody
    @RequestMapping(value = "/deleteStorage.json", method = RequestMethod.POST)
    public boolean deleteStorage(@RequestParam("id") int id){
        boolean result = storageDAO.deleteStorage(id);
        return result;
    }
}
