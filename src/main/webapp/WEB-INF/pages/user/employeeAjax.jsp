<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">

    <script src="${APP_PATH}/static/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>SSMSuper-CURD</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button type="button" class="btn btn-primary" id="Add_Employee_Btn">Add</button>
                <button type="button" class="btn btn-danger" id="bath_delete">Delete</button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="check_all_box">
                            </th>
                            <th>#</th>
                            <th>LastName</th>
                            <th>Gender</th>
                            <th>Email</th>
                            <th>Department</th>
                            <th>Operation</th>
                        </tr>
                    </thead>
                    <tbody id="emp_tbody">

                    </tbody>
                </table>
            </div>
        </div>
        <div class="row" id="pageInfoText">

        </div>
        <div class="row">
            <div class="col-md-6 col-md-offset-6">
                <nav aria-label="Page navigation" id="emp_page">

                </nav>
            </div>
        </div>
    </div>

    <%-- 修改员工弹出框 --%>
    <div class="modal fade" id="update_employee_modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Update Employee</h4>
                </div>
                <div class="modal-body">
                    <%--form --%>
                    <form class="form-horizontal" id="update_employeeForm">
                        <div class="form-group">
                            <label for="exampleInputName2" class="col-sm-2 control-label">lastName</label>
                            <div class="col-sm-10">
                                <%--<input type="text" class="form-control" id="update_exampleInputName2" placeholder="lastName"
                                       name="lastName" value="">
                                <span id="update_lastNameHelpBlock" class="help-block"></span>--%>
                                <p class="form-control-static">email@example.com</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="update_inputEmaill3" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="update_inputEmaill3" placeholder="Email"
                                       name="email" value="">
                                <span id="update_emailHelpBlock" class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="update_inlineRadio1" value="0" checked> Male
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="update_inlineRadio2" value="1"> Female
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Department</label>
                            <div class="col-sm-4">
                                <select class="form-control"
                                        name="deptId"
                                        id="update_dept_option">

                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" id="update_EmployeeBtn" class="btn btn-primary">Save changes</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <%-- 添加员工弹出框 --%>
    <div class="modal fade" id="add_employee_modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Add Employee</h4>
                </div>
                <div class="modal-body">
                    <%--form --%>
                    <form class="form-horizontal" id="employeeForm">
                        <div class="form-group">
                            <label for="exampleInputName2" class="col-sm-2 control-label">lastName</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="exampleInputName2" placeholder="lastName"
                                       name="lastName" value="">
                                <span id="lastNameHelpBlock" class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmaill3" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="inputEmaill3" placeholder="Email"
                                       name="email" value="">
                                <span id="emailHelpBlock" class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="inlineRadio1" value="0" checked> Male
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="inlineRadio2" value="1"> Female
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Department</label>
                            <div class="col-sm-4">
                                <select class="form-control"
                                        name="deptId"
                                        id="dept_option">

                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" onclick="saveEmployee()" id="AddEmployeeBtn" class="btn btn-primary">Save changes</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <script type="text/javascript">

        var totalRecord, currentPage;

        $(function () {
            pageAjax(1);
        })

        function pageAjax(pageNo) {
            $.ajax({
                type : "POST",
                url : "${APP_PATH}/employee/AjaxPageEmployee",
                data : {
                    pageNo : pageNo
                },
                success : function (result) {

                    var pageInfo = result.dataMap.pageInfo;
                    var employees = pageInfo.list;

                    build_employee_table(employees);
                    build_employee_page(pageInfo);
                }
            })
        }

        function build_employee_table(employees) {

            var employeeTableContent = '';
            $.each(employees,function (i, empItem) {
                employeeTableContent += '<tr>';
                employeeTableContent += '    <td><input type="checkbox" class="check_item"></td>';
                employeeTableContent += '    <td>'+empItem.id+'</td>';
                employeeTableContent += '    <td>'+empItem.lastName+'</td>';
                employeeTableContent += '    <td>'+(empItem.gender == 0 ? 'Male' : 'Female') +'</td>';
                employeeTableContent += '    <td>'+empItem.email+'</td>';
                employeeTableContent += '    <td>'+empItem.department.deptName+'</td>';
                employeeTableContent += '    <td>';
                employeeTableContent += '    <button id="edit_employee_btn" type="button" edit_emoloyeeId = "'+empItem.id+'" class="btn btn-info btn-sm">';
                employeeTableContent += '        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>';
                employeeTableContent += '    Edit';
                employeeTableContent += '    </button>';
                employeeTableContent += '    <button id="remove_employee_btn" type="button" remove_emoloyeeId = "'+empItem.id+'" class="btn btn-danger btn-sm">';
                employeeTableContent += '        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>';
                employeeTableContent += '    Remove';
                employeeTableContent += '    </button>';
                employeeTableContent += '    </td>';
                employeeTableContent += '</tr>';
            });

            $('#emp_tbody').html(employeeTableContent);
        }
        function build_employee_page(pageInfo) {

            var employeePageContent = '';
            employeePageContent += ' <ul class="pagination">';

            if (pageInfo.isFirstPage) {
                employeePageContent += '         <li class="disabled"><a href="javascript:;">First Page</a></li>';
            } else {
                employeePageContent += '         <li><a onclick="pageAjax(1)" href="javascript:;">First Page</a></li>';
            }
            if (pageInfo.hasPreviousPage) {
                employeePageContent += '     <li>';
                employeePageContent += '     <a onclick="pageAjax('+ (pageInfo.pageNum - 1) +')" href="javascript:;" aria-label="Previous">';
                employeePageContent += '         <span aria-hidden="true">&laquo;</span>';
                employeePageContent += '      </a>';
                employeePageContent += '    </li>';
            }
            $.each(pageInfo.navigatepageNums, function (i, numItem) {
                if (numItem == pageInfo.pageNum) {
                    employeePageContent += '    <li class="active"><a href="javascript:;">'+ numItem +'</a></li>';
                } else {
                    employeePageContent += '    <li ><a onclick="pageAjax('+ numItem +')" href="javascript:;">'+numItem+'</a></li>';
                }
            })


            if (pageInfo.hasNextPage) {
                employeePageContent += '    <li>';
                employeePageContent += '    <a onclick="pageAjax('+ (pageInfo.pageNum + 1) +')" href="javascript:;" aria-label="Next">';
                employeePageContent += '        <span aria-hidden="true">&raquo;</span>';
                employeePageContent += '    </a>';
                employeePageContent += '    </li>';
            }

            if (pageInfo.isLastPage) {
                employeePageContent += '    <li class="disabled"><a href="javascript:;">Last Page</a></li>';
            } else {
                employeePageContent += '    <li><a onclick="pageAjax('+ pageInfo.pages +')" href="javascript:;">Last Page</a></li>';
            }
            employeePageContent += '</ul>';

            $('#emp_page').html(employeePageContent);

            var pageInfoTextContent = '<div class="col-md-12">\n' +
                            '                Now is for [ '+ pageInfo.pageNum +' ] page ,\n' +
                            '                The total Page is [ '+ pageInfo.pages +' ],\n' +
                            '                Datas : [ '+ pageInfo.total +' ]\n' +
                            '            </div>';

            totalRecord = pageInfo.total;
            currentPage = pageInfo.pageNum;

            $('#pageInfoText').html(pageInfoTextContent);

        }

        function getDepts(element) {
            $(element).empty();
            $.ajax({
                type : 'GET',
                url : '${APP_PATH}/employee/departments',
                success : function (result) {
                    var depts = result.dataMap.departments
                    var deptContent = '';
                    $.each(depts,function (i,dept) {
                        deptContent += '<option value="'+ dept.id +'">'+ dept.deptName +'</option>';
                    })
                    $(element).html(deptContent);
                }
            })
        }

        /*
        * 添加
        * */
        $(function () {
            /*
            * 显示弹出框
            *   backdrop : "static" : 表示点击模块框外的背景不会关闭模块框
            * */
            $('#Add_Employee_Btn').click(function () {
                getDepts("#add_employee_modal select");
                $('#add_employee_modal').modal({
                    backdrop : "static"
                });
            });


            $('#update_EmployeeBtn').click(function () {
                $.ajax({
                    type : "PUT",
                    url : "${APP_PATH}/employee/emp/" + $(this).attr('edit_id'),
                    data : $('#update_employeeForm').serialize(),
                    success : function (result) {
                        if (result.code == '100') {
                            alert('修改成功!');
                            pageAjax(currentPage);
                            $('#update_employee_modal').modal('hide');
                        } else {
                            alert('修改失败!');
                        }
                    }
                })
            })

            $('#bath_delete').click(function () {
                if ($('.check_item:checked').length == 0) {
                    alert('请选择要删除的员工!');
                    return;
                }
                var deleteNames = '';
                var deleteIds ='';
                $.each($('.check_item:checked'), function (i, e) {
                    deleteNames += $(this).parents('tr').find('td:eq(2)').text() + ',';
                    deleteIds += $(this).parents('tr').find('td:eq(1)').text() + '-';
                })
                deleteNames = deleteNames.substr(0,deleteNames.length - 1);
                if (!confirm('是否刪除[ '+ deleteNames +' ]')) {
                    return;
                }
                deleteIds = deleteIds.substr(0,deleteIds.length - 1);
                $.ajax({
                    type : 'DELETE',
                    url : '${APP_PATH}/employee/emp/'+ deleteIds,
                    success : function (result) {
                        if (result.code == '100') {
                            alert('删除成功!');
                            pageAjax(currentPage);
                        } else {
                            alert('删除失败!');
                        }
                    }
                })
            })
        });



        $('#check_all_box').click(function () {
            $('.check_item').prop('checked', $(this).prop('checked'))
        })
        $(document).on('click', '.check_item', function () {
            var flag = $('.check_item').length == $('.check_item:checked').length;
            console.log(flag)
            $('#check_all_box').prop('checked', flag);
        })

        $(document).on('click', '#remove_employee_btn', function () {
            var lastName = $(this).parents('tr').find('td:eq(2)').text();
            if (!confirm('是否要删除:+'+lastName+'?')) {
                return;
            }
            $.ajax({
                type : "DELETE",
                url : "${APP_PATH}/employee/emp/" + $(this).attr('remove_emoloyeeId'),
                success : function (result) {
                    if (result.code == '100') {
                        alert('删除成功!');
                        pageAjax(currentPage);
                    } else {
                        alert('删除失败!');
                    }
                }
            })
        })
        /*
            显示修改员工弹出框
         */
        $(document).on('click', '#edit_employee_btn' , function () {
            getDepts("#update_employee_modal select");

            // 获取员工
            getEmployee($(this).attr('edit_emoloyeeId'));
            $('#update_employee_modal').modal({
                backdrop : "static"
            });
        });

        function getEmployee(id) {//  name="email" name="gender" name="deptId"
            $.ajax({
                type : "GET",
                url : "${APP_PATH}/employee/emp/"+id+"",
                success : function (result) {
                    if (result.code == "100") {
                        var employee = result.dataMap.employee;
                        $('#update_employee_modal .form-control-static').text(employee.lastName);
                        $('#update_employee_modal input[name=email]').val(employee.email);
                        $('#update_employee_modal input[name=gender]').val([employee.gender]);
                        $('#update_employee_modal select[name=deptId]').val([employee.deptId]);

                        $('#update_employee_modal #update_EmployeeBtn').attr('edit_id', employee.id);
                    } else {
                        alert("异常!");
                        $('#update_employee_modal').modal('hide');
                    }
                }
            })
        }

        $('#exampleInputName2').change(function () {
            $.ajax({
                type : "POST",
                url : "${APP_PATH}/employee/checkEmployeeName",
                data : {
                    checkName : $(this).val()
                },
                success : function (result) {
                    if (result.code == "100") {
                        show_validate_msg('#exampleInputName2',
                            "success",
                            result.msg);
                        $('#AddEmployeeBtn').attr('ajaxCheck',"success")
                    } else {
                        show_validate_msg('#exampleInputName2',
                            "error",
                            result.msg);
                        $('#AddEmployeeBtn').attr('ajaxCheck',"error")
                    }

                }
            })

            if ($(this).val() == null || $(this).val() == "") {
                show_validate_msg('#exampleInputName2',
                    "error",
                    "不能为空!")
            }

        })

        function show_validate_msg(element, status, msg) {
            // 清空校验痕迹
            $(element).parent().removeClass("has-success has-error")
            $(element).next().text();

            if (status == "error") {
                $(element).parent().addClass("has-error");
                $(element).next("span").text(msg);
                return false;
            }
            if (status == "success") {
                $(element).parent().addClass("has-success");
                $(element).next("span").text(msg);
                return true;
            }
        }

        function validate_add_from(){

            /*var name = 	/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;

            if (!name.test($('#exampleInputName2').val())) {

                return show_validate_msg('#exampleInputName2',
                    "error",
                    "名字必须是2-5个汉字或6-16个的英文字符可以包含 - _ 符号!");
            } else {
                show_validate_msg('#exampleInputName2',
                    "success",
                    "名字可用!")
            }*/

            var email = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if (!email.test($('#inputEmaill3').val())) {

                return show_validate_msg('#inputEmaill3',
                    "error",
                    "邮箱格式不正确!");
            } else {
                show_validate_msg('#inputEmaill3',
                    "success",
                    "邮箱格式可用!")
            }
            return true;
        }

        function saveEmployee() {

            if (!validate_add_from()) {
                return false;
            }

            if ($(this).attr('ajaxCheck') == "error") {
                return false;
            }

            $.ajax({
                type : "POST",
                url : "${APP_PATH}/employee/emp",
                data: $('#employeeForm').serialize(),
                success : function (result) {
                    if (result.code == "100") {
                        alert("成功！");
                        $('#add_employee_modal').modal('hide');
                        pageAjax(totalRecord);
                        // 清空内容 和样式
                        $('.help-block').parent().removeClass("has-success has-error");
                        $('.help-block').text('');
                        $('#employeeForm')[0].reset();
                    } else {
                        if (result.dataMap.errorFields.lastName != undefined) {
                            show_validate_msg('#exampleInputName2',
                                "error",
                                result.dataMap.errorFields.lastName);
                        }
                        if (result.dataMap.errorFields.email != undefined) {
                            show_validate_msg('#inputEmaill3',
                                "error",
                                result.dataMap.errorFields.email);
                        }
                    }
                }
            })
        }
    </script>
</body>
</html>
