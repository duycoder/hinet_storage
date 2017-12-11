/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.constants;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author duynn
 * @create date: 9/12/2017
 */
public class UnitTypeConstant {

    private static Map<Integer, String> unitTypes;

    public static Map<Integer, String> getUnitTypes() {
        unitTypes = new HashMap<Integer, String>();
        unitTypes.put(1, "Trọng lượng");
        unitTypes.put(2, "Độ dài");
        unitTypes.put(3, "Diện tích");
        unitTypes.put(4, "Thể tích");
        unitTypes.put(5, "Số lượng");
        unitTypes.put(6, "Thời gian");
        unitTypes.put(7, "Dung tích");
        return unitTypes;
    }
}
