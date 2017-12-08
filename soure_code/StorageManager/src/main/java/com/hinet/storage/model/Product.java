/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.model;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author duynn
 * @created_date 9/12/2017
 */
@Entity
@Table(name = "product")
public class Product {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "product_code", length = 50)
    private String productCode;
    
    @Column(name = "official_name", length = 150)
    private String officialName;
    
    @Column(name = "other_name", length = 150)
    private String otherName;
    
    @Column(name = "calculate_method_id")
    private Integer calculateMethodId;
    
    @Column(name = "measure_unit_id")
    private Integer measureUnitId;
    
    @Column(name = "product_category_id")
    private Integer productCategoryId;
    
    @Column(name = "vat_tax_id")
    private Integer vatTaxId;
    
    @Column(name = "tariff_tax_id")
    private Integer tariffTaxId;
    
    @Column(name = "origin", length = 500)
    private String origin;
    
    @Column(name = "manufacturer", length = 200)
    private String manufacturer;
    
    @Column(name = "price", length = 18)
    private BigDecimal price;
    
    @Column(name = "safe_inventory_quantity")
    private Long safeInventoryQuantity;
    
    @Column(name = "status")
    private Integer status;
    
    @Column(name = "date_create")
    private Date dateCreate;

    @Column(name = "date_modify")
    private Date dateModify;

    @Column(name = "user_create", nullable = true)
    private Integer userCreate;

    @Column(name = "user_modify", nullable = true)
    private Integer userModify;

    @Column(name = "is_delete")
    private Boolean isDelete;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public Date getDateModify() {
        return dateModify;
    }

    public void setDateModify(Date dateModify) {
        this.dateModify = dateModify;
    }

    public Integer getUserCreate() {
        return userCreate;
    }

    public void setUserCreate(Integer userCreate) {
        this.userCreate = userCreate;
    }

    public Integer getUserModify() {
        return userModify;
    }

    public void setUserModify(Integer userModify) {
        this.userModify = userModify;
    }

    public Boolean getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getOfficialName() {
        return officialName;
    }

    public void setOfficialName(String officialName) {
        this.officialName = officialName;
    }

    public String getOtherName() {
        return otherName;
    }

    public void setOtherName(String otherName) {
        this.otherName = otherName;
    }

    public Integer getCalculateMethodId() {
        return calculateMethodId;
    }

    public void setCalculateMethodId(Integer calculateMethodId) {
        this.calculateMethodId = calculateMethodId;
    }

    public Integer getMeasureUnitId() {
        return measureUnitId;
    }

    public void setMeasureUnitId(Integer measureUnitId) {
        this.measureUnitId = measureUnitId;
    }

    public Integer getProductCategoryId() {
        return productCategoryId;
    }

    public void setProductCategoryId(Integer productCategoryId) {
        this.productCategoryId = productCategoryId;
    }

    public Integer getVatTaxId() {
        return vatTaxId;
    }

    public void setVatTaxId(Integer vatTaxId) {
        this.vatTaxId = vatTaxId;
    }

    public Integer getTariffTaxId() {
        return tariffTaxId;
    }

    public void setTariffTaxId(Integer tariffTaxId) {
        this.tariffTaxId = tariffTaxId;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Long getSafeInventoryQuantity() {
        return safeInventoryQuantity;
    }

    public void setSafeInventoryQuantity(Long safeInventoryQuantity) {
        this.safeInventoryQuantity = safeInventoryQuantity;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
