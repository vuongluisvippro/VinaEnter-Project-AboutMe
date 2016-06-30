<%@page import="library.LibraryConstant"%>
<%@page import="bean.User"%>
<%@page import="bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div class="bottom-spacing">
	  <!-- Button -->
	  <div class="float-left">
		  <a href="<%=request.getContextPath()%>/admin/them-moi-nguoi-dung" class="button">
			<span>Thêm User <img src="<%=request.getContextPath()%>/templates/admin/images/plus-small.gif" alt="ThÃªm tin"></span>
		  </a>
	  </div>
	  <div class="clear"></div>
</div>

<div class="grid_12">
	<!-- Example table -->
	<div class="module">
		<h2><span>Danh sách người dùng</span></h2>
		<%
			ArrayList<User> alUser = new ArrayList<User>();
			alUser = (ArrayList<User>)request.getAttribute("alUser");
		%>
		<%
			if(request.getParameter("msg")!=null){
				String msg = request.getParameter("msg");
				if(msg.equals("add1")){
					out.print("<p style=\"color:green\"><strong>Thêm thông tin người dùng thành công</strong></p>");
				}else if(msg.equals("add0")){
					out.print("<p style=\"color:red\"><strong>Thêm thông tin thất bại.Vui lòng thử lại</strong></p");
				}
			}
		
			if(request.getParameter("msg")!=null){
				String msg = request.getParameter("msg");
				if(msg.equals("edit1")){
					out.print("<p style=\"color:green\"><strong>Cập nhật thông tin người dùng thành công</strong></p>");
				}else if(msg.equals("edit0")){
					out.print("<p style=\"color:green\"><strong>Cập nhật thông tin thất bại.Vui lòng thử lại</strong></p");
				}
			}
		
			if(request.getParameter("msg")!=null){
				String msg = request.getParameter("msg");
				if(msg.equals("del1")){
					out.print("<p style=\"color:green\"><strong>Xóa thông tin người dùng thành công</strong></p>");
				}else if(msg.equals("del0")){
					out.print("<p style=\"color:green\"><strong>Xóa thông tin thất bại.Vui lòng thử lại</strong></p>");
				}
			}
		%>
		<div class="module-table-body">
			<form action="">
			<table id="myTable" class="tablesorter">
				<thead>
					<tr>
						<th style="width:4%; text-align: center;">ID</th>
						<th>Username</th>
						<th style="width:40%">Fullname</th>
						<th style="width:20%">Thao tác</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(User item : alUser){
						%>
							<tr>
								<td class="align-center"><%=item.getId_user()%></td>
								<td><%=item.getUsername()%></td>
								<td><%=item.getFullname()%></td>
								<td align="center">
									<%
										User Administrator = new User();
										Administrator = (User)session.getAttribute("objUser");
										if("admin".equals(Administrator.getUsername())){
											%>
												<a href="<%=request.getContextPath()%>/admin/cap-nhat-nguoi-dung?cid=<%=item.getId_user()%>">Sữa<img src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif" alt="edit" /></a>
												<a onClick = "return confirm('Bạn có thực sự xóa không ?')" href="<%=request.getContextPath()%>/admin/xoa-nguoi-dung?cid=<%=item.getId_user()%>">Xóa<img src="<%=request.getContextPath()%>/templates/admin/images/bin.gif" width="16" height="16" alt="delete" /></a>
											<%
										}else{
											if(!item.getUsername().equals("admin")){
												%>
													<a href="<%=request.getContextPath()%>/admin/cap-nhat-nguoi-dung?cid=<%=item.getId_user()%>">Sữa<img src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif" alt="edit" /></a>
												<%	
											}
										}
									%>
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
				 					<a href="<%=request.getContextPath()%>/admin/nguoi-dung?page=<%=i%>" class="current"><%=i%></a>
				 				<%	
				 			}else{
				 				%>
				 					<a href="<%=request.getContextPath()%>/admin/nguoi-dung?page=<%=i%>" class="current"><%=i%></a> |
				 				<%
				 			}
				 			
				 		}else if(i == sotrang){
				 			%>
				 				<a href="<%=request.getContextPath()%>/admin/nguoi-dung?page=<%=i%>"><%=i%></a>
				 			<%
				 		}else{
				 			%>
			 					<a href="<%=request.getContextPath()%>/admin/nguoi-dung?page=<%=i%>"><%=i%></a> |
			 				<%
				 		}
				 	}
			 %>
		 </div>
	
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 