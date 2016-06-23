<%@page import="bean.MessageBundle"%>
<%@page import="bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ModelNew"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">
	<div class="module">
		 <h2><span>Thêm mới quảng cáo</span></h2>
		 <%
		 MessageBundle messageBundle = new MessageBundle();
		 if(request.getAttribute("messageBundle")!=null){
			 messageBundle = (MessageBundle)request.getAttribute("messageBundle");
		 }	 
		%>
		 <div class="module-body">
			<form action="<%=request.getContextPath()%>/admin/them-moi-quang-cao?type=them" method = "post" enctype="multipart/form-data" id="frmadvs">
				<%
					if(messageBundle.getExist()!=null){
						out.print(messageBundle.getExist());
					}
			 	%>
				<p>
					<label>Tên quảng cáo</label>
					<input type="text" name="name" value="" class="input-medium" />
				</p>
				<p>
					<label>Link</label>
					<input type="text" name="link" value="" class="input-medium" />
				</p>
				<p>
					<label>Banner</label>
					<input type="file"  name="picture" value="" />
				</p>
				<fieldset>
					<input class="submit-green" name="them" type="submit" value="Thêm" /> 
				</fieldset>
			</form>
			<script type="text/javascript">
	        	$(document).ready(function(){
	        		$('#frmadvs').validate({
	        			rules:{
	        					name:{
	        						required:true,
	        					}
	        				},
	        			messages:{
	        					name:{
	        						required:"<p style = 'color:red'>Tên quảng cáo không bỏ trống!</p>",
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