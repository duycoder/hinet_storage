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
 * @author hi
 */
public class ProductStatusConstant {

    private static Map<Integer, String> status;

    public static int KINH_DOANH_ID = 1;
    public static String KINH_DOANH = "Đang kinh doanh";

    public static int NGUNG_KINH_DOANH_ID = 0;
    public static String NGUNG_KINH_DOANH = "Ngừng kinh doanh";

    public static Map<Integer, String> getStatus() {
        status = new HashMap<Integer, String>();
        status.put(KINH_DOANH_ID, KINH_DOANH);
        status.put(NGUNG_KINH_DOANH_ID, NGUNG_KINH_DOANH);
        return status;
    }
}
