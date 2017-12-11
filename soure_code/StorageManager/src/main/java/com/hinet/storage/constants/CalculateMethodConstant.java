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
 * @create_date :11/12/2017
 */
public class CalculateMethodConstant {

    private static Map<Integer, String> calculateMethods;

    public static int NHAP_TRUOC_XUAT_TRUOC_ID = 1;
    private static String NHAP_TRUOC_XUAT_TRUOC = "Nhập trước xuất trước";

    public static int NHAP_SAU_XUAT_TRUOC_ID = 2;
    private static String NHAP_SAU_XAU_TRUOC = "Nhập sau xuất trước";

    public static int THUC_TE_DICH_DANH_ID = 3;
    private static String THUC_TE_DICH_DANH = "Thực tế đích danh";

    public static int BINH_QUAN_GIA_QUYEN_ID = 4;
    private static String BINH_QUAN_GIA_QUYEN = "Bình quân gia quyền";

    public static Map<Integer, String> getCalculateMethods() {
        calculateMethods = new HashMap<Integer, String>();
        calculateMethods.put(NHAP_TRUOC_XUAT_TRUOC_ID, NHAP_TRUOC_XUAT_TRUOC);
        calculateMethods.put(NHAP_SAU_XUAT_TRUOC_ID, NHAP_SAU_XAU_TRUOC);
        calculateMethods.put(THUC_TE_DICH_DANH_ID, THUC_TE_DICH_DANH);
        calculateMethods.put(BINH_QUAN_GIA_QUYEN_ID, BINH_QUAN_GIA_QUYEN);
        return calculateMethods;
    }
}
