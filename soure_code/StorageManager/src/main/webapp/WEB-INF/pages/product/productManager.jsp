<%-- 
    Document   : productManager
    Created on : Dec 11, 2017, 9:18:20 AM
    Author     : hi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty message }">
    <div class="alert alert-${css} alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <i class="ace-icon fa fa-times"></i>
        </button>
        <strong>${message}</strong>
    </div>
</c:if>

<div class="col-xs-12">
    <div class="row">
        <div class="col-sm-12">
            <a class="btn btn-primary" id="btnAdd" href="addProduct.html">
                <i class="fa fa-plus"></i>&nbsp;Thêm mới
            </a>
        </div>
    </div>

    <div class="space-6"></div>

    <div class="row">
        <div class="col-xs-12">
            <table id="simple-table" class="table table-bordered tabl-hover">
                <thead>
                    <tr>
                        <th class="center">
                            <label class="pos-rel">
                                <input type="checkbox" class="ace" />
                                <span class="lbl"></span>
                            </label>
                        </th>
                        <th>Mã hàng hóa</th>
                        <th>Tên hàng hóa</th>
                        <th>Nhóm hàng hóa</th>
                        <th>Trạng thái kinh doanh</th>
                        <th></th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" />
                                    <span class="lbl"></span>
                                </label>
                            </td>
                            <td>
                                ${product.productCode}
                            </td>
                            <td>
                                ${product.officialName}
                            </td>
                            <td>
                                ${product.productCategoryId}
                            </td>
                            <td>
                                ${product.status}
                            </td>
                            <td>
                                <div class="hidden-sm hidden-xs btn-group">
                                    <a class="btn btn-xs btn-info btnEdit" data-id="${product.id}" href="updateProduct.html?id=${product.id}">
                                        <i class="ace-icon fa fa-edit bigger-120"></i>
                                    </a>

                                    <a class="btn btn-xs btn-danger btnDelete" data-id="${product.id}">
                                        <i class="ace-icon fa fa-trash bigger-120"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


<script type="text/javascript">
    $('.btnDelete').on('click', function (e) {
        openDeleteProductModal($(e.currentTarget).data("id"));
    });

    function openDeleteProductModal(id) {
        bootbox.confirm({
            message: "Bạn có chắc xóa mặt hàng này?",
            buttons: {
                confirm: {
                    label: 'Có',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'Không',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                if (result) {
                    deleteProductByAjax(id);
                }
            }
        });
    }

    function deleteProductByAjax(id) {
        $.ajax({
            url: "deleteProduct.json",
            type: 'POST',
            data: {"id": id},
            dataType: 'json',
            success: function (result) {
                $.gritter.add({
                    title: 'THÔNG BÁO',
                    text: result ? 'Xóa mặt hàng thành công' : 'Xóa mặt hàng không thành công',
                    sticky: true,
                    time: '2000',
                    class_name: result ? 'gritter-success' : 'gritter-error'
                });
                if (result) {
                    setTimeout("location.reload()", 1500);
                }
            }
        });
    }
</script>