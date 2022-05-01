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
<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
<title>学校信息</title>

</head>
<body>
	<div class="page-content">
		<form action="<%=path%>/project_list.action" class="form-inline" method="post">
			<div class="panel panel-default">
				<div class="panel-heading">学校信息列表</div>
				<div class="panel-body">
					<div class="pull-left">
						<div class="form-group qinfo">
							<label>名称：</label>
							<input name="uname" value="${uname}" class="form-control">
						</div>
						<button type="submit" class="btn btn-default">查询</button>
					</div>
				</div>
				<pg:pager url="tadmin_list.action" items="${itemSize}" maxPageItems="${pageItem}" maxIndexPages="${pageItem}" isOffset="${true}" export="offset,currentPageNumber=pageNumber" scope="request">
					<pg:param name="uname" value="${uname}" />
					<pg:param name="upwd" value="${upwd}" />
					<div class="table-responsive">
<%--						name profile                     --%>
						<table class="table table-striped table-hover table-bordered" style="text-align: center;">
							<thead>
								<tr>
									<td>名称</td>
									<td>学校简介</td>
									<th width="12%">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="info">
									<tr>
										<td>${info.name}</td>
										<td class="text_break">${info.profile}</td>
										<td>
<%--											<a href="<%=path%>/tadmin_toUpdate.action?id=${info.id}" class="btn btn-info btn-xs">--%>
<%--												<span class="glyphicon glyphicon-edit"></span>--%>
<%--												编辑--%>
<%--											</a>--%>
	                                        <button type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#exampleModal" data-whatever="edit" data-type="'${info.id}'">
												<span class="glyphicon glyphicon-edit"></span>	编辑
											</button>
											<a href="javascript:void();" onclick="delInfo('${info.id}')" class="btn btn-danger btn-xs">
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
<%--								<button type="button" id="addBtn" class="btn btn-info">新增</button>--%>
								<button type="button" class="btn btn-info" data-toggle="modal" data-target="#exampleModal" data-whatever="add" data-type="活动数据">新增</button>
							</div>

							<nav class="pull-right"> <pg:index>
								<jsp:include page="/common/pagination_tag.jsp" flush="true" />
							</pg:index> </nav>
						</div>
					</div>
				</pg:pager>
			</div>
		</form>
		<input type="hidden" value="" class="model_hidden">
		<div class="modal fade in" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="exampleModalLabel">添加</h4>
					</div>
					<div class="modal-body">
<%--						name content  info hold_time hold_address  url  competition_id--%>
						<form class="form-horizontal">
							<input type="hidden" name="" value="0">
							<div class="form-group">
								<label  class="col-sm-3 col-lg-2 control-label"><span class="red">*</span>名称:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control add_name" >
								</div>
							</div>
							<div class="form-group">
								<label  class="col-sm-3 col-lg-2 control-label"><span class="red">*</span>简介:</label>
								<div class="col-sm-8">
									<textarea class="form-control add_profile" rows="6" ></textarea>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success modalSave" >保存</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
$(document).ready(function(){
	var rootPath = "<%=path%>";
   $("#addBtn").click(function(){
        window.location.href = '<%=path%>/tadmin_toAdd.action';
   });

	function delInfo(id){
		if(confirm("是否确认删除？")){
			window.location.href = '<%=path%>/tadmin_delete.action?id=' + id;
		}
	}

// 模态窗口管理显示的时候触发的时间
	$('#exampleModal').on('show.bs.modal', function (event) {
		let button = $(event.relatedTarget) // 触发模态的按钮 .relatedTarget 事件属性返回与事件的目标节点相关的节点
		let recipient = button.data('whatever'); // button的data-whatever属性。 from data-* attributes
		let _id= button.data('type');
		$('.model_hidden').val(recipient);
		// 如果需要，您可以在此处启动AJAX请求（然后在回调中进行更新）。
		// 根据状态判断是新建和编辑
		let modal = $(this);
		let _title = recipient=='edit'?'编辑':'新增'
		modal.find('.modal-title').text(_title);
		console.log(_id,recipient,rootPath,22);

		if(recipient=='edit'){

			let _obj = {
				id:_id
			}
			// 编辑
			$.ajax({
				url: `${rootPath}/tadmin_toUpdate.action?id=${_id}`,
				type: 'get',
				dataType: 'json',
				data: _obj,
			})
					.done(function(res) {
						if (res.errcode==0) {
							window.location.reload(true);
						} else {
							alert(res.errmsg);
						}
						cearModel()
					})
					.fail(function() {
						console.log("请求失敗");
					});
		}

	});

	function editModel(info) {
		console.log(info);
	}

//   新建 保存按钮
	$(document).on("click",".modalSave",function(){
		// add_name   add_hold_time  add_hold_address add_type add_content
		// $("#exampleModal").modal("hide");
		let _obj = {};
		_obj.name = $(".add_name").val();
		_obj.hold_time = $('.add_hold_time').val();
		_obj.hold_address = $(".add_hold_address").val();
		_obj.type = $(".add_type").find('option:selected').val();
		_obj.content = $(".add_content").val();
		let _modelType = $(".model_hidden").val();
		console.log(_obj,"数据",_modelType);

		if (_obj.name=="") {
			alert("请填写标题名称");return false;
		} else if (_obj.hold_time==""){
			alert("请选择举办时间");return false;
		}else if (_obj.hold_address==""){
			alert("请填写举办地点");return false;
		}else if (_obj.type==""){
			alert("请选择类型");return false;
		}else if (_obj.content==""){
			alert("请填写描述");return false;
		};

		if(_modelType=='add'){
			// 新增
			$.ajax({
				url: '/tadmin_list.action',
				type: 'POST',
				dataType: 'json',
				data: _obj,
			}).done(function(res) {
				if (res.errcode==0) {
					window.location.reload(true);
				} else {
					alert(res.errmsg);
				}
				cearModel()
			})
					.fail(function() {
						console.log("请求失敗");
					});
		}
		if(_modelType=='edit'){
			// 新增
			$.ajax({
				url: '/tadmin_list.action',
				type: 'POST',
				dataType: 'json',
				data: _obj,
			}).done(function(res) {
				if (res.errcode==0) {
					window.location.reload(true);
				} else {
					alert(res.errmsg);
				}
				cearModel()
			})
					.fail(function() {
						console.log("请求失敗");
					});
		}





	});

	function cearModel(params) {
		$(".add_name").val("");
		$('.add_hold_time').val("");
		$(".add_hold_address").val("");
		$(".add_type").val("");
		$(".add_content").val("");
	}

});

</script>