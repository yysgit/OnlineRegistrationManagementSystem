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

		<title>项目详情</title>
		<link href="<%=path%>/favicon.ico" type="image/x-icon"
			rel="shortcut icon" />
		
		<link rel="stylesheet" href="<%=path%>/web/css/main.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/index.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/job_v.css" />
		<script src="<%=path%>/js/jquery-3.4.1.min.js"></script>

		<script language=JavaScript>
			function toToudi(jobid){
				<c:if test="${sessionScope.user==null}">
	       		var url = "<%=path%>/web/login.jsp";
	       		window.location.href=url;
		        </c:if>
				
				
		        <c:if test="${sessionScope.user!=null}">
			        <c:if test="${sessionScope.user.state==0}">
		        	return;
			        </c:if>
			        <c:if test="${sessionScope.user.state==1}">
		        	var url ="<%=path%>/web/signup.jsp";
			 		window.location.href=url;
			 		</c:if>
		         </c:if>
			} 
		</script>


	</head>
	<body class="page-white">
		<div id="wrap">
		<jsp:include page="../page/head.jsp" />
		<div d="main">
			<div class="job-banner">
				<div class="inner home-inner" >
					<div class="job-primary detail-box" >
						<div class="info-primary">
	                        <div class="job-status"><span>火热报名中...</span></div>
	                        <div class="name">
	                            <h1>${sessionScope.project.name}</h1>
	                            <span class="from" style="font-size: 16px">来自：${sessionScope.project.competitionName}</span>
	                        </div>
	                    </div>
	                    <div class="job-op" style="margin-top: -20px;">
	                    	<c:if test="${is_offer!=1}">
	                    	<div class="btn-container">
                            	<!-- 未注册 -->
	                     		<a  class="btn btn-startchat" onclick="toToudi(${job.id})" >去报名</a>
	                        </div>
	                        </c:if>
	                    </div>
	                 </div>  
	            </div> 
	    	</div> 
			<div class="job-box" >
				<div class="inner home-inner">
					<div class="job-sider">
						<div class="promotion-img">
	                        <a ><img src="${sessionScope.project.url}" ></a>
	                    </div>
					
					</div>
					<div class="job-detail">
						<div class="detail-content">
							<div class="job-sec">
	                            <h3>${sessionScope.project.name}</h3>
	                            <div class="text">
									${sessionScope.project.content}
								</div>
	                        </div>
						</div>
						<div class="detail-content">
							<div class="job-sec">
	                            <h3>比赛要求</h3>
	                            <div  style="white-space:pre-wrap;">
									${sessionScope.project.info}
	                            </div>
	                        </div>
						</div>
					</div>
				</div>
			</div>
		</div>






		<jsp:include page="../page/foot.jsp" />
	</body>
</html>