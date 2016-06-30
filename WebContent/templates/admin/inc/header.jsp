<%@page import="bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>Xây dựng website giới thiệu bản thân</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/admin/css/styles.css" media="screen" />
        <!-- Insert library ckeditor into textarea -->
        <script type = "text/javascript" src = "<%=request.getContextPath()%>/templates/admin/ckeditor/ckeditor.js"></script>
        <script type = "text/javascript" src = "<%=request.getContextPath()%>/templates/admin/js/jquery-2.1.1.min.js"></script>
        <script type = "text/javascript" src = "<%=request.getContextPath()%>/templates/admin/js/jquery.validate.js"></script>       
	</head>
	<body>
    	<!-- Header -->
        <div id="header">
            <!-- Header. Status part -->
            <div id="header-status">
                <div class="container_12">
                    <div class="grid_4">
                    	<ul class="user-pro">
                    		<%
                    			User objUser = (User)session.getAttribute("objUser");
                    			if(objUser != null){
                    				%>
                    					<li><a href="<%=request.getContextPath()%>/admin/dang-xuat">Logout</a></li>
                    					<li>Chào <a><%=objUser.getFullname()%></a></li>
                    				<%
                    			}else{
                    				%>
                    					<li><a href="<%=request.getContextPath()%>/admin/dang-nhap">Login</a></li>
                    					<li>Chào Bạn</a></li>
                    				<%
                    			}
                    		%>
                    	</ul>
                    </div>
                </div>
                <div style="clear:both;"></div>
            </div> <!-- End #header-status -->
            
            <!-- Header. Main part -->
            <div id="header-main">
                <div class="container_12">
                    <div class="grid_12">
                        <div id="logo">
                            <ul id="nav">
                                <li id="current"><a href="<%=request.getContextPath()%>/admin">Quản trị</a></li>
                                <li><a href="<%=request.getContextPath()%>/admin/nguoi-dung">Tài khoản</a></li>
                            </ul>
                        </div><!-- End. #Logo -->
                    </div><!-- End. .grid_12-->
                    <div style="clear: both;"></div>
                </div><!-- End. .container_12 -->
            </div> <!-- End #header-main -->
            <div style="clear: both;"></div>
            <!-- Sub navigation -->
            <div id="subnav">
                <div class="container_12">
                    <div class="grid_12">
                        <ul>
                            <li><a class = "btn btn-primary" href="<%=request.getContextPath()%>/admin/gioi-thieu">Giới thiệu</a></li>
                            <li><a class = "btn btn-primary" href="<%=request.getContextPath()%>/admin/du-an">Dự án thực hiện</a></li>
                            <li><a class = "btn btn-primary" href="<%=request.getContextPath()%>/admin/danh-muc">Danh mục</a></li>
                            <li><a class = "btn btn-primary" href="<%=request.getContextPath()%>/admin/tin-tuc">Tin tức</a></li>
                            <li><a class = "btn btn-primary" href="<%=request.getContextPath()%>/admin/nguoi-dung">Người dùng</a></li>
                            <li><a class = "btn btn-primary" href="<%=request.getContextPath()%>/admin/lien-he">Liên hệ</a></li>
                            <li><a class = "btn btn-primary" href="<%=request.getContextPath()%>/admin/cau-noi">Câu nói hay</a></li>
                            <li><a class = "btn btn-primary" href="<%=request.getContextPath()%>/admin/quang-cao ">Quảng cáo</a></li>
                        </ul>                        
                    </div><!-- End. .grid_12-->
                </div><!-- End. .container_12 -->
                <div style="clear: both;"></div>
            </div> <!-- End #subnav -->
        </div> <!-- End #header -->
		<div class="container_12">