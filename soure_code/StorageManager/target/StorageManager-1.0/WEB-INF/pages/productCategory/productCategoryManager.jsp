<%-- 
    Document   : productCategoryManager
    Created on : Dec 10, 2017, 8:43:53 PM
    Author     : hi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-xs-12">
    <div class="row">
        <div class="col-sm-12">
            <button class="btn btn-primary" id="btnAdd">
                <i class="fa fa-plus"></i>&nbsp;Thêm mới
            </button>
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
                        <th>Mã loại mặt hàng</th>
                        <th>Tên loại mặt hàng</th>
                        <th>Trạng thái</th>
                        <th></th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="category" items="${categories}">
                        <tr>
                            <td class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" />
                                    <span class="lbl"></span>
                                </label>
                            </td>
                            <td>
                                ${category.productCategoryCode}
                            </td>
                            <td>
                                ${category.productCategoryName}
                            </td>
                            <td>
                                ${category.isActive}
                            </td>
                            <td>
                                <div class="hidden-sm hidden-xs btn-group">
                                    <a class="btn btn-xs btn-info btnEdit" data-id="${category.id}">
                                        <i class="ace-icon fa fa-edit bigger-120"></i>
                                    </a>

                                    <a class="btn btn-xs btn-danger btnDelete" data-id="${category.id}">
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


<div id="categoryModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">CẬP NHẬT LOẠI MẶT HÀNG</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <input type="hidden" id="id"/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="productCategoryCode">Mã mặt hàng</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="productCategoryCode" placeholder="Mã mặt hàng"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="productCategoryName">Tên mặt hàng</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="productCategoryName" placeholder="Tên mặt hàng"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="measureUnitId">Đơn vị tính tồn kho</label>
                        <div class="col-sm-10">
                            <select id="measureUnitId" class="form-control"></select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" >Trạng thái</label>
                        <div class="col-sm-10">
                            <div class="radio">
                                <label>
                                    <input name="form-field-radio" class="ace" type="radio" value="0" checked="checked" id="categoryIsActive">
                                    <span class="lbl">Kích hoạt</span>
                                </label>

                                <label>
                                    <input name="form-field-radio" class="ace" type="radio" value="1" id="categoryDeActive">
                                    <span class="lbl">Vô hiệu hóa</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnSaveCategory">
                    Lưu
                </button>

                <button type="button" class="btn btn-default" data-dismiss="modal">
                    Đóng
                </button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $('#btnAdd').on('click', function () {
        $.ajax({
            url: 'getJsonMeasureUnits.json',
            dataType: 'json',
            success: function (result) {
                if (result) {
                    var htmlMeasureUnits = "";
                    htmlMeasureUnits += "<option value=''>--- Chọn đơn vị tồn kho ---</option>";
                    for (var i = 0; i < result.length; i++) {
                        htmlMeasureUnits += "<option value='" + result[i].id + "'>" + result[i].vnName + "</option>";
                    }
                    $('#measureUnitId').html(htmlMeasureUnits);

                    $('#id, #productCategoryCode, #productCategoryName').val("");
                    $('#productCategoryCode').focus();
                    $('#categoryModal').modal('show');
                }
            }
        });
    });

    $('.btnEdit').on('click', function (event) {
        var id = $(event.currentTarget).data('id');
        $.ajax({
            url: 'getProductCategoryById.json/' + id,
            dataType: 'json',
            success: function (result) {
                if (result) {
                    $('#id').val(result.category.id);
                    $('#productCategoryCode').val(result.category.productCategoryCode);
                    $('#productCategoryName').val(result.category.productCategoryName);
                    if (result.category.isActive) {
                        $('#categoryIsActive').prop('checked', true);
                    } else {
                        $('#categoryDeActive').prop('checked', true);
                    }

                    var htmlMeasureUnits = "";
                    htmlMeasureUnits += "<option value=''>--- Chọn đơn vị tồn kho ---</option>";
                    for (var i = 0; i < result.measureUnits.length; i++) {
                        htmlMeasureUnits += "<option value='" + result.measureUnits[i].id + "'>" + result.measureUnits[i].vnName + "</option>";
                    }
                    $('#measureUnitId').html(htmlMeasureUnits);
                    $('#measureUnitId').val(result.category.measureUnitId);
                    $('#categoryModal').modal('show');
                } else {
                    $.gritter.add({
                        title: 'THÔNG BÁO',
                        text: 'Lấy dữ liệu thất bại',
                        sticky: true,
                        time: '2000',
                        class_name: 'gritter-error'
                    });
                }
            }
        });
    });

    $('#btnSaveCategory').on('click', function () {

        var category = {
            id: $('#id').val().trim(),
            productCategoryCode: $("#productCategoryCode").val().trim(),
            productCategoryName: $('#productCategoryName').val().trim(),
            measureUnitId: $('#measureUnitId').val(),
            isActive: $('#categoryIsActive').is(':checked')
        };
        $('#categoryModal').modal('hide');

        $.ajax({
            url: category.id === "" ? 'addProductCategory.json' : 'updateProductCategory.json',
            type: 'post',
            data: JSON.stringify(category),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (result) {
                $.gritter.add({
                    title: 'THÔNG BÁO',
                    text: result ? 'Cập nhật loại mặt hàng thành công' : 'Cập nhật loại mặt hàng thất bại',
                    sticky: true,
                    time: '2000',
                    class_name: result ? 'gritter-success' : 'gritter-error'
                });

                if (result) {
                    setTimeout("location.reload()", 1500);
                }
            }
        });
    });
    $('.btnDelete').on('click', function (e) {
        openDeleteCategoryModal($(e.currentTarget).data("id"));
    });

    function openDeleteCategoryModal(id) {
        bootbox.confirm({
            message: "Bạn có chắc xóa loại mặt hàng này?",
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
                    deleteCategoryByAjax(id);
                }
            }
        });
    }

    function deleteCategoryByAjax(id) {
        $.ajax({
            url: "deleteProductCategory.json",
            type: 'POST',
            data: {"id": id},
            dataType: 'json',
            success: function (result) {
                $.gritter.add({
                    title: 'THÔNG BÁO',
                    text: result ? 'Xóa loại mặt hàng thành công' : 'Xóa loại mặt hàng thành công',
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
