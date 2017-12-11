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
 * @create date: 11/12/2017
 */
public class VatTaxConstant {
    private static Map<Integer, String> taxes;

    public static Map<Integer, String> getTaxes() {
        taxes = new HashMap<Integer, String>();
        taxes.put(1, "Không áp thuế");
        taxes.put(2, "5%");
        taxes.put(3, "10%");
        taxes.put(4, "15%");
        return taxes;
    }
}
