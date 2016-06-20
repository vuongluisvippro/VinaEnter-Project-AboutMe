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
                    		<li><a></a></li>
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
                                <li id="current"><a href="#">Quản trị</a></li>
                                <li><a href="#">Tài khoản</a></li>
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
                            <li><a class = "btn btn-primary" href="#">Giới thiệu</a></li>
                            <li><a class = "btn btn-primary" href="#">Dự án thực hiện</a></li>
                            <li><a class = "btn btn-primary" href="#">Danh mục</a></li>
                            <li><a class = "btn btn-primary" href="#">Tin tức</a></li>
                            <li><a class = "btn btn-primary" href="#">Người dùng</a></li>
                            <li><a class = "btn btn-primary" href="#">Liên hệ</a></li>
                            <li><a class = "btn btn-primary" href="#">Câu nói hay</a></li>
                            <li><a class = "btn btn-primary" href="#">Quảng cáo</a></li>
                        </ul>                        
                    </div><!-- End. .grid_12-->
                </div><!-- End. .container_12 -->
                <div style="clear: both;"></div>
            </div> <!-- End #subnav -->
        </div> <!-- End #header -->
		<div class="container_12">