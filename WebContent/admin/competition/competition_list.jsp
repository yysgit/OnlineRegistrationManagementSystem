<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
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
<title>管理员信息</title>
</head>
<body>
	<div class="page-content">
		<form action="<%=path%>/tadmin_list.action" class="form-inline" method="post">
			<div class="panel panel-default">
				<div class="panel-heading">管理员信息列表</div>
				<div class="panel-body">
					<div class="pull-left">
						<div class="form-group qinfo">
							<label>大赛名称：</label>
							<input name="uname"  class="form-control">
						</div>
					 
						<button type="submit" class="btn btn-default">查询</button>
					</div>
				</div>
				<pg:pager url="tadmin_list.action" items="${itemSize}" maxPageItems="${pageItem}" maxIndexPages="${pageItem}" isOffset="${true}" export="offset,currentPageNumber=pageNumber" scope="request">

					<div class="table-responsive">
						<table class="table table-striped table-hover" style="text-align: center;">
							<thead>
								<tr>
									<td>标题名称</td>
									<td>举办时间</td>
									<td>举办地点</td>
									<td>类型</td>
									<td>描述</td>
									<th width="12%">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="info">
									<tr>
										<td>${info.name}</td>
										<td>${info.holdTime}</td>
										<td>${info.holdAddress}</td>
										<td>${info.type==0?"只面向大学生":"其他"}</td>
										<td style="width: 30%">${info.content}</td>
										<td>
											<a href="<%=path%>/competition_toUpdate.action?id=${info.id}"
											   class="btn btn-info btn-xs">
												<span class="glyphicon glyphicon-edit"></span>
												编辑
											</a>
											<a href="javascript:;" onclick="delInfo('${info.id}')" class="btn btn-danger btn-xs">
												<span class="glyphicon glyphicon-trash"></span>
												删除
											</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="panel-footer clearfix">
							<div class="pull-left">
								<button type="button" id="addBtn" class="btn btn-info">新增</button>
							</div>
							<nav class="pull-right"> <pg:index>
								<jsp:include page="/common/pagination_tag.jsp" flush="true" />
							</pg:index> </nav>
						</div>
					</div>
				</pg:pager>
			</div>
		</form>
	</div>
</body>
</html>
<script type="text/javascript">
$(document).ready(function(){
   $("#addBtn").click(function(){
        window.location.href = '<%=path%>/competition_toAdd.action';
   });
});
function delInfo(id){
	 if(confirm("是否确认删除？")){
	     window.location.href = '<%=path%>/competition_delete.action?id=' + id;
	 }
	}
</script>