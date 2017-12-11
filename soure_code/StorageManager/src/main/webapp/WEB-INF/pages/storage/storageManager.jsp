<%-- 
    Document   : storageManager
    Created on : Dec 9, 2017, 4:16:14 PM
    Author     : hi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                        <th>Mã kho</th>
                        <th>Tên kho</th>
                        <th>Địa chỉ</th>
                        <th>Trạng thái</th>
                        <th></th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="storage" items="${storages}">
                        <tr>
                            <td class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" />
                                    <span class="lbl"></span>
                                </label>
                            </td>
                            <td>
                                ${storage.storageCode}
                            </td>
                            <td>
                                ${storage.storageName}
                            </td>
                            <td>
                                ${storage.storageAddress}
                            </td>
                            <td>
                                ${storage.isActive}
                            </td>
                            <td>
                                <div class="hidden-sm hidden-xs btn-group">
                                    <a class="btn btn-xs btn-info btnEdit" data-id="${storage.id}">
                                        <i class="ace-icon fa fa-edit bigger-120"></i>
                                    </a>

                                    <a class="btn btn-xs btn-danger btnDelete" data-id="${storage.id}">
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

<div id="storageModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">CẬP NHẬT THÔNG TIN KHO</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <input type="hidden" id="id"/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="storageCode">Mã kho</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="storageCode" placeholder="Mã kho"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="storageName">Tên kho</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="storageName" placeholder="Tên kho"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="storageAddress">Địa chỉ kho</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="storageAddress" placeholder="Địa chỉ kho"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Trạng thái</label>
                        <div class="radio">
                            <label>
                                <input name="form-field-radio" class="ace" type="radio" value="0" checked="checked" id="storageIsActive">
                                <span class="lbl">Kích hoạt</span>
                            </label>

                            <label>
                                <input name="form-field-radio" class="ace" type="radio" value="1" id="storageDeActive">
                                <span class="lbl">Vô hiệu hóa</span>
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnSaveStorage">
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
        $('#id, #storageCode, #storageName, #storageAddress').val("");
        $('#storageCode').focus();
        $('#storageModal').modal('show');
    });

    $('.btnEdit').on('click', function (event) {
        var id = $(event.currentTarget).data('id');
        $.ajax({
            url: 'getStorageById.json/' + id,
            dataType: 'json',
            success: function (result) {
                if (result) {
                    $('#id').val(result.id);
                    $('#storageCode').val(result.storageCode);
                    $('#storageName').val(result.storageName);
                    $('#storageAddress').val(result.storageAddress);
                    if (result.isActive) {
                        $('#storageIsActive').prop('checked', true);
                    } else {
                        $('#storageDeActive').prop('checked', true);
                    }
                    $('#storageModal').modal('show');
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

    $('#btnSaveStorage').on('click', function () {
        var storage = {
            id: $('#id').val(),
            storageCode: $("#storageCode").val().trim(),
            storageName: $('#storageName').val().trim(),
            storageAddress: $('#storageAddress').val().trim(),
            isActive: $('#storageIsActive').is(':checked')
        };

        $('#storageModal').modal('hide');

        $.ajax({
            url: storage.id === "" ? 'addStorage.json' : 'updateStorage.json',
            type: 'post',
            data: JSON.stringify(storage),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (result) {
                $.gritter.add({
                    title: 'THÔNG BÁO',
                    text: result ? 'Cập nhật kho hàng thành công' : 'Cập nhật kho hàng thất bại',
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
        openDeleteStorageModal($(e.currentTarget).data("id"));
    });

    function openDeleteStorageModal(id) {
        bootbox.confirm({
            message: "Bạn có chắc xóa kho này?",
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
                    deleteStorageByAjax(id);
                }
            }
        });
    }

    function deleteStorageByAjax(id) {
        $.ajax({
            url: "deleteStorage.json",
            type: 'POST',
            data: {"id": id},
            dataType: 'json',
            success: function (result) {
                $.gritter.add({
                    title: 'THÔNG BÁO',
                    text: result ? 'Xóa kho hàng thành công' : 'Xóa kho hàng không thành công',
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