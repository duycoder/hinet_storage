/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.dao;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author hi
 */
public interface BaseDAO {
    <T> List<T> getAll(Class<T> klass);

    <T> void Save(T klass);

    <T> T findByPrimaryKey(Class<T> klass, Serializable id);

    <T> T GetUniqueEntityByNamedQuery(String query, Object... params);

    <T> List<T> GetListByNamedQuery(String query, Object... params);

    <T> void delete(T klass);

    <T> Long getQueryCount(String query, Object... params);
}
