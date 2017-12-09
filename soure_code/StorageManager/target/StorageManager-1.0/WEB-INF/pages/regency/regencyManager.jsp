<%-- 
    Document   : rengency_manager
    Created on : Dec 8, 2017, 11:24:02 AM
    Author     : hi
--%>
<<<<<<< HEAD
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


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
                        <th>Mã chức vụ</th>
                        <th>Tên chức vụ</th>
                        <th></th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="regency" items="${regencies}">
                        <tr>
                            <td class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" />
                                    <span class="lbl"></span>
                                </label>
                            </td>
                            <td>
                                ${regency.regencyCode}
                            </td>
                            <td>
                                ${regency.regencyName}
                            </td>
                            <td>
                                <div class="hidden-sm hidden-xs btn-group">
                                    <a class="btn btn-xs btn-info btnEdit" data-id="${regency.id}">
                                        <i class="ace-icon fa fa-edit bigger-120"></i>
                                    </a>

                                    <a class="btn btn-xs btn-danger btnDelete" data-id="${regency.id}">
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

<div id="regencyModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">CẬP NHẬT CHỨC VỤ</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <input type="hidden" id="id"/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="regencyCode">Mã vai trò</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="regencyCode" placeholder="Mã vai trò"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="regencyName">Tên vai trò</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="regencyName" placeholder="Tên vai trò"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnSaveRegency">
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
    $(function () {

    });

    $('#btnAdd').on('click', function () {
        $('#regencyName, #regencyCode,#id').val("");
        $('#regencyCode').focus();
        $('#regencyModal').modal('show');
    });

    $("#btnSaveRegency").on('click', function () {
        $('#regencyModal').modal('hide');
        var regency = {
            id: $('#id').val(),
            regencyName: $('#regencyName').val().trim(),
            regencyCode: $('#regencyCode').val().trim()
        };

        if (regency.id === "") {
            $.ajax({
                url: 'addRegency.json',
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify(regency),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Accept", "application/json");
                    xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
                }, success: function (result) {

                    $.gritter.add({
                        title: 'THÔNG BÁO',
                        text: result ? 'Thêm chức vụ thành công' : 'Thêm chức vụ thất bại',
                        sticky: true,
                        time: '2000',
                        class_name: result ? 'gritter-success' : 'gritter-error'
                    });

                    if (result) {
                        setTimeout(function () {
                            location.reload();
                        }, 2000);
                    }
                }
            });
        } else {
            $.ajax({
                url: 'updateRegency.json',
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify(regency),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Accept", "application/json");
                    xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
                }, success: function (result) {

                    $.gritter.add({
                        title: 'THÔNG BÁO',
                        text: result ? 'Cập nhật chức vụ thành công' : 'Cập nhật chức vụ thất bại',
                        sticky: true,
                        time: '2000',
                        class_name: result ? 'gritter-success' : 'gritter-error'
                    });

                    if (result) {
                        setTimeout(function () {
                            location.reload();
                        }, 2000);
                    }
                }
            });
        }
    });

    $('.btnEdit').on('click', function (e) {
        var id = $(e.currentTarget).data("id");
        $.ajax({
            url: 'getRegency.json/' + id,
            success: function (data) {
                if (data) {
                    $('#id').val(data.id);
                    $('#regencyName').val(data.regencyName);
                    $('#regencyCode').val(data.regencyCode);
                    $('#regencyModal').modal('show');
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

    $('.btnDelete').on('click', function (e) {
        openDeleteRegencyModal($(e.currentTarget).data("id"));
    });

    function openDeleteRegencyModal(id) {
        bootbox.confirm({
            message: "Bạn có chắc xóa người dùng này?",
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
                    deleteRegencyByAjax(id);
                }
            }
        });
    }

    function deleteRegencyByAjax(id) {
        $.ajax({
            url: "deleteRegency.json",
            type: 'POST',
            data: {"id": id},
            dataType: 'json',
            success: function (result) {

                $.gritter.add({
                    title: 'THÔNG BÁO',
                    text: result ? 'Xóa chức vụ thành công' : 'Xóa chức vụ thất bại',
                    sticky: true,
                    time: '2000',
                    class_name: result ? 'gritter-success' : 'gritter-error'
                });
                if (result) {
                    setTimeout(function () {
                        location.reload();
                    }, 2000);
                    return false;
                }
            }
        });
    }
</script>
=======

<%@page contentType="text/html" pageEncoding="UTF-8"%>
>>>>>>> 8c3d0b2c56d13af267f9255840aed4b8667fc2e7
