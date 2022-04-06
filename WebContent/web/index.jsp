<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%
	String path = request.getContextPath();
%>
<!-- saved from url=(0030)https://xa.lianjia.com/zufang/ -->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="Content-language" content="zh-CN">
		<title>网上求职招聘</title>
		<link href="<%=path%>/favicon.ico" type="image/x-icon"
			rel="shortcut icon" />
		<link rel="stylesheet" href="<%=path%>/web/css/main.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/index.css" />
		<script src="<%=path%>/js/jquery-3.4.1.min.js"></script>
		<style>

			.game-wrap{
				position: relative;
				max-width: 1200px;
				margin:0 auto;
				margin-bottom:130px;
				border: 2px solid #f0dfe5;
				border-radius: 3px;
				margin-top: 150px;
			}
			.game-wrap .game-cont{
				min-height: 300px;
			}
			.game-wrap:hover{
				-moz-box-shadow: 2px 1px 23px #f0dfe5;
				-webkit-box-shadow: 2px 1px 23px #f0dfe5;
				box-shadow: 2px 1px 23px #f0dfe5;
				text-shadow:0px 0px 1px #ad8aad;
			}

			.game-image-wrapper{
				position: absolute;
				top: 0;
				left: 0;
				height: 100%;
				width: 100%;
				z-index: -1;
			}
			.game-cont .game-msg-cont{
				padding-top: 61px;
				text-align: center;
			}
			.game-msg-cont .headline{
				font-size: 45px;
				line-height: 1.08349;
				font-weight: 600;
				text-align: center;
			}
			.game-msg-cont .subhead{
				margin-top: 8px;
				font-size: 24px;
				line-height: 1.17;
				font-weight: 400;
				text-align: center;
			}
			a, .link {
				color: #036cd5;
				letter-spacing: inherit;
			}
			.game-links{
				display: inline-block;
				text-align: center;
				font-size: 19px;
				line-height: 1.21053;
				font-weight: 400;
				letter-spacing: .012em;
				padding-left: 0.6em;
				margin-top: 0.74em;
			}

			.game-links a:hover {
				text-decoration: underline;
			}
			.game-links a:not(:only-child):not(:first-child) {
				margin-left: 32px;
			}
			.unit-image {
				margin: 0;
				padding: 0;
				width: 1186px;
				height: 302px;
				background-size: 1186px 302px;
				background-repeat: no-repeat;

			}
			.game-image-wrapper{
				position: absolute;
				top: 0;
				left: 0;
				height: 100%;
				width: 100%;
			}

			.city-site #game-wrap .common-tab-box ul.cur {
				display: block;
				font-weight: 400;
				width: 100%;
				overflow: hidden;
				display: flex;
				align-items: center;
				width: 100%;
				flex-wrap: wrap;
				justify-content: space-between;
			}
			.city-site #game-wrap .merge-city-job ul li {
				margin: 0;
				margin-bottom: 15px;
			}
			#game-wrap .common-tab-box ul.cur .game—name{
				text-align: center;
				font-size: 20px;
				padding-top: 25px;
			}
		</style>

	</head>
	<body class="home-body city-site">
		<div id="wrap">
			<!-- header begin -->
			<jsp:include page="page/head.jsp" />
			<!-- header end -->
<%--			<div class="fast-register-box top-sign-box">--%>
<%--				<div class="inner home-inner">--%>
<%--					<img--%>
<%--						src="<%=path%>/web/images/fast-reg.png"--%>
<%--						class="icon-tip"/>--%>
<%--					<div class="step-form">--%>
<%--                        <img src="<%=path%>/web/images/fast-reg-text.png">--%>
<%--                        <a href="<%=path%>/user_toUpdate_web.action" class="btn btn-dialog-upload btn-to-upload" >制作11你的简历</a>--%>
<%--                	</div>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--			<div class="column-search-panel">--%>
<%--				<div class="inner home-inner">--%>
<%--					<div class="search-box">--%>
<%--						<div class="search-form ">--%>
<%--							<form action="<%=path%>/job_list_web.action" method="post" class="">--%>

<%--								<div class="search-form-con">--%>
<%--									<p class="ipt-wrap">--%>
<%--										<input type="text" name="name" class="ipt-search"--%>
<%--											maxlength="50" autocomplete="off" placeholder="搜索职位" />--%>
<%--									</p>--%>
<%--								</div>--%>

<%--								<button class="btn btn-search" type="submit">--%>
<%--									搜索--%>
<%--								</button>--%>

<%--							</form>--%>
<%--						</div>--%>
<%--						<div class="search-hot">--%>
<%--							<b>热门职位:</b>--%>
<%--							<a href="<%=path%>/job_list_web.action?catelogid=14"><b>JAVA开发</b></a>--%>
<%--							<a href="<%=path%>/job_list_web.action?catelogid=13">UI设计师</a>--%>

<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--			</div>--%>
			<div class="game-wrap" id="game-wrap">
				<div class="game-cont">
					<div class="game-msg-cont">
						<h2 class="headline">全国大学生计算机博弈大赛</h2>
						<h3 class="subhead" role="presentation">仅面向在校大学生</h3>

						<div class="game-links">
							<a class="btn btn-outline" href="<%=path%>/job_list_web.action">进一步了解</a>
							<a class="icon more icon-chevronright" href="javascript:;" target="_self" rel="follow" >报名</a>
						</div>
					</div>
				</div>
				<div class="game-image-wrapper">
					<figure class="unit-image unit-image-iphone-13-pro-hero-iphone13pro-avail">
					</figure>
				</div>
			</div>

			<div class="game-wrap">
				<div class="game-cont">
					<div class="game-msg-cont">
						<h2 class="headline">全国计算机博弈锦标赛</h2>
						<h3 class="subhead" role="presentation"></h3>

						<div class="game-links">
							<a class="btn btn-outline" href="<%=path%>/job_list_web.action">进一步了解</a>
							<a class="icon more icon-chevronright" href="javascript:;" target="_self" rel="follow" >报名</a>
						</div>
					</div>

				</div>
				<div class="game-image-wrapper">
					<figure class="unit-image">
					</figure>
				</div>
			</div>
		</div>




		<jsp:include page="page/foot.jsp" />
	</body>
</html>