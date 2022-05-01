<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<!-- saved from url=(0041)http://account.lvye.cn/accounts/register/ -->
<html xmlns:wb="http://open.weibo.com/wb">
<!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-language" content="zh-CN">

    <title>报名</title>
    <link href="<%=path%>/favicon.ico" type="image/x-icon"
          rel="shortcut icon"/>
    <script src="<%=path%>/js/jquery-3.4.1.min.js"></script>
    <script src="<%=path%>/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=path%>/js/jquery.validate.min.js"></script>
    <script src="<%=path%>/js/jquery.validate.extend.js"></script>
    <script src="<%=path%>/js/jquery.validate.method.js"></script>
    <script language="javascript" type="text/javascript"
            src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" href="<%=path%>/web/css1/common.css"/>
    <link rel="stylesheet" href="<%=path%>/web/css1/tools.css"/>

    <link rel="stylesheet" href="<%=path%>/web/css/main.css"/>


</head>

<body class="page-sign">
<div id="wrap">
    <!-- header begin -->
    <jsp:include page="page/head.jsp"/>
    <!-- header end -->

    <!-- container begin -->
    <div class="mainContent">
        <div class="registerbox">

            <h1>登记报名详情信息</h1>

            <div class="toolContent">
                <form method="post" action="<%=path%>/signup_addPage.action" id="addForm"
                      name="addForm" class="registerform" style="display: block;">
                    <div style="    width: 600px;">

                        <%--	peopleNum   //参赛人数--%>
                        <%--	competitionTime  //参赛时间--%>
                        <%--	competitionLocation //竞赛地点--%>
                        <%--	registrationTime  //报名时间--%>
                        <%--	participatingAccount //参赛账号--%>
                        <%--	ranks   //参赛队伍--%>
                        <%--	phoneNum  //联系方式--%>
                        <%--	captain  // 队长名称--%>
                        <%--	instructor  //指导老师--%>
                        <%--	contestants // 参赛队员--%>

                        <input name="projectId" type="hidden" value="${projectId}"/>
                        <div class="calculatorItem">
                            <label class="itemTitle">
                                程序中文名：
                            </label>
                            <div class="u-select">
                                <input type="text" class="u-select-selected"
                                       name="programName" id="programName" maxlength="20" placeholder="程序中文名"/>

                            </div>
                        </div>
                        <div class="calculatorItem">
                            <label class="itemTitle">
                                程序英文名：
                            </label>
                            <div class="u-select">
                                <input type="text" class="u-select-selected"
                                       name="programEngName" id="programEngName" maxlength="20" placeholder="程序英文名"/>

                            </div>
                        </div>
                        <div class="calculatorItem">
                            <label class="itemTitle">
                                竞赛人数：
                            </label>
                            <div class="u-select">
                                <input type="text" class="u-select-selected"
                                       name="peopleNum" id="peopleNum" maxlength="20" placeholder="竞赛人数"/>

                            </div>
                        </div>

                        <div class="calculatorItem">
                            <label class="itemTitle">
                                参赛账号：
                            </label>
                            <div class="u-select">
                                <input type="text" class="u-select-selected"
                                       name="participatingAccount" id="participatingAccount" maxlength="20"
                                       placeholder="参赛账号"/>
                            </div>
                        </div>

                        <div class="calculatorItem">
                            <label class="itemTitle">
                                参赛队伍：
                            </label>
                            <div class="u-select">
                                <input type="text" class="u-select-selected"
                                       name="ranks" id="team" maxlength="20" placeholder="参赛队伍"/>
                            </div>
                        </div>

                        <div class="calculatorItem">
                            <label class="itemTitle">
                                联系方式：
                            </label>
                            <div class="u-select">
                                <input type="text" class="u-select-selected" name="phoneNum"
                                       id="phoneNum" maxlength="11" placeholder="请输入手机号码">
                            </div>
                        </div>

                        <div class="calculatorItem">
                            <label class="itemTitle">
                                队长姓名：
                            </label>
                            <div class="u-select">
                                <input type="text" class="u-select-selected"
                                       name="captain" id="captain" maxlength="20" placeholder="队长姓名"/>
                            </div>
                        </div>

                        <div class="calculatorItem">
                            <label class="itemTitle">
                                指导教师：
                            </label>
                            <div class="u-select">
                                <input type="text" class="u-select-selected"
                                       name="instructor" id="instructor" maxlength="20" placeholder="指导教师"/>
                            </div>
                        </div>

                        <div class="calculatorItem">
                            <label class="itemTitle">
                                参赛队员：
                            </label>
                            <div class="u-select">
                                <input type="text" class="u-select-selected"
                                       name="contestants" id="contestants" maxlength="20" placeholder="参赛队员"/>
                            </div>
                        </div>

                        <div class="calculatorItem">
                            <label class="itemTitle">
                                学校：
                            </label>
                            <div class="u-select">
                                <select name="schoolId" class="form-control">
                                    <c:forEach items="${schoolList}" var="school">
                                        <option value="${school.id}"> ${school.name} </option>
                                    </c:forEach>
                                </select>

                            </div>
                        </div>

                        <div class="calculatorItem">
                            <label class="itemTitle">
                                单位：
                            </label>
                            <div class="u-select">
                                <input type="text" class="u-select-selected"
                                       name="company" id="company" maxlength="20" placeholder="单位(社会人士填写)"/>
                            </div>
                        </div>

                        <div class="calculatorBtn">
                            <button type="submit">立即报名</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function () {

        //programName  中文名
        //programEngName  英文名
        // peopleNum   //参赛人数
        // participatingAccount //参赛账号
        // ranks   //参赛队伍
        // phoneNum  //联系方式
        // captain  // 队长名称
        // instructor  //指导老师
        // contestants // 参赛队员
        $("#addForm").validate({
            submitHandler: function (form) { //验证通过后的执行方法
                form.submit();
            },
            rules: {


                programName: {
                    required: true,
                },
                programEngName: {
                    required: true,
                },

                peopleNum: {
                    required: true,
                },

                participatingAccount: {
                    required: true,
                },
                ranks: {
                    required: true,
                },
                phoneNum: {
                    required: true,
                    telphone: true,
                },
                captain: {
                    required: true,
                },
                instructor: {
                    required: true,
                },
                contestants: {
                    required: true,
                },
            },
            //programName  中文名
            //programEngName  英文名

            messages: {


                programName: {
                    required: '请输入中文名',
                },
                programEngName: {
                    required: '请选择英文名',
                },

                peopleNum: {
                    required: '请输入参赛赛人数',
                },

                participatingAccount: {
                    required: '请输入参赛账号',
                },
                ranks: {
                    required: '请输入参赛队伍',
                },
                phoneNum: {
                    required: '联系电话不能为空',
                },
                captain: {
                    required: '请输入队长姓名',
                },
                instructor: {
                    required: '请输入指导教师',
                },
                contestants: {
                    required: '请输入参赛队员',
                },
            }
        });
    });
</script>


</html>