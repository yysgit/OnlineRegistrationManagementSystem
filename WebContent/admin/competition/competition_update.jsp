<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改</title>
    <link href="<%=path%>/css/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="<%=path%>/js/jquery-3.4.1.min.js"></script>
    <script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=path%>/js/jquery.validate.min.js"></script>
    <script src="<%=path%>/js/jquery.validate.extend.js"></script>
    <script src="<%=path%>/js/jquery.validate.method.js"></script>
    <script language="javascript" type="text/javascript" src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
    <link href="<%=path%>/css/pdmcontent01.css" rel="stylesheet">
</head>
<body>
<div class="page-content">
    <div class="panel panel-default">
        <div class="panel-heading">修改</div>
        <div class="panel-body">
            <form action="<%=path%>/competition_update.action" method="post" id="addForm">
                <input name="id" type="hidden" value="${competition.id}"/>

                <div class="row rowmargin">
                    <div class="col-sm-7">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <font color="red">*</font>
                                标题名称
                            </label>
                            <div class="col-sm-9 form-inline">
                                <input id="name" name="name" size="35" class="form-control"
                                       type="text" value="${competition.name}" tip="请输入标题名称"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row rowmargin">
                    <div class="col-sm-7">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <font color="red">*</font>
                                编号
                            </label>
                            <div class="col-sm-9 form-inline">
                                <input id="code" name="code" size="35" class="form-control"
                                       type="text" value="${competition.code}" tip="请输入编号"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row rowmargin">
                    <div class="col-sm-7">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <font color="red">*</font>
                                举办时间
                            </label>
                            <div class="col-sm-9 form-inline">
                                <input id="holdTime" name="holdTime" size="35" class="form-control"
                                       type="date" value="${holdTime}" tip="请选择举办时间"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row rowmargin">
                    <div class="col-sm-7">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <font color="red">*</font>
                                举办地点
                            </label>
                            <div class="col-sm-9 form-inline">
                                <input id="holdAddress" name="holdAddress" size="35"
                                       class="form-control"
                                       type="text" value="${competition.holdAddress}" tip="请输入举办地点"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row rowmargin">
                    <div class="col-sm-7">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <font color="red">*</font>
                                类型
                            </label>
                            <div class="col-sm-9 form-inline">
                                <select name="type" class="form-control">
                                    <option
                                            <c:if test="${competition.type=='0'}">selected</c:if> value="0">
                                        只面向大学生
                                    </option>
                                    <option
                                            <c:if test="${competition.type=='1'}">selected</c:if> value="1">
                                        其他
                                    </option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row rowmargin">
                    <div class="col-sm-7">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <font color="red">*</font>
                                描述
                            </label>
                            <div class="col-sm-9 form-inline">
                                <textarea name="content" class="form-control add_content"
                                          rows="6">${competition.content}</textarea>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-4" style="margin-left: 20px;">
                        <button type="submit" class="btn btn-primary" style="margin-top: 40px;">提交</button>
                        <button type="button" id="rebackBtn" class="btn btn-default"
                                style="margin-top: 40px; margin-left: 20px;">返回
                        </button>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        $("#rebackBtn").click(function () {
            window.history.go(-1);
        });
        $("#addForm").validate({
            submitHandler: function (form) {//验证通过后的执行方法
                form.submit();
            },
            rules: {
                name: {
                    required: true,

                },
                code: {
                    required: true,
                },

                holdTime: {
                    required: true,
                },
                holdAddress: {
                    required: true,
                },
                type: {
                    required: true,
                },
                content: {
                    required: true,
                },
            },
            messages: {
                name: {
                    required: '标题名称不能为空',

                },
                code: {
                    required: '编号不能为空',
                },
                holdTime: {
                    required: '举办时间不能为空',
                },
                holdAddress: {
                    required: '举办地点不能为空',
                },
                type: {
                    required: '类型不能为空',
                },
                content: {
                    required: '描述不能为空',
                },

            }
        });
    });
</script>
</html>