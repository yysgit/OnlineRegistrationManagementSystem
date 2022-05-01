<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>新增</title>
    <link href="<%=path%>/css/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="<%=path%>/js/jquery-3.4.1.min.js"></script>
    <script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=path%>/js/jquery.validate.min.js"></script>
    <script src="<%=path%>/js/jquery.validate.extend.js"></script>
    <script src="<%=path%>/js/jquery.validate.method.js"></script>
    <script language="javascript" type="text/javascript" src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=path %>/js/popup.js"></script>
    <link href="<%=path%>/css/pdmcontent01.css" rel="stylesheet">
</head>
<body>
<div class="page-content">
    <div class="panel panel-default">
        <div class="panel-heading">修改</div>
        <div class="panel-body">

            <form action="<%=path%>/project_add.action" method="post" id="addForm">
                <input name="id" type="hidden" value="${competition.id}"/>
                <%--                开始--%>
                <div class="row rowmargin col-sm-7">
                    <div class="form-group">
                        <label  class="col-sm-3 col-lg-2 control-label"><span class="red">*</span>名称:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control add_name" name="name" value="${competition.name}">
                        </div>
                    </div>
                </div>
                <div class="row rowmargin col-sm-7">
                    <div class="form-group">
                        <label  class="col-sm-3 col-lg-2 control-label"><span class="red">*</span>简介:</label>
                        <div class="col-sm-8">
                            <textarea class="form-control add_content" rows="6" name="content" value="${competition.content}"></textarea>
                        </div>
                    </div>
                </div>
                <div class="row rowmargin col-sm-7">
                    <div class="form-group">
                        <label  class="col-sm-3 col-lg-2 control-label"><span class="red">*</span>详情:</label>
                        <div class="col-sm-8">
                            <textarea class="form-control add_info" rows="6" name="info" value="${competition.info}"></textarea>
                        </div>
                    </div>
                </div>
                <div class="row rowmargin col-sm-7">
                    <div class="form-group">
                        <label  class="col-sm-3 col-lg-2 control-label"><span class="red">*</span>举办时间:</label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control add_hold_time" value="" name="holdTime" value="${competition.holdTime}" placeholder="请选择时间">
                        </div>
                    </div>
                </div>
                <div class="row rowmargin col-sm-7">
                    <div class="form-group">
                        <label  class="col-sm-3 col-lg-2 control-label"><span class="red">*</span>举办地点:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control add_hold_address" name="holdAddress" value="${competition.holdAddress}" >
                        </div>
                    </div>
                </div>
                <div class="row rowmargin col-sm-7">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">
                            <font color="red">*</font>图片路径:
                        </label>
                        <div class="col-sm-9 form-inline">
                            <input id="tupian" readonly="readonly" name="url"
                                   value="${competition.url}"
                                   size="35"  class="form-control add_url"
                                   type="text" tip="请上传文件" />
                            <input type="button" value="上传" onclick="up('tupian',0)" />
                        </div>
                    </div>
                </div>

                <%--                结束--%>

                <div class="row  col-sm-7" style="text-align: center;">
                    <button type="submit" class="btn btn-primary modalSave" style="margin-top: 40px;">提交</button>
                    <button type="button" id="rebackBtn" class="btn btn-default"
                            style="margin-top: 40px; margin-left: 20px;">返回
                    </button>
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

        //   新建 保存按钮
        $(document).on("click",".modalSave",function(){

            // $("#exampleModal").modal("hide");
            let _obj = {};
            _obj.name = $(".add_name").val(); //名称
            _obj.add_content = $('.add_content').val()//简介
            _obj.add_info = $(".add_info").val(); //详情
            _obj.add_hold_time = $(".add_hold_time").val(); //举办时间
            _obj.add_hold_address = $(".add_hold_address").val(); //举办地点
            _obj.add_url = $(".add_url").val(); //图片路径

            if (_obj.name=="") {
                alert("请填写名称");return false;
            }
            if (_obj.add_content=="") {
                alert("请填写简介");return false;
            }
            if (_obj.add_info=="") {
                alert("请填写详情");return false;
            }
            if (_obj.add_hold_time=="") {
                alert("请选择举办时间");return false;
            }
            if (_obj.add_hold_address=="") {
                alert("请填写举办地点");return false;
            }
            if (_obj.add_url=="") {
                alert("请选择图片地址");return false;
            }

            $("#addForm").submit();

        });

        // $("#addForm").validate({
        //     submitHandler: function (form) {//验证通过后的执行方法
        //         form.submit();
        //     },
        //     rules: {
        //
        //     },
        //     messages: {
        //         uname: {
        //             required: '用户名不能为空',
        //             remote: '用户名已存在',
        //         },
        //         upwd: {
        //             required: '密码不能为空',
        //         },
        //     }
        // });
    })
    var pop;
    function up(fname, type) {
        pop = new Popup({
            contentType: 1,
            isReloadOnClose: false,
            width: 400,
            height: 200
        });
        pop.setContent("contentUrl", "<%=path %>/upload/upload.jsp?fname=" + fname + "&pt=" + type);
        pop.setContent("title", "文件上传");
        pop.build();
        pop.show();
    }
    function popupClose() {
        pop.close();
    }

</script>
</html>