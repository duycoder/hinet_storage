/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.dao;

import com.hinet.storage.model.Action;
import java.util.List;

/**
 *
 * @author duynn
 * @created_date: 10/12/2017
 */
public interface ActionDAO {

    List<Action> getActions();

    boolean addAction(Action action);

    boolean updateAction(Action action);

    boolean deleteAction(long id);

    Action getActionById(long id);
}
