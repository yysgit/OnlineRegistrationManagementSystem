<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%
	String path = request.getContextPath();
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="Content-language" content="zh-CN">

		<title>大赛项目</title>
		<link href="<%=path%>/favicon.ico" type="image/x-icon" rel="shortcut icon" />
		
		<link rel="stylesheet" href="<%=path%>/web/css1/common.css" />
		<link rel="stylesheet" href="<%=path%>/web/css1/common1.css" />
		<link rel="stylesheet" type="text/css" href="<%=path%>/web/css1/index.css">
		<link property="stylesheet" rel="stylesheet" href="<%=path%>/web/css1/lianjiaim.css" />
		
		<link rel="stylesheet" href="<%=path%>/web/css/main.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/index.css" />
		<script src="<%=path%>/js/jquery-3.4.1.min.js"></script>
		<style type="text/css">
			.game_list_wrap{
				margin-bottom: 300px;
			}

			.listboxwp {
				width: 740px;
				padding: 27px 0;
				border-bottom: 1px solid #e7e7e7;
				font-size: 14px;
				color: #929291;
				position: relative;
				margin:0 auto;
			}

			.listboxwp .imgwp {
				width: 179px;
				height: 108px;
				float: left;
				margin: 6px 24px 20px 0;
				position: relative;
				overflow: hidden;
			}

			.listboxwp .imgwp a {
				display: block;
			}

			.listboxwp .imgwp img {
				width: 100%;
				height: 108px;
			}

			.listboxwp .imgwp:hover img {
				-webkit-transform: scale(1.06);
				transform: scale(1.06);
			}

			.listboxwp h3 {
				font-size: 18px;
				height: 18px;
				margin-bottom: 20px;
				line-height: 24px;
				height: 24px;
				margin-bottom: 14px;
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis;
				font-weight: bold;
			}
			.listboxwp h3 a:hover {
				color: #ff6600;
			}
			.listboxwp h3 .obvioussina {
				margin-left: 14px;
			}

			.listboxwp h3 a.org {
				font-size: 14px;
				font-weight: normal;
			}

			.listboxwp .conwp {
				overflow: hidden;
				margin-bottom: 17px;
			}

			.listboxwp i {
				font: 8px "SimSun", "宋体";
				padding: 0 12px;
				color: #c6c6c6;
			}

			.listboxwp p {
				line-height: 26px;
				margin-bottom: 17px;
				color: #666565;
				max-height: 52px;
				margin: 0 0 15px 0;
				overflow: hidden;
			}

			.listboxwp .time {
				padding: 0 55px 0 5px;
			}

			.listboxwp .from {
				padding: 0 50px 0 13px;
			}

			.listboxwp span.share {
				margin: 0 8px;
			}

			.listboxwp a.share {
				margin: 0 8px;
			}

			.listboxwp>a.gray {
				margin-right: 6px;
			}

			.listboxwp span.gray {
				font-size: 14px;
				color: #929291;
				vertical-align: -2px;
				font-weight: normal;
			}

			.listboxwp .conimgwp {
				height: 108px;
				margin-bottom: 17px;
				padding-top: 6px;
				overflow: hidden;
			}

			.listboxwp .conimgwp a {
				margin-right: 5px;
				overflow: hidden;
				float: left;
			}

			.listboxwp .conimgwp img {
				height: 100%;
				transition: all 1s;
			}

			.listboxwp .conimgwp a img:hover {
				transform: scale(1.1);
			}

			.listboxwp .bigitem {
				height: 219px;
				overflow: hidden;
				margin-bottom: 17px;
			}

			.listboxwp .bigitem p {
				margin-bottom: 13px;
			}

			.listboxwp .bigimgwp {
				width: 267px;
				height: 210px;
				float: left;
				margin: 6px 24px 20px 0;
				position: relative;
				overflow: hidden;
			}

			.listboxwp .bigimgwp img {
				width: 100%;
				height: 100%;
			}

			.listboxwp .bigimgwp:hover img {
				transform: scale(1.06);
			}

			.listboxwp .bigitem ul {
				padding-top: 13px;
			}

			.listboxwp .bigitem ul li {
				float: left;
				margin-right: 10px;
				text-align: center;
				color: #929291;
			}

			.listboxwp .bigitem ul li .smallimg {
				display: block;
				width: 111px;
				height: 70px;
				overflow: hidden;
				margin-bottom: 6px;
			}

			.listboxwp .bigitem ul li img {
				width: 111px;
				height: 70px;
				display: block;
				transition: all 1s;
			}

			.listboxwp .bigitem ul li a:hover img {
				transform: scale(1.1);
			}

			.listboxwp .bigitem ul li a.gray {
				color: #666565;
			}

			.listboxwp .bigitem ul li a.gray:hover {
				color: #ff6600;
			}
			.all-list-name{
				padding-top: 70px;
				font-size: 45px;
				line-height: 1.08349;
				font-weight: 600;
				text-align: center;
			}
		</style>
		
		<script language=JavaScript>
			function serlist(servalue,temp){
				
				if(temp==1){
					document.getElementById("catelogid").value = servalue;
				}else if(temp==2){
					document.getElementById("xinzIndex").value = servalue;
				}else if(temp==4){
					document.getElementById("xueli").value = servalue;
				}
	        	  
	        	   
				document.formAdd.submit();
			}
			function ser(){
				document.formAdd.submit();
			}
		</script>	
	</head>
	<body>
		<jsp:include page="../page/head.jsp" />


		<div class="content w1150" id="content">
			<h3 class="all-list-name">
				${sessionScope.projectList[0].competitionName}
			</h3>
		</div>

		<div class="game_list_wrap">


			<c:forEach items="${sessionScope.projectList}" var="project" varStatus="var">
			<div class="listboxwp">
				<div class="conwp">
					<div class="imgwp">
						<a href="<%=path%>/job_toView_web.action?id=${project.id}"  target="_blank" title="${project.name}">
							<img class="trans" src="${project.url}" alt="${project.name}" style="opacity: 1;">
						</a>
					</div>
					<h3>
						<a  target="_blank" title="${project.name}">${project.name}</a><span class="hvideo"></span>
					</h3>
					<p>${project.content}</p>
						${project.name}
					<span class="from">来自：
					<a  target="_blank" class="gray">${project.competitionName}</a></span>
				</div>
			</div>
			</c:forEach>
		</div>


	<jsp:include page="../page/foot.jsp" />
	</body>
</html>