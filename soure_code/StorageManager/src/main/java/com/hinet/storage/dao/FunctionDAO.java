/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.dao;

import com.hinet.storage.model.Function;
import java.util.List;

/**
 *
 * @author hi
 */
public interface FunctionDAO {

    List<Function> getFunctions();

    boolean addFunction(Function function);

    boolean updateFunction(Function function);

    boolean deleteFunction(int id);

    Function getFunctionById(int id);
}
