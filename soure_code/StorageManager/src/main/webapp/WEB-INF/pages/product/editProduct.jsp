<%-- 
    Document   : editProduct
    Created on : Dec 11, 2017, 10:28:44 AM
    Author     : hi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="col-xs-12">
        <!--BEGIN FORM-->
        <form class="form-horizontal" role="form" action="saveProduct.html" method="post">
            <input type="hidden" id="${product.id}"/>
            <div class="form-group">
                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="productCode">
                        Mã mặt hàng:
                    </label>

                    <div class="col-sm-9">
                        <input type="text" id="productCode" placeholder="Mã mặt hàng" class="form-control" value="${product.productCode}" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="officialName">
                        Tên chính thức:
                    </label>

                    <div class="col-sm-9">
                        <input type="text" id="officialName" placeholder="Tên chính thức" class="form-control" value="${product.officialName}" />
                    </div>
                </div>

                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="otherName">
                        Tên gọi khác:
                    </label>

                    <div class="col-sm-9">
                        <input type="text" id="otherName" placeholder="Tên gọi khác" class="form-control" value="${product.otherName}" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="vatTaxId">
                        Thuế VAT:
                    </label>

                    <div class="col-sm-3">
                        <select id="vatTaxId" class="form-control">
                            <c:forEach var="tax" items="${taxes}">
                                <option value="${tax.key}" ${tax.key == product.vatTaxId ? 'selected="selected"' : ''}>
                                    ${tax.value}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <label class="col-sm-3 control-label no-padding-right" for="tariffTaxId">
                        Thuế xuất/nhập khẩu:
                    </label>

                    <div class="col-sm-3">
                        <input type="text" id="tariffTaxId" placeholder="Thuễ xuất/nhập khẩu" class="form-control" value="${product.tariffTaxId}" />
                    </div>

                </div>

                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="calculateMethodId">
                        P/p tính giá xuất kho:
                    </label>

                    <div class="col-sm-9">
                        <select id="calculateMethodId" class="form-control">
                            <option value="">
                                --- Chọn phương pháp tính ---
                            </option>
                            <c:forEach var="method" items="${calculateMethods}">
                                <option value="${method.key}" ${method.key == product.calculateMethodId ? 'selected="selected"' : ''}>
                                    ${method.value}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>


            </div>        

            <div class="form-group">
                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="measureUnitId">
                        Đơn vị tính:
                    </label>

                    <div class="col-sm-9">
                        <select id="measureUnitId" class="form-control">
                            <option value="">
                                --- Chọn đơn vị tính ---
                            </option>
                            <c:forEach var="unit" items="${measureUnits}">
                                <option value="${unit.id}" ${unit.id == product.measureUnitId ? 'selected="selected"' : ''}>
                                    ${unit.vnName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="safeInventoryQuantity">
                        Tồn kho an toàn:
                    </label>

                    <div class="col-sm-9">
                        <input type="text" id="safeInventoryQuantity" placeholder="Tồn kho an toàn" class="form-control" value="${product.safeInventoryQuantity}" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="origin">
                        Xuất xứ:
                    </label>

                    <div class="col-sm-9">
                        <textarea id="origin" placeholder="Xuất xứ" class="form-control">${product.origin}</textarea>
                    </div>
                </div>
                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="manufacturer ">
                        Nhà sản xuất:
                    </label>

                    <div class="col-sm-9">
                        <textarea id="manufacturer" placeholder="Nhà sản xuất" class="form-control">${product.manufacturer}</textarea>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="price">
                        Giá:
                    </label>

                    <div class="col-sm-9">
                        <input type="text" id="price" value="${product.price}" class="form-control" placeholder="Giá"/>
                    </div>
                </div>
                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="status">
                        Trạng thái kinh doanh:
                    </label>

                    <div class="col-sm-9">
                        <select id="status" class="form-control">
                            <c:forEach var="item" items="${listStatus}">
                                <option value="${item.key}" ${item.key == product.status ? 'selected="selected"' : ''}>
                                    ${item.value}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>

            <div class="clearfix form-actions">
                <center>
                    <button class="btn btn-info" type="submit">
                        <i class="ace-icon fa fa-check bigger-110"></i>
                        Cập nhật
                    </button>

                    &nbsp; &nbsp; &nbsp;
                    <button class="btn" type="reset">
                        <i class="ace-icon fa fa-undo bigger-110"></i>
                        Reset
                    </button>
                </center>
            </div>
        </form>
        <!--END FORM-->        
    </div>
</div>