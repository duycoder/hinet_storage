/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.bo;

import com.hinet.storage.model.Action;
import com.hinet.storage.model.Function;
import java.util.List;

/**
 *
 * @author duynn
 * @created date 10/12/2017
 */
public class ActionBO {
    private Action action;
    private List<Function> functions;

    public Action getAction() {
        return action;
    }

    public void setAction(Action action) {
        this.action = action;
    }

    public List<Function> getFunctions() {
        return functions;
    }

    public void setFunctions(List<Function> functions) {
        this.functions = functions;
    }
}
