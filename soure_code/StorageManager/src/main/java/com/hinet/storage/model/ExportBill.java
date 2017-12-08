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
 * @author duynn
 * @created_date 9/12/2017
 */
@Entity
@Table(name = "export_bill")
public class ExportBill {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(name = "exportbill_type_id")
    private Integer exportBillTypeId;
    
    @Column(name = "paper_export_date")
    private Date paperExportDate;
    
    @Column(name = "real_export_date")
    private Date realExportDate;
    
    @Column(name = "export_bill_code", length = 255)
    private String exportBillCode;
    
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

    public Integer getExportBillTypeId() {
        return exportBillTypeId;
    }

    public void setExportBillTypeId(Integer exportBillTypeId) {
        this.exportBillTypeId = exportBillTypeId;
    }

    public Date getPaperExportDate() {
        return paperExportDate;
    }

    public void setPaperExportDate(Date paperExportDate) {
        this.paperExportDate = paperExportDate;
    }

    public Date getRealExportDate() {
        return realExportDate;
    }

    public void setRealExportDate(Date realExportDate) {
        this.realExportDate = realExportDate;
    }

    public String getExportBillCode() {
        return exportBillCode;
    }

    public void setExportBillCode(String exportBillCode) {
        this.exportBillCode = exportBillCode;
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
