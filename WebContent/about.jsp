<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="templates/public/inc/header.jsp" %>
   <div id="body">
		<div class="content">
			<div id="section">
				<h2>Chào mừng bạn đến với website cá nhân Trần Nguyễn Gia Huy</h2>
				<p>
					Trần Nguyễn Gia Huy sinh ngày 19/05/2000, được sinh ra trong một gia đình giàu truyền thống ngành CNTT. Cha tôi là một kỹ sư CNTT đầu ngành trong công ty, và có nhiều đóng góp tạo nên thương hiệu công ty...
				</p>
				<img src="<%=request.getContextPath()%>/templates/public/images/old-couple.jpg" alt="">
				<div class="article">
					<div>
						<h3>Vài nét về Gia Huy</h3>
						<p>
						- Họ tên: Trần Nguyễn Gia Huy<br />
						- Địa chỉ: 154 Phạm Như Xương, Liên Chiểu, Đà Nẵng<br />
						- Email: giahuy@vinaenter.com - Phone: 0905.051.720
						</p>
						
						<h3>Khả năng của tôi</h3>
						<p>
						- Phát triển web Front-End<br />
						- Phát triển Web Back-End<br />
						- Kỹ năng làm việc nhóm và thuyết trình tốt
						</p>
					</div>
					
					<div>
						<h3>Kỹ năng chuyên ngành</h3>
						<p>
						- Html, Css, Javascript, Jquery<br />
						- PHP, MySQL, Ajax<br />
						- Javacore, Jsp-servlet, Swing, .NET
						</p>
						
						<h3>Mục tiêu của tôi</h3>
						<p>
						- Làm việc trong môi trường chuyên nghiệp<br />
						- Nâng cao kỹ năng chuyên môn với nhiều dự án khó<br />
						- Góp phần phát triển phòng công nghệ của công ty
						</p>
					</div>
				</div>
			</div>
			
			<div id="sidebar">
				<div class="testimonials">
					<h3>Những câu nói hay</h3>
					<ul>
						<li>
							<p>
								Nếu bạn luôn buồn phiền, hãy dùng hy vọng để chữa trị; hạnh phúc lớn nhất của nhân loại chính là biết hi vọng
							</p>
							<span class="author">- Khuyết danh</span>
						</li>
						<li>
							<p>
								Cuộc sống vẫn vậy nếu nó lấy đi thứ gì của bạn, thì thế nào nó cũng bù lại cho bạn thứ khác, chỉ có điều là bạn có chịu đi tìm hay không thôi
							</p>
							<span class="author">- Hạt giống tâm hồn</span>
						</li>
						<li>
							<p>
								Kẻ khốn cùng nhất trên thế giới này không phải là người không có một đồng xu dính túi, mà là kẻ không có nổi một ước mơ
							</p>
							<span class="author">- SơnTV</span>
						</li>
					</ul>
				</div>
				<div class="awards">
					<h3>Quảng cáo</h3>
					<a href="#" class="first">
						<img src="<%=request.getContextPath()%>/templates/public/images/hehocgi.png" alt="" />
					</a>
					<a href="#" class="first">
						<img src="<%=request.getContextPath()%>/templates/public/images/java.png" alt="" />
					</a>
				</div>
			</div>
			
			
		</div>
	</div>
   <%@include file="templates/public/inc/footer.jsp" %>