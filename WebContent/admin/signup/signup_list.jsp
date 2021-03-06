<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<%=path%>/css/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/css/left.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/css/pdmcontent01.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=path%>/js/jquery-3.4.1.min.js"></script>
    <script language="javascript" type="text/javascript" src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
    <script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery-pdm.js"></script>

    <script language="javascript" type="text/javascript" src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=path %>/js/popup.js"></script>
    <link href="<%=path%>/css/pdmcontent01.css" rel="stylesheet">

    <title>大赛报名信息</title>
</head>
<body>
<div class="page-content">

    <c:if test="${sessionScope.utype==1}">
        <button class="btn btn-success" onclick="payInfo()">付费</button>
    </c:if>


    <form action="<%=path%>/signup_list.action" class="form-inline" method="post">
        <div class="panel panel-default">
            <div class="panel-heading">大赛报名信息列表</div>
            <div class="panel-body">
                <div class="pull-left">
                    <div class="form-group qinfo">
                        <label>程序中文名：</label>
                        <input name="programName" class="form-control">
                    </div>

                    <button type="submit" class="btn btn-default">查询</button>

                </div>
            </div>
            <pg:pager url="signup_list.action" items="${itemSize}" maxPageItems="${pageItem}"
                      maxIndexPages="${pageItem}" isOffset="${true}" export="offset,currentPageNumber=pageNumber"
                      scope="request">


                <div class="table-responsive">
                    <table class="table table-striped table-hover" style="text-align: center;">
                        <thead>
                        <tr>
                            <td>大赛项目</td>
                            <td>程序中文名</td>
                            <td>程序英文名</td>
                            <td>参赛人数</td>
                            <td>参赛账号</td>
                            <td>参赛队伍</td>
                            <td>联系方式</td>
                            <td>队长名称</td>
                            <td>指导老师</td>
                            <td>参赛队员</td>
                            <td>参赛学校</td>
                            <td>参赛单位</td>
                            <td>创建人</td>
                            <td>审核状态</td>
                            <th width="12%">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="info">
                            <tr>
                                <td>${info.projectName}</td>
                                <td>${info.programName}</td>
                                <td>${info.programEngName}</td>
                                <td>${info.peopleNum}</td>
                                <td>${info.participatingAccount}</td>
                                <td>${info.ranks}</td>
                                <td>${info.phoneNum}</td>
                                <td>${info.captain}</td>
                                <td>${info.instructor}</td>
                                <td>${info.contestants}</td>
                                <td>${info.schoolName}</td>
                                <td>${info.company}</td>
                                <td>${info.createUserName}</td>
                                <c:if test="${info.url ==null || info.url ==''}">
                                <td><a href="${info.url}"> 暂无附件 </a>
                                    </c:if>
                                    <c:if test="${info.url !=null && info.url !=''}">
                                <td><a href="${info.url}"> 下载附件 </a>
                                    </c:if>

                                </td>
                                <td>${
                                        info.status==0?'未审核':
                                                info.status==1?'学校已审核':
                                                        info.status==2?'已付款':
                                                                info.status==3?'组委已审核':''
                                        }</td>
                                <td>

                                    <a href="javascript:;" onclick="auditInfo('${info.id}','${info.status}')"
                                       class="btn btn-info btn-xs">
                                        <span class="glyphicon glyphicon-edit"></span>
                                        审核通过
                                    </a>
                                    <a href="javascript:;" onclick="delInfo('${info.id}')"
                                       class="btn btn-danger btn-xs">
                                        <span class="glyphicon glyphicon-trash"></span>
                                        删除
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="panel-footer clearfix">
                            <%--							<div class="pull-left">--%>
                            <%--								<button type="button" id="addBtn" class="btn btn-info">新增</button>--%>
                            <%--							</div>--%>
                        <nav class="pull-right"><pg:index>
                            <jsp:include page="/common/pagination_tag.jsp" flush="true"/>
                        </pg:index></nav>
                    </div>
                </div>
            </pg:pager>
        </div>
    </form>

</div>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $("#addBtn").click(function () {
            window.location.href = '<%=path%>/signup_toAdd.action';
        });
    });

    function delInfo(id) {
        if (confirm("是否确认删除？")) {
            window.location.href = '<%=path%>/signup_delete.action?id=' + id;
        }
    }

    function auditInfo(id, status) {
        if (confirm("是否确认审核？")) {
            window.location.href = '<%=path%>/signup_school_audit.action?id=' + id + "&statusOld=" + status;
        }
    }

    function payInfo(id) {
        if (confirm("是否确认付费所有审核的报名？")) {
            window.location.href = '<%=path%>/signup_school_pay.action';
        }
    }


</script>