<%-- 
    Document   : measureUnitManager
    Created on : Dec 9, 2017, 4:15:52 PM
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
                        <th>Mã đơn vị</th>
                        <th>Tên tiếng Việt</th>
                        <th>Tên tiếng Anh</th>
                        <th></th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="measureUnit" items="${measureUnits}">
                        <tr>
                            <td class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" />
                                    <span class="lbl"></span>
                                </label>
                            </td>
                            <td>
                                ${measureUnit.measureUnitCode}
                            </td>
                            <td>
                                ${measureUnit.vnName}
                            </td>
                            <td>
                                ${measureUnit.engName}
                            </td>
                            <td>
                                <div class="hidden-sm hidden-xs btn-group">
                                    <a class="btn btn-xs btn-info btnEdit" data-id="${measureUnit.id}">
                                        <i class="ace-icon fa fa-edit bigger-120"></i>
                                    </a>

                                    <a class="btn btn-xs btn-danger btnDelete" data-id="${measureUnit.id}">
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


<div id="measureUnitModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">CẬP NHẬT ĐƠN VỊ ĐO LƯỜNG</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <input type="hidden" id="id"/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="measureUnitCode">Mã đơn vị</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="measureUnitCode" placeholder="Mã đơn vị"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="vnName">Tên tiếng Việt</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="vnName" placeholder="Tên tiếng Việt"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="engName">Tên tiếng Anh</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="engName" placeholder="Tên tiếng Anh"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="unitTypeId">Loại đơn vị</label>
                        <div class="col-sm-10">
                            <select id="unitTypeId" class="form-control">
                                <option value="">--- Chọn loại đơn vị ---</option>
                                <c:forEach items="${unitTypes}" var="unit">
                                    <option value="${unit.key}">${unit.value}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnSaveMeasureUnit">
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
        $('#id, #measureUnitCode, #vnName, #engName').val("");
        $('#measureUnitCode').focus();
        $('#measureUnitModal').modal('show');
    });

    $('.btnEdit').on('click', function (event) {
        var id = $(event.currentTarget).data('id');
        $.ajax({
            url: 'getMeasureUnit.json/' + id,
            dataType: 'json',
            success: function (result) {
                if (result) {
                    $('#id').val(result.id);
                    $('#measureUnitCode').val(result.measureUnitCode);
                    $('#engName').val(result.engName);
                    $('#vnName').val(result.vnName);
                    $("#unitTypeId").val(result.unitTypeId);
                    $('#measureUnitModal').modal('show');
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

    $('#btnSaveMeasureUnit').on('click', function () {

        var unit = {
            id: $('#id').val(),
            measureUnitCode: $("#measureUnitCode").val().trim(),
            engName: $('#engName').val().trim(),
            vnName: $('#vnName').val().trim(),
            unitTypeId: $('#unitTypeId').val()
        };

        $('#measureUnitModal').modal('hide');

        $.ajax({
            url: unit.id === "" ? 'addMeasureUnit.json' : 'updateMeasureUnit.json',
            type: 'post',
            data: JSON.stringify(unit),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (result) {
                $.gritter.add({
                    title: 'THÔNG BÁO',
                    text: result ? 'Cập nhật đơn vị thành công' : 'Cập nhật đơn vị thất bại',
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
        openDeleteMeasureUnitModal($(e.currentTarget).data("id"));
    });

    function openDeleteMeasureUnitModal(id) {
        bootbox.confirm({
            message: "Bạn có chắc xóa đơn vị đo lường này?",
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
                    deleteMeasureUnitByAjax(id);
                }
            }
        });
    }

    function deleteMeasureUnitByAjax(id) {
        $.ajax({
            url: "deleteMeasureUnit.json",
            type: 'POST',
            data: {"id": id},
            dataType: 'json',
            success: function (result) {
                $.gritter.add({
                    title: 'THÔNG BÁO',
                    text: result ? 'Xóa đơn vị đo lường thành công' : 'Xóa đơn vị đo lường thành công',
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
