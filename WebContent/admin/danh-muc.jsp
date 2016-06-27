<%@page import="library.LibraryConstant"%>
<%@page import="bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div class="bottom-spacing">
	  <!-- Button -->
	  <div class="float-left">
		  <a href="<%=request.getContextPath()%>/admin/them-moi-danh-muc" class="button">
			<span>Thêm danh mục<img src="<%=request.getContextPath()%>/templates/admin/images/plus-small.gif" alt="ThÃªm tin"></span>
		  </a>
	  </div>
	  <div class="clear"></div>
</div>

<div class="grid_12">
	<!-- Example table -->
	<div class="module">
		<h2><span>Danh sách danh mục</span></h2>
		<%
			ArrayList<Category> alCat = new ArrayList<Category>();
			alCat = (ArrayList<Category>)request.getAttribute("alCat");
		%>
		<%
			if(request.getParameter("msg")!=null){
				String msg = request.getParameter("msg");
				if(msg.equals("add1")){
					out.print("<p style=\"color:green;margin:5px\"><strong>Thêm danh mục thành công</strong></p>");
				}else if(msg.equals("add0")){
					out.print("<p style=\"color:red;margin:5px\"><strong>Thêm thất bại.Vui lòng thử lại</strong></p");
				}
			}
			if(request.getParameter("msg")!=null){
				String msg = request.getParameter("msg");
				if(msg.equals("edit1")){
					out.print("<p style=\"color:green;margin:5px\"><strong>Cập nhật thông tin danh mục thành công</strong></p>");
				}else if(msg.equals("edit0")){
					out.print("<p style=\"color:red;margin:5px\"><strong>Cập nhật thất bại.Vui lòng thử lại</strong></p");
				}
			}
		
			if(request.getParameter("msg")!=null){
				String msg = request.getParameter("msg");
				if(msg.equals("del1")){
					out.print("<p style=\"color:green;margin:5px\"><strong>Xóa danh mục thành công</strong></p>");
				}else if(msg.equals("del0")){
					out.print("<p style=\"color:red;margin:5px\"><strong>Xóa thất bại.Vui lòng thử lại</strong></p>");
				}
			}
		%>
		<div class="module-table-body">
			<form action="">
			<table id="myTable" class="tablesorter">
				<thead>
					<tr>
						<th style="width:4%; text-align: center;">ID</th>
						<th>Tên</th>
						<th style="width:20%">Danh mục</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(Category item : alCat){
						%>
							<tr>
								<td class="align-center"><%=item.getId_cat()%></td>
								<td><a href="<%=request.getContextPath()%>/admin/cap-nhat-danh-muc?cid=<%=item.getId_cat()%>"><%=item.getName()%></a></td>
								<td align="center">
									<a href="<%=request.getContextPath()%>/admin/cap-nhat-danh-muc?cid=<%=item.getId_cat()%>">Sữa<img src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif" alt="edit" /></a>
									<a onClick = "return confirm('Bạn có muốn xóa không ?')" href="<%=request.getContextPath()%>/admin/xoa-danh-muc?cid=<%=item.getId_cat()%>">Xóa<img src="<%=request.getContextPath()%>/templates/admin/images/bin.gif" width="16" height="16" alt="delete" /></a>
								</td>
							</tr>
						<%
					}
				%>
				</tbody>
			</table>
			</form>
		 </div> <!-- End .module-table-body -->
	</div> <!-- End .module -->
		 <div class="pagination">           
			<%         
				int sotrang = (Integer)request.getAttribute("sotrang");
			 	int current_page = (Integer)request.getAttribute("current_page");
				 	out.print("<strong>Trang: </strong>"); 
				 	for(int i = 1;i <= sotrang;i++){
				 		if(current_page == i){
				 			if(i == sotrang){
				 				%>
				 					<a href="<%=request.getContextPath()%>/admin/danh-muc?page=<%=i%>" class="current"><%=i%></a>
				 				<%	
				 			}else{
				 				%>
				 					<a href="<%=request.getContextPath()%>/admin/danh-muc?page=<%=i%>" class="current"><%=i%></a> |
				 				<%
				 			}
				 			
				 		}else if(i == sotrang){
				 			%>
				 				<a href="<%=request.getContextPath()%>/admin/danh-muc?page=<%=i%>"><%=i%></a>
				 			<%
				 		}else{
				 			%>
			 					<a href="<%=request.getContextPath()%>/admin/danh-muc?page=<%=i%>"><%=i%></a> |
			 				<%
				 		}
				 	}
			 %>
		 </div>
	
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 