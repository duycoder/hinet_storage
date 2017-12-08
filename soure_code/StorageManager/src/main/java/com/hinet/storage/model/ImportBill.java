/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hinet.storage.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
/**
 *
 * @author hi
 */
@Entity
@Table(name = "import_bill")
public class ImportBill {
    
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(name = "importbill_type_id ")
    private Integer importBillTypeId;
    
    @Column(name = "paper_import_date")
    private Date paperImportDate;
    
    @Column(name = "real_import_date")
    private Date realImportDate;
    
    @Column(name = "import_bill_code", length = 255)
    private String importBillCode;
    
    @Column(name = "receipt_code", length = 255)
    private String receiptCode;
    
    @Column(name = "deliver", length = 500)
    private String deliver;
    
    @Column(name = "delivery_department", length = 500)
    private String deliveryDepartment;
    
    @Column(name = "in_storage_id")
    private Integer inStorageId;
    
    @Column(name = "out_storage_id")
    private Integer outStorageId;
    
    @Column(name = "is_finish")
    private Boolean isFinish;
    
    @Column(name = "description",length = 500)
    private String description;
    
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

    public Integer getImportBillTypeId() {
        return importBillTypeId;
    }

    public void setImportBillTypeId(Integer importBillTypeId) {
        this.importBillTypeId = importBillTypeId;
    }

    public Date getPaperImportDate() {
        return paperImportDate;
    }

    public void setPaperImportDate(Date paperImportDate) {
        this.paperImportDate = paperImportDate;
    }

    public Date getRealImportDate() {
        return realImportDate;
    }

    public void setRealImportDate(Date realImportDate) {
        this.realImportDate = realImportDate;
    }

    public String getImportBillCode() {
        return importBillCode;
    }

    public void setImportBillCode(String importBillCode) {
        this.importBillCode = importBillCode;
    }

    public String getReceiptCode() {
        return receiptCode;
    }

    public void setReceiptCode(String receiptCode) {
        this.receiptCode = receiptCode;
    }

    public String getDeliver() {
        return deliver;
    }

    public void setDeliver(String deliver) {
        this.deliver = deliver;
    }

    public String getDeliveryDepartment() {
        return deliveryDepartment;
    }

    public void setDeliveryDepartment(String deliveryDepartment) {
        this.deliveryDepartment = deliveryDepartment;
    }

    public Integer getInStorageId() {
        return inStorageId;
    }

    public void setInStorageId(Integer inStorageId) {
        this.inStorageId = inStorageId;
    }

    public Integer getOutStorageId() {
        return outStorageId;
    }

    public void setOutStorageId(Integer outStorageId) {
        this.outStorageId = outStorageId;
    }

    public Boolean getIsFinish() {
        return isFinish;
    }

    public void setIsFinish(Boolean isFinish) {
        this.isFinish = isFinish;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
