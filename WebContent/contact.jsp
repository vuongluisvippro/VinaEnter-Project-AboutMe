<%@page import="bean.Advs"%>
<%@page import="bean.Say"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="templates/public/inc/header.jsp" %>
   <div id="body">
   		<%
   			if(request.getParameter("msg")!=null){
   				if("add1".equals(request.getParameter("msg"))){
   					%>
   						<script type="text/javascript">
   							alert("Gửi liên hệ thành công");
   						</script>
   					<%
   				}else if("add0".equals(request.getParameter("msg"))){
   					%>
						<script type="text/javascript">
							alert("Gửi liên hệ thất bại");
						</script>
					<%
   				}
   			}
   		%>
		<div class="content">
			<div id="section">
				<h2>Liên hệ với văn Vương</h2>
				<img src="<%=request.getContextPath()%>/templates/public/images/chung.png" alt="" width="100%" />
				<form action="<%=request.getContextPath()%>/lien-he" method="post">
					<b>Gửi liên hệ trực tuyển</b> 
					<span>Vui lòng điền đầy đủ thông tin để liên hệ trực tuyến đến Văn Vương. Tôi sẽ phản hồi sớm nhất có thể!</span>
						<input type="text" name="fullname" id="name" value="" placeholder="Họ và tên" />
						<input type="text" name="email" id="email" value=""  placeholder="Email" />
						<input type="text" name="address" id="address" value=""  placeholder="Địa chỉ" />
						<input type="text" name="phone" id="phone" value=""  placeholder="Số phone" />
						<textarea name="content" id="message" cols="30" rows="10" placeholder="Nội dung"></textarea>
						<input type="submit" name="send" id="send" value="Gửi liên hệ">
				</form>
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