<%-- 
    Document   : actionManager
    Created on : Dec 10, 2017, 10:23:22 AM
    Author     : hi
--%>
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
                        <th>Mã hành động</th>
                        <th>Tên hành động</th>
                        <th>Trạng thái</th>
                        <th></th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="action" items="${actions}">
                        <tr>
                            <td class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" />
                                    <span class="lbl"></span>
                                </label>
                            </td>
                            <td>
                                ${action.actionCode}
                            </td>
                            <td>
                                ${action.actionName}
                            </td>
                            <td>
                                ${action.isActive}
                            </td>
                            <td>
                                <div class="hidden-sm hidden-xs btn-group">
                                    <a class="btn btn-xs btn-info btnEdit" data-id="${action.id}">
                                        <i class="ace-icon fa fa-edit bigger-120"></i>
                                    </a>

                                    <a class="btn btn-xs btn-danger btnDelete" data-id="${action.id}">
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

<div id="actionModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">CẬP NHẬT HÀNH ĐỘNG</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <input type="hidden" id="id"/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="actionCode">Mã hành động</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="actionCode" placeholder="Mã vai trò"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="actionName">Tên hành động</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="actionName" placeholder="Tên vai trò"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="functionId">Chức năng</label>
                        <div class="col-sm-10">
                            <select id="functionId" class="form-control">
                                <option></option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Trạng thái</label>
                        <div class="col-sm-10">
                            <div class="radio">
                                <label>
                                    <input name="form-field-radio" class="ace" type="radio" value="0" checked="checked" id="actionIsActive">
                                    <span class="lbl">Kích hoạt</span>
                                </label>

                                <label>
                                    <input name="form-field-radio" class="ace" type="radio" value="1" id="actionDeActive">
                                    <span class="lbl">Vô hiệu hóa</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnSaveAction">
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
            url: "getJsonFunctions.json",
            dataType: 'json',
            success: function (result) {
                if (result) {
                    var htmlOptions = "<option value=''>--- Chọn chức năng---</option>";
                    for (var i = 0; i < result.length; i++) {
                        htmlOptions += "<option value='" + result[i].id + "'>" + result[i].functionName + "</option>";
                    }
                    $('#functionId').html(htmlOptions);

                    $('#actionName, #actionCode,#id').val("");
                    $('#actionCode').focus();
                    $('#actionModal').modal('show');
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

    $('#btnSaveAction').on('click', function () {
        var id = $('#id').val().trim();
        var action = {
            id: id,
            actionName: $('#actionName').val().trim(),
            actionCode: $('#actionCode').val().trim(),
            functionId: $('#functionId').val().trim(),
            isActive: $('#actionIsActive').is(':checked')
        }
        $('#actionModal').modal('hide');
        $.ajax({
            url: (id === "") ? 'addAction.json' : 'updateAction.json',
            type: 'POST',
            data: JSON.stringify(action),
            dataType: 'json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
            },
            success: function (result) {
                $.gritter.add({
                    title: 'THÔNG BÁO',
                    text: result ? 'Cập nhật hành động thành công' : 'Cập nhật hành động thất bại',
                    sticky: true,
                    time: '2000',
                    class_name: result ? 'gritter-success' : 'gritter-error'
                });

                if (result) {
                    set$Timeout("location.reload()", 1500);
                }
            }
        });
    });

    $('.btnEdit').on('click', function (event) {
        var id = $(event.currentTarget).data('id');
        $.ajax({
            url: 'getAction.json/' + id,
            dataType: 'json',
            success: function (result) {
                if (result) {
                    var htmlOptions = "<option value=''>--- Chọn chức năng---</option>";
                    for (var i = 0; i < result.functions.length; i++) {
                        htmlOptions += "<option value='" + result.functions[i].id + "'>" + result.functions[i].functionName + "</option>";
                    }
                    $('#functionId').html(htmlOptions);
                    $('#functionId').val(result.action.functionId);
                    $('#id').val(result.action.id);
                    $('#actionName').val(result.action.actionName);
                    $('#actionCode').val(result.action.actionCode);
                    if (result.action.isActive) {
                        $("#actionIsActive").prop('checked', true);
                    } else {
                        $('#actionDeActive').prop('checked', true);
                    }
                    $('#actionModal').modal('show');
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
        })
    });


    $('.btnDelete').on('click', function (e) {
        openDeleteActionModal($(e.currentTarget).data("id"));
    });

    function openDeleteActionModal(id) {
        bootbox.confirm({
            message: "Bạn có chắc xóa hành động này?",
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
                    deleteActionByAjax(id);
                }
            }
        });
    }

    function deleteActionByAjax(id) {
        $.ajax({
            url: "deleteAction.json",
            type: 'POST',
            data: {"id": id},
            dataType: 'json',
            success: function (result) {
                $.gritter.add({
                    title: 'THÔNG BÁO',
                    text: result ? 'Xóa hành động thành công' : 'Xóa hành động thành công',
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