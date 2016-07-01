<%@page import="library.LibraryUsefull"%>
<%@page import="java.util.Random"%>
<%@page import="bean.Say"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="templates/public/inc/header.jsp" %>
   <div id="body">
		<div class="header">
			<div>
				<img src="<%=request.getContextPath()%>/templates/public/images/biking.jpg" alt="">
				<ul>
					<li>
						<a href="https://www.facebook.com/vuongluis" target="blank">Facebook</a>
					</li>
					<li>
						<a href="https://twitter.com/luisnguyenvan" target="blank">Twitter</a>
					</li>
					<li>
						<a href="https://plus.google.com/" target="blank">Googleplus</a>
					</li>
					<li>
						<a href="http://vinaenter.edu.vn" target="blank">VinaENTER EDU</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="body">
			<div class="section">
				<div class="article">
					<h2>Chào mừng bạn ghé thăm website Văn Vương</h2>
					<img src="<%=request.getContextPath()%>/templates/public/images/logo_DUT.jpg" alt="">
					<p>
						Website chia sẻ thông tin, các bài học giá trị, và tất cả những gì mà Vương học được mỗi ngày. 
						Hy vọng đây sẽ là kênh hữu ích để chúng ta cùng kết nối, giao lưu lẫn nhau. <br />
						Các công nghệ mới nhất về CNTT cũng được Vương cập nhật tại website này, chúng ta hãy cũng nhau học tập,
						cùng nhau nghiên cứu để tạo nên một bước đột phá để ngày hôm nay luôn khác ngay hôm qua.
					</p>
				</div>
				<div class="aside">
					<h2>Những Câu Nói Hay</h2>
					<%
						ArrayList<Say> alSay = new ArrayList<Say>();
						Say item = new Say();
						if(request.getAttribute("alSay")!=null){
							alSay = (ArrayList<Say>)request.getAttribute("alSay");
						}
						int index = new Random().nextInt(alSay.size());
						item = alSay.get(index);
					%>
					<ul style="list-style-type:none">
						<li>
								<p style="color: <%=LibraryUsefull.getColorRandom()%>">
									<%=item.getContent()%>
								</p>
							<span class="author"><%=item.getAuthor()%></span>
						</li>	
					</ul>
				</div>
			</div>
		</div>
		<div class="footer">
			<div>
				<a href="doctors.html"><img src="<%=request.getContextPath()%>/templates/public/images/love.jpg" alt=""></a>
				<h3>Quan điểm tình bạn của Văn Vương</h3>
				<p>
					Tình yêu không cần phải hoàn hảo, nó chỉ cần chân thật. 
				</p>
			</div>
			<div>
				<a href="services.html"><img src="<%=request.getContextPath()%>/templates/public/images/life.jpg" alt=""></a>
				<h3>Quan điểm về cuộc sống của Văn Vương</h3>
				<p>
					Cuộc sống vốn không cân bằng. Hãy tập quen dần với điều đó.
				</p>
			</div>
			<div>
				<a href="services.html"><img src="<%=request.getContextPath()%>/templates/public/images/friends.jpg" alt=""></a>
				<h3>Quan điểm về tình yêu của Văn Vương</h3>
				<p>
					Tình yêu không cần phải hoàn hảo, nó chỉ cần chân thật. 
				</p>
			</div>
		</div>
	</div>
   <%@include file="templates/public/inc/footer.jsp" %>
