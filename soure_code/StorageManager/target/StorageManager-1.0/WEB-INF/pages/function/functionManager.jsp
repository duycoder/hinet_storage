<%-- 
    Document   : functionManager
    Created on : Dec 9, 2017, 4:15:18 PM
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
                        <th>Mã chức năng</th>
                        <th>Tên chức năng</th>
                        <th>Trạng thái</th>
                        <th></th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="function" items="${functions}">
                        <tr>
                            <td class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" />
                                    <span class="lbl"></span>
                                </label>
                            </td>
                            <td>
                                ${function.functionCode}
                            </td>
                            <td>
                                ${function.functionName}
                            </td>
                            <td>
                                ${function.isActive}
                            </td>
                            <td>
                                <div class="hidden-sm hidden-xs btn-group">
                                    <a class="btn btn-xs btn-info btnEdit" data-id="${function.id}">
                                        <i class="ace-icon fa fa-edit bigger-120"></i>
                                    </a>

                                    <a class="btn btn-xs btn-danger btnDelete" data-id="${function.id}">
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


<div id="functionModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">CẬP NHẬT CHỨC NĂNG</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <input type="hidden" id="id"/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="functionCode">Mã chức năng</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="functionCode" placeholder="Mã chức năng"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="functionName">Tên chức năng</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="functionName" placeholder="Tên chức năng"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="functionName">Trạng thái</label>
                        <div class="col-sm-10">
                            <div class="radio">
                                <label>
                                    <input name="form-field-radio" class="ace" type="radio" value="0" checked="checked" id="functionIsActive">
                                    <span class="lbl">Kích hoạt</span>
                                </label>

                                <label>
                                    <input name="form-field-radio" class="ace" type="radio" value="1" id="functionDeActive">
                                    <span class="lbl">Vô hiệu hóa</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnSaveFunction">
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
        $('#functionName, #functionCode,#id').val("");
        $('#functionCode').focus();
        $('#functionModal').modal('show');
    });

    $("#btnSaveFunction").on('click', function () {
        $('#functionModal').modal('hide');
        var func = {
            id: $('#id').val(),
            functionName: $('#functionName').val().trim(),
            functionCode: $('#functionCode').val().trim(),
            isActive: $('#functionIsActive').is(':checked') === true
        };

        if (func.id === "") {
            $.ajax({
                url: 'addFunction.json',
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify(func),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Accept", "application/json");
                    xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
                }, success: function (result) {

                    $.gritter.add({
                        title: 'THÔNG BÁO',
                        text: result ? 'Thêm chức năng thành công' : 'Thêm chức năng thất bại',
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
                url: 'updateFunction.json',
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify(func),
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

    $('.btnEdit').on('click', function (event) {
        var id = $(event.currentTarget).data('id');
        $.ajax({
            url: 'getFunction.json/' + id,
            dataType: 'json',
            success: function (result) {
                $('#id').val(result.id);
                $('#functionName').val(result.functionName);
                $('#functionCode').val(result.functionCode);
                if(result.isActive){
                    $('#functionIsActive').prop("checked", result.isActive);
                }else{
                    $('#functionDeActive').prop('checked', true);
                }
                
                $('#functionModal').modal('show');
            }, error: function () {
                $.gritter.add({
                    title: 'THÔNG BÁO',
                    text: "Không lấy được dữ liệu",
                    sticky: true,
                    time: '2000',
                    class_name: 'gritter-error'
                });
            }
        });
    });
    
    $('.btnDelete').on('click', function (e) {
        openDeleteFunctionModal($(e.currentTarget).data("id"));
    });

    function openDeleteFunctionModal(id) {
        bootbox.confirm({
            message: "Bạn có chắc xóa chức năng này?",
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
                    deleteFunctionByAjax(id);
                }
            }
        });
    }

    function deleteFunctionByAjax(id) {
        $.ajax({
            url: "deleteFunction.json",
            type: 'POST',
            data: {"id": id},
            dataType: 'json',
            success: function (result) {

                $.gritter.add({
                    title: 'THÔNG BÁO',
                    text: result ? 'Xóa chức năng thành công' : 'Xóa chức năng thành công',
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