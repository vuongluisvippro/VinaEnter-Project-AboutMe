<%@page import="bean.Say"%>
<%@page import="bean.MessageBundle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">
	<div class="module">
		 <h2><span>Cập nhật thông tin</span></h2>
		 <%
			 MessageBundle messageBundle = new MessageBundle();
			 if(request.getAttribute("messageBundle")!=null){
				 messageBundle = (MessageBundle)request.getAttribute("messageBundle");
			 }	 
		 %>
		 <%
		 	Say item = new Say();
		 	if(request.getAttribute("item")!=null){
		 		item = (Say)request.getAttribute("item");
		 	}
		 %>
		 <div class="modul()e-body">
			<form action="<%=request.getContextPath()%>/admin/cap-nhat-cau-noi?cid=<%=item.getId_saying()%>" method="post" id="frmeditsay">
			<%
				if(messageBundle.getExist()!=null){
					out.print(messageBundle.getExist());
				}
		 	%>
				<p>
					<label>Nội dung</label>
					<input type="text" name="content" value="<%=item.getContent()%>" class="input-medium" />
				</p>
				<p>
					<label>Tác giả</label>
					<input type="text" name="author" value="<%=item.getAuthor()%>" class="input-medium" />
				</p>
				<fieldset>
					<input class="submit-green" name="capnhat" type="submit" value="Cập nhật" /> 
				</fieldset>
			</form>
			<script type="text/javascript">
	        	$(document).ready(function(){
	        		$('#frmeditsay').validate({
	        			rules:{
	        					content:{
	        						required:true,
	        					},
	        					author:{
	        						required:true,
	        					}
	        				},
	        			messages:{
	        					content:{
	        						required:"<p style = 'color:red'>Nội dung không bỏ trống!</p>"
	        					}
	        				}
	        		});
	        	});
        	</script>
		 </div> <!-- End .module-body -->
	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 