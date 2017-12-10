/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.dao;

import com.hinet.storage.model.Storage;
import java.util.List;

/**
 *
 * @author hi
 */
public interface StorageDAO {

    List<Storage> getStorages();

    boolean addStorage(Storage storage);

    boolean updateStorage(Storage storage);

    boolean deleteStorage(int id);

    Storage getStorageById(int id);
}
