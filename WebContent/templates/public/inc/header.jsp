<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8" />
	<title>MyProject</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/public/css/style.css" type="text/css">
	<!--[if IE 7]>
		<link rel="stylesheet" href="css/ie7.css" type="text/css">
	<![endif]-->
</head>
<body>
	<div id="header">
		<div>
			<div>
				<span>Trần Nguyễn Gia Huy</span>
				<a href="index.html" class="logo"><img src="<%=request.getContextPath()%>/templates/public/images/logo.png" alt=""></a>
				<span class="tagline">Mỗi ngày là một món quà</span>
			</div>
			<ul>
				<li class="selected">
					<a href="index.html">Trang chủ</a>
				</li>
				<li>
					<a href="about.html">Giới thiệu</a>
				</li>
				<li>
					<a href="projects.html">Dự án thực hiện</a>
				</li>
				<li>
					<a href="news.html">Tin tức</a>
				</li>
				<li>
					<a href="contact.html">Liên hệ</a>
				</li>
			</ul>
		</div>
	</div>