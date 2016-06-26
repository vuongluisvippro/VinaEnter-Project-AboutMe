<%@page import="bean.MessageBundle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">
	<div class="module">
		 <h2><span>Đăng nhập</span></h2>
		 <div class="modul()e-body">
		 <%
		 	MessageBundle messageBundle = new MessageBundle();
		 	if(request.getAttribute("messageBundle")!=null){
		 		messageBundle = (MessageBundle)request.getAttribute("messageBundle");
		 	}
		 %>
			<form action="<%=request.getContextPath()%>/admin/dang-nhap" method="post" id="frmlogin">
			<%
				if(messageBundle.getExist()!=null){
					out.print(messageBundle.getExist());
				}
			%>
				<p>
					<label>Tên đăng nhập</label>
					<input type="text" name="username" value="" class="input-medium" />
				</p>
				<p>
					<label>Mật khẩu</label>
					<input type="password" name="password" value="" class="input-medium" />
				</p>
				<fieldset>
					<input class="submit-green" name="submit" type="submit" value="Đăng nhập" /> 
				</fieldset>
			</form>
			<script type="text/javascript">
	        	$(document).ready(function(){
	        		$('#frmlogin').validate({
	        			rules:{
	        					username:{
	        						required:true,
	        						minlength:2,
	        						maxlength:20
	        					},
	        					password:{
	        						required:true,
	        						minlength:2,
	        						maxlength:20
	        					}
	        				},
	        			messages:{
	        					username:{
	        						required:"<p style = 'color:red'><strong>Tên đăng nhập không bỏ trống!</strong></p>",
	        					},
	        					password:{
	        						required:"<p style = 'color:red'><strong>Tên mật khẩu không bỏ trống!</strong></p>",
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