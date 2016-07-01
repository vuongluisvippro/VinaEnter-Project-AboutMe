<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8" />
	<title>Nguyễn Văn Vương</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/public/css/style.css" type="text/css">
	<!--[if IE 7]>
		<link rel="stylesheet" href="css/ie7.css" type="text/css">
	<![endif]-->
</head>
<body>
	<div id="header">
		<div>
			<div>
				<span>Nguyễn Văn Vương</span>
				<a href="<%=request.getContextPath()%>/trang-chu" class="logo"><img src="<%=request.getContextPath()%>/templates/public/images/logo.png" alt=""></a>
				<span class="tagline">trên bước đường thành công không có dấu chân của kẻ lười biếng</span>
			</div>
			<ul>
				<li class="selected">
					<a href="<%=request.getContextPath()%>/trang-chu">Trang chủ</a>
				</li>
				<li>
					<a href="<%=request.getContextPath()%>/gioi-thieu">Giới thiệu</a>
				</li>
				<li>
					<a href="<%=request.getContextPath()%>/du-an">Dự án thực hiện</a>
				</li>
				<li>
					<a href="<%=request.getContextPath()%>/tin-tuc">Tin tức</a>
				</li>
				<li>
					<a href="<%=request.getContextPath()%>/lien-he">Liên hệ</a>
				</li>
			</ul>
		</div>
	</div>