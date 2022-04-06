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

		<title>企业招聘</title>
		<link href="<%=path%>/favicon.ico" type="image/x-icon" rel="shortcut icon" />
		
		<link rel="stylesheet" href="<%=path%>/web/css1/common.css" />
		<link rel="stylesheet" href="<%=path%>/web/css1/common1.css" />
		<link rel="stylesheet" type="text/css" href="<%=path%>/web/css1/index.css">
		<link property="stylesheet" rel="stylesheet" href="<%=path%>/web/css1/lianjiaim.css" />
		
		<link rel="stylesheet" href="<%=path%>/web/css/main.css" />
		<link rel="stylesheet" href="<%=path%>/web/css/index.css" />
		<script src="<%=path%>/js/jquery-3.4.1.min.js"></script>
		<style type="text/css">
			.sold{
				background: url(./images/sprite_user.png) no-repeat -54px -64px;
			    width: 59px;
			    height: 59px;
			    position: absolute;
			    top: 0;
			    right: 0;
			    display: inline-block;
			
			}
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
				全国大学生计算机博弈大赛
			</h3>
		</div>

		<div class="game_list_wrap">
			<div class="listboxwp">
				<div class="conwp">
					<div class="imgwp">
						<a href="<%=path%>/job_toView_web.action?id=1"  target="_blank" title="五子棋">
							<img class="trans" src="https://img1.baidu.com/it/u=89147825,2037667010&fm=253&fmt=auto&app=138&f=PNG?w=500&h=500" alt="五子棋" style="opacity: 1;">
						</a>
					</div>
					<h3>
						<a  target="_blank" title="五子棋">五子棋</a><span class="hvideo"></span>
					</h3>
					<p>五子棋是全国智力运动会竞技项目之一，是一种两人对弈的纯策略型棋类游戏。双方分别使用黑白两色的棋子，下在棋盘直线与横线的交叉点上，先形成五子连珠者获胜。</p>
					2022-04-02
					<span class="time">14:05:45</span><span class="from">来自：
					<a  target="_blank" class="gray">全国大学生计算机博弈大赛</a></span>
				</div>
			</div>
			<div class="listboxwp">
				<div class="conwp">
					<div class="imgwp">
						<a a href="<%=path%>/job_toView_web.action?id=2"  target="_blank" title="六子棋">
							<img class="trans" src="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fupload-images.jianshu.io%2Fupload_images%2F16218285-412c44c5b8751918.jpg&refer=http%3A%2F%2Fupload-images.jianshu.io&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1651720418&t=047bc20410f515faa028bccaa5ba2012" alt="六子棋" style="opacity: 1;">
						</a>
					</div>
					<h3>
						<a  target="_blank" title="六子棋">六子棋</a><span class="hvideo"></span>
					</h3>
					<p>六子棋的走法。六子棋是流传于中国民间的一类版图游戏。是一种双人对弈搏杀的一种游戏，交战双方棋子数均为六颗，故称六子棋。六子棋的棋盘为3乘以3的方格。棋子可信手拿来，只要互相区分即可。 六子棋，又名连六棋，为改良自五子棋一般规则及连珠棋规中“先手必胜”之不合理情况及国际棋规中之繁复规则。</p>
					2022-04-02
					<span class="time">14:05:45</span><span class="from">来自：
					<a  target="_blank" class="gray">全国大学生计算机博弈大赛</a></span>
				</div>
			</div>
		</div>


	<jsp:include page="../page/foot.jsp" />
	</body>
</html>