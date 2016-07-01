<%@page import="bean.Project"%>
<%@page import="bean.Say"%>
<%@page import="bean.Advs"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="templates/public/inc/header.jsp" %>
   <div id="body">
		<div class="content">
			<div id="blog">
				<h2>Các dự án đã thực hiện</h2>
				<%
					ArrayList<Project> alProject = new ArrayList<Project>();
					if(request.getAttribute("alProject")!=null){
						alProject = (ArrayList<Project>)request.getAttribute("alProject");
					}
				%>
				<ul>
				<%
					for(Project item : alProject){
						%>
							<li>
								<div class="article">
									<h3><%=item.getName()%></h3>
									<p>
										<%=item.getPreview_text()%>								
									</p>
									<a href="<%=item.getLink()%>" class="more" target="_blank">Truy cập trang này</a>
								</div>
								<div class="stats">
									<a href="<%=item.getLink()%>" class="more" target="_blank"><img src="<%=request.getContextPath()%>/files/<%=item.getPicture()%>" alt="" /></a>
								</div>
							</li>
						<%
					}
				%>
				</ul>
				<ul class="paging">
					<%         
						int sotrang = (Integer)request.getAttribute("sotrang");
					 	int current_page = (Integer)request.getAttribute("current_page");
					 	%>
					 		<li class="first">
								<a href="<%=request.getContextPath()%>/du-an?prev=<%=current_page%>">Trước</a>
							</li>
					 	<%
					 	for(int i = 1;i <= sotrang;i++){
					 		if(current_page == i){
					 			%>
					 			<li class="selected">
					 				<a href="<%=request.getContextPath()%>/du-an?page=<%=i%>"><%=i%></a>
					 			</li>
					 			<%
					 		}else{
					 			%>
					 			<li>
				 					<a href="<%=request.getContextPath()%>/du-an?page=<%=i%>"><%=i%></a>
				 				</li>
				 				<%
					 		}
					 	}
					 	%>
					 		<li class="last">
								<a href="<%=request.getContextPath()%>/du-an?next=<%=current_page%>">Sau</a>
							</li>
					 	<%
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