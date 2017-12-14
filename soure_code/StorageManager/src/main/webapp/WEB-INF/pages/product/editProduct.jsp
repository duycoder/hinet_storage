<%-- 
    Document   : editProduct
    Created on : Dec 11, 2017, 10:28:44 AM
    Author     : hi
--%>

<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<div class="row">
    <div class="col-xs-12">
        <!--BEGIN FORM-->
        <form:form action="${actionUrl}" cssClass="form-horizontal" method="post" modelAttribute="product" enctype="multipart/form-data">
            <form:hidden path="id"/>
            <div class="form-group">
                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right">
                        Mã mặt hàng: <b class="red">(*)</b>
                    </label>

                    <div class="col-sm-9">
                        <form:input path="productCode" type="text" cssClass="form-control" placeholder="Mã mặt hàng"/>
                        <form:errors path="productCode" cssClass="red" />
                    </div>
                </div>

                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="productCategoryId">
                        Loại mặt hàng: <b class="red">(*)</b>
                    </label>
                    <div class="col-sm-9">
                        <select id="productCategoryId" class="form-control" name="productCategoryId">
                            <option value="">--- Chọn loại mặt hàng ---</option>
                            <c:forEach var="category" items="${productCategories}">
                                <option value="${category.id}" ${category.id == product.productCategoryId ? 'selected="selected"' : ''}>
                                    ${category.productCategoryName}
                                </option>
                            </c:forEach>
                        </select>

                        <form:errors path="productCategoryId" cssClass="red" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="officialName">
                        Tên chính thức: <b class="red">(*)</b>
                    </label>

                    <div class="col-sm-9">
                        <form:input path="officialName" cssClass="form-control" placeholder="Tên chính thức"/>

                        <form:errors path="officialName" cssClass="red" />
                    </div>
                </div>

                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="otherName">
                        Tên gọi khác:
                    </label>

                    <div class="col-sm-9">
                        <form:input path="otherName" cssClass="form-control" placeholder="Tên gọi khác"/>

                        <form:errors path="otherName" cssClass="red"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="vatTaxId">
                        Thuế VAT:
                    </label>

                    <div class="col-sm-3">
                        <select id="vatTaxId" class="form-control" name="vatTaxId">
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
                        <div class="input-group">
                            <form:input path="tariffTaxId" placeholder="Thuế xuất/nhập khẩu" cssClass="form-control"/>
                            <span class="input-group-addon">%</span>
                        </div>

                        <form:errors path="tariffTaxId"/>
                    </div>
                </div>

                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="calculateMethodId">
                        P/p tính giá xuất kho: <b class="red">(*)</b>
                    </label>

                    <div class="col-sm-9">
                        <select id="calculateMethodId" class="form-control" name="calculateMethodId">
                            <option value="">--- Chọn phương pháp tính ---</option>
                            <c:forEach var="method" items="${calculateMethods}">
                                <option value="${method.key}" ${method.key == product.calculateMethodId ? 'selected="selected"' : ''}>
                                    ${method.value}
                                </option>
                            </c:forEach>
                        </select>

                        <form:errors path="calculateMethodId" cssClass="red" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="measureUnitId">
                        Đơn vị tính: <b class="red">(*)</b>
                    </label>

                    <div class="col-sm-9">
                        <select id="measureUnitId" class="form-control" name="measureUnitId">
                            <option value="">--- Chọn đơn vị tính ---</option>
                            <c:forEach var="unit" items="${measureUnits}">
                                <option value="${unit.id}" ${unit.id == product.measureUnitId ? 'selected="selected"' : ''}>
                                    ${unit.vnName}
                                </option>
                            </c:forEach>
                        </select>

                        <form:errors path="measureUnitId" cssClass="red" />
                    </div>
                </div>

                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="safeInventoryQuantity">
                        Tồn kho an toàn:
                    </label>

                    <div class="col-sm-9">
                        <form:input type="text" path="safeInventoryQuantity" cssClass="form-control" placeholder="Tồn kho an toàn" />

                        <form:errors path="safeInventoryQuantity" cssClass="red"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="price">
                        Giá: <b class="red">(*)</b>
                    </label>

                    <div class="col-sm-9">
                        <form:input path="price" type="text" cssClass="form-control" placeholder="Giá" />

                        <form:errors path="price" cssClass="red" />
                    </div>
                </div>
                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="status">
                        Trạng thái kinh doanh:
                    </label>

                    <div class="col-sm-9">
                        <select id="status" class="form-control" name="status">
                            <c:forEach var="item" items="${listStatus}">
                                <option value="${item.key}" ${item.key == product.status ? 'selected="selected"' : ''}>
                                    ${item.value}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="origin">
                        Xuất xứ:
                    </label>

                    <div class="col-sm-9">
                        <form:textarea path="origin" placeholder="Xuất xứ" cssClass="form-control"/>

                        <form:errors path="origin" cssClass="red" />
                    </div>
                </div>
                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="manufacturer ">
                        Nhà sản xuất:
                    </label>

                    <div class="col-sm-9">
                        <form:textarea path="manufacturer" placeholder="Nhà sản xuất" cssClass="form-control"/>

                        <form:errors path="manufacturer" cssClass="red" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-6">
                    <label class="col-sm-3 control-label no-padding-right" for="attachment">
                        Hình ảnh:
                    </label>

                    <div class="col-sm-9">
                        <input type="file" name="attachment" id="attachment"/>
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
        </form:form>
        <!--END FORM-->        
    </div>
</div>