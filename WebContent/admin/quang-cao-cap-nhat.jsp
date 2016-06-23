<%@page import="bean.MessageBundle"%>
<%@page import="bean.Advs"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">

	<div class="module">
		 <h2><span>Cập nhật thông tin</span></h2>		
		 <%
		 	Advs item = new Advs();
		 	if(request.getAttribute("item")!=null){
		 		item = (Advs)request.getAttribute("item");	
		 	}
		 	MessageBundle messageBundle = new MessageBundle();
			 if(request.getAttribute("messageBundle")!=null){
				 messageBundle = (MessageBundle)request.getAttribute("messageBundle");
			}
		 %>
		 <div class="module-body">
			<form action="<%=request.getContextPath()%>/admin/cap-nhat-quang-cao?type=capnhat&cid=<%=item.getId_advs()%>" method="post" enctype="multipart/form-data">
				<%
					if(messageBundle.getExist()!=null){
						out.print(messageBundle.getExist());
					}
			 	%>
				<p>
					<label>Tên quảng cáo</label>
					<input type="text" name="name" value="<%=item.getName()%>" class="input-medium" />
				</p>
				<p>
					<label>Link</label>
					<input type="text" name="link" value="<%=item.getLink()%>" class="input-medium" />
				</p>
				<p>
					<label>Hình ảnh</label>
					<img src="<%=request.getContextPath()%>/files/<%=item.getBanner()%>" alt ="" width="150px" height="150px">
					<input type="file"  name="picture" value="" />
				</p>
				<fieldset>
					<input class="submit-green" name="capnhat" type="submit" value="Cập nhật" /> 
				</fieldset>
			</form>
		 </div> <!-- End .module-body -->
	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 