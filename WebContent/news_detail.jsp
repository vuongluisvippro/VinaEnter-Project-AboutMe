<%@page import="model.ModelNew"%>
<%@page import="bean.Advs"%>
<%@page import="bean.Say"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.New"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="templates/public/inc/header.jsp" %>
   <div id="body">
		<div class="content">
			<div id="blog" class="blogdt">
			<%
				New itemNew = new New();
				if(request.getAttribute("itemNew")!=null){
					itemNew = (New)request.getAttribute("itemNew");
				}
			%>
				<div class="news_detail">
					<h1><%=itemNew.getName()%></h1>
					<p class="date">Ngày đăng: 12/1/2016 - Lượt đọc: <%=itemNew.getRead()%></p>
					<div class="news_content">
						<%=itemNew.getDetail_text()%>
					</div>
				</div>
				<h4 class="relate">Tin tức liên quan</h4>
				<ul>
				<%
					for(New x : new ModelNew().getListConcer(itemNew.getId_cat(),itemNew.getId_new())){
						%>
							<li>
								<div class="article">
									<h3><a href="<%=request.getContextPath()%>/chi-tiet?cid=<%=x.getId_new()%>" class="more" target="blank"><%=x.getName()%></a></h3>
									<p>
										<%=x.getPreview_text()%>								
									</p>
								</div>
								<div class="stats">
									<a href="#" class="more" target="_blank"><img src="<%=request.getContextPath()%>/files/<%=x.getPicture()%>" alt="" /></a>
								</div>
							</li>	
						<%
					}
				%>
				</ul>
			</div>
			
			<div id="sidebar">
				<div class="testimonials">
					<h3>Những câu nói hay</h3>
					<%
						ArrayList<Say> alSay = new ArrayList<Say>();
						if(request.getAttribute("alSay")!=null){
							alSay = (ArrayList<Say>)request.getAttribute("alSay");
						}
					%>
					<ul>
					<%
						for(Say item : alSay){
							%>
								<li>
									<p>
										<%=item.getContent()%>
									</p>
									<span class="author"><%=item.getAuthor()%></span>
								</li>	
							<%
						}
					%>
					</ul>
				</div>
				<div class="awards">
					<%
					ArrayList<Advs> alAdvs = new ArrayList<Advs>();
					if(request.getAttribute("alAdvs")!=null){
						alAdvs = (ArrayList<Advs>)request.getAttribute("alAdvs");
					}
					%>
					<h3>Quảng cáo</h3>
					<%
						for(Advs item : alAdvs){
							%>
								<a href="<%=item.getLink()%>" class="first" target="blank">
									<img src="<%=request.getContextPath()%>/files/<%=item.getBanner()%>" alt="" />
								</a>
							<%
						}
					%>
				</div>
			</div>
			
			
		</div>
	</div>
   <%@include file="templates/public/inc/footer.jsp" %>