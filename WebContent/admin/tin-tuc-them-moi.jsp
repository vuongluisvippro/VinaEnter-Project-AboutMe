<%@page import="bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ModelNew"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">
	<div class="module">
		 <h2><span>Thêm mới tin tức</span></h2>
		 <div class="module-body">
			<form action="<%=request.getContextPath()%>/admin/them-moi-tin-tuc?type=them" method = "post" enctype="multipart/form-data" id="frmnew">
				<p>
					<label>Tên tin</label>
					<input type="text" name="name" value="" class="input-medium" />
				</p>
				<p>
					<label>Danh mục tin</label>
					<select  name="namecat" class="input-short">
					<%
						ArrayList<Category> alCat = (ArrayList<Category>)request.getAttribute("alCat");
						for(Category cat : alCat){
							%>
								<option value="<%=cat.getId_cat()%>"><%=cat.getName()%></option>	
						   <%
						}
					%>
					</select>
				</p>
				<p>
					<label>Hình ảnh</label>
					<input type="file"  name="picture" value="" />
				</p>
				<p>
					<label>Mô tả</label>
					<textarea name="preview_text" value="" rows="7" cols="90" class="input-medium"></textarea>
				</p>
				<p>
					<label>Chi tiết</label>
					<textarea  class="ckeditor" name="detail_text" value="" rows="7" cols="90" class="input-long"></textarea>
				</p>
				<fieldset>
					<input class="submit-green" name="them" type="submit" value="Thêm" /> 
					<input class="submit-gray" name="reset" type="reset" value="Nhập lại" />
				</fieldset>
			</form>
			<script type="text/javascript">
	        	$(document).ready(function(){
	        		$('#frmnew').validate({
	        			rules:{
	        					name:{
	        						required:true,
	        						minlength:2,
	        						maxlength:255
	        					}
	        				},
	        			messages:{
	        					name:{
	        						required:"<p style = 'color:red'>Tên tin tức không bỏ trống!</p>",
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