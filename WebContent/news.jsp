<%@page import="bean.Category"%>
<%@page import="bean.New"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="templates/public/inc/header.jsp" %>
   <div id="body">
		<div class="section">
			<h2>Nguyễn Văn Vương</h2>
			<p class="ptop">
				Cập nhật các tin tức mới nhất về hoạt động xã hội của Văn Vương hoặc những tin tức ngoài lề mà Văn Vương quan tâm:
			</p>
			<%
				ArrayList<New> alNew = new ArrayList<New>();
				ArrayList<Category> alCat = new ArrayList<Category>();
				if(request.getAttribute("alNew")!=null && request.getAttribute("alCat")!=null){
					alNew = (ArrayList<New>)request.getAttribute("alNew");
					alCat = (ArrayList<Category>)request.getAttribute("alCat");
				}
			%>
			<%
				for(Category itemCat : alCat){
					%>
					<!-- begin block -->
					<div class="project-wrap">
						
							<%
								for(New itemNew : alNew){
									if(itemNew.getId_cat() == itemCat.getId_cat()){
										%>
										<h3 class="title"><%=itemCat.getName()%></h3>
										<div class="project-top">
											<a href="#"><img src="<%=request.getContextPath()%>/files/<%=itemNew.getPicture()%>" alt=""></a>
											<div>
												<b><a href="<%=request.getContextPath()%>/chi-tiet?cid=<%=itemNew.getId_new()%>"><%=itemNew.getName()%></a></b> 
												<small>Ngày đăng: 12/1/2016</small>
												<p class="preview_text">
													<%=itemNew.getPreview_text()%>						
												</p>
											</div>	
										</div>
										<ul class="article">
											<li>
												<a href="#"><img src="<%=request.getContextPath()%>/files/<%=itemNew.getPicture()%>" alt=""></a> <b><a href="<%=request.getContextPath()%>/chi-tiet?cid=<%=itemNew.getId_new()%>"><%=itemNew.getNameCat()%></a></b> <small>Ngày Đăng: 12/1/2016</small>
												<p>
													<%=itemNew.getPreview_text()%>
												</p>
												
											</li>
										</ul>
										<div class="clr"></div>
										<%
									}
								}
							%>
					</div> <!-- end block -->
					<%
				}
			%>
		</div>
	</div>
   <%@include file="templates/public/inc/footer.jsp" %>