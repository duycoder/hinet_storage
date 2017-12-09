/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author duynn
 * @create_date 9/12/2017
 */
@Controller
public class HomeController {

    /**
     * @author duynn
     * @create_date 9/12/2017
     * @return 
     */
    @RequestMapping(value = "/index.html", method = RequestMethod.GET)
    public String index() {
        return "index";
    }
}
