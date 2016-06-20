<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="templates/public/inc/header.jsp" %>
   <div id="body">
		<div class="content">
			<div id="section">
				<h2>Liên hệ với Gia Huy</h2>
				<img src="<%=request.getContextPath()%>/templates/public/images/chung.png" alt="" width="100%" />
				<form action="index.html">
					<b>Gửi liên hệ trực tuyển</b> 
					<span>Vui lòng điền đầy đủ thông tin để liên hệ trực tuyến đến Gia Huy. Tôi sẽ phản hồi sớm nhất có thể!</span>
					<input type="text" name="name" id="name" value="" placeholder="Họ và tên" />
					<input type="text" name="email" id="email" value=""  placeholder="Email" />
					<input type="text" name="address" id="address" value=""  placeholder="Địa chỉ" />
					<input type="text" name="phone" id="phone" value=""  placeholder="Số phone" />
					<textarea name="message" id="message" cols="30" rows="10" placeholder="Nội dung"></textarea>
					<input type="submit" name="send" id="send" value="Gửi liên hệ">
				</form>
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