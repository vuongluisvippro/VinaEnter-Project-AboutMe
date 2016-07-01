<%@page import="bean.Project"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div class="bottom-spacing">
	  <!-- Button -->
	  <div class="float-left">
		  <a href="<%=request.getContextPath()%>/admin/them-moi-du-an?type=load" class="button">
			<span>Thêm mới dự án<img src="<%=request.getContextPath()%>/templates/admin/images/plus-small.gif" alt="ThÃªm tin"></span>
		  </a>
	  </div>
	  <div class="clear"></div>
</div>

<div class="grid_12">
	<!-- Example table -->
	<div class="module">
		<h2><span>Danh sách dự án đã thực hiện</span></h2>
		<%
			ArrayList<Project> alProject = new ArrayList<Project>();
			alProject = (ArrayList<Project>)request.getAttribute("alProject"); 
		%>
		<%
			if(request.getParameter("msg")!=null){
				String msg = request.getParameter("msg");
				if(msg.equals("add1")){
					out.print("<p style=\"color:green\"><strong>Thêm mới dự án thành công</strong></p>");
				}else if(msg.equals("add0")){
					out.print("<p style=\"color:red\"><strong>Thêm mới dự án thất bại.Vui lòng thử lại</strong></p");
				}
			}
		
			if(request.getParameter("msg")!=null){
				String msg = request.getParameter("msg");
				if(msg.equals("edit1")){
					out.print("<p style=\"color:green\"><strong>Cập nhật dự án thành công</strong></p>");
				}else if(msg.equals("edit0")){
					out.print("<p style=\"color:red\"><strong>Cập nhật dự án thất bại.Vui lòng thử lại</strong></p");
				}
			}
		
			if(request.getParameter("msg")!=null){
				String msg = request.getParameter("msg");
				if(msg.equals("del1")){
					out.print("<p style=\"color:green\"><strong>Xóa dự án thành công</strong></p>");
				}else if(msg.equals("del0")){
					out.print("<p style=\"color:red\"><strong>Xóa dự án thất bại.Vui lòng thử lại</strong></p>");
				}
			}
		%>
		<div class="module-table-body">
			<form action="">
			<table id="myTable" class="tablesorter">
				<thead>
					<tr>
						<th style="width:5%; text-align: center;">ID</th>
						<th style="width:20%">Tên Dự Án</th>
						<th style="width:35%">Mô Tả</th>
						<th style="width:10%">Hình Ảnh</th>
						<th style="width:20%">Liên Kết</th>
						<th style="width:10%">Chức năng</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(Project item : alProject){  
						%>
							<tr>
								<td class="align-center"><%=item.getId_project()%></td>
								<td><a href="<%=request.getContextPath()%>/admin/cap-nhat-du-an?cid=<%=item.getId_project()%>" target="blank"><%=item.getName()%></a></td>
								<td><%=item.getPreview_text()%></td>
								<td><img src="<%=request.getContextPath()%>/files/<%=item.getPicture()%>" alt ="" width="100px" height="100px"></td>
								<td><a href="<%=item.getLink()%>" target="blank"><%=item.getLink()%></td>
								<td align="center">
									<a href="<%=request.getContextPath()%>/admin/cap-nhat-du-an?cid=<%=item.getId_project()%>">Sữa<img src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif" alt="edit" /></a>
									<a onClick = "return confirm('Bạn có thực sự xóa không ?')" href="<%=request.getContextPath()%>/admin/xoa-du-an?cid=<%=item.getId_project()%>">Xóa<img src="<%=request.getContextPath()%>/templates/admin/images/bin.gif" width="16" height="16" alt="delete" /></a>
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
			 					<a href="<%=request.getContextPath()%>/admin/du-an?page=<%=i%>" class="current"><%=i%></a>
			 				<%	
			 			}else{
			 				%>
			 					<a href="<%=request.getContextPath()%>/admin/du-an?page=<%=i%>" class="current"><%=i%></a> |
			 				<%
			 			}
			 		}else if(i == sotrang){
			 			%>
			 				<a href="<%=request.getContextPath()%>/admin/du-an?page=<%=i%>"><%=i%></a>
			 			<%
			 		}else{
			 			%>
		 					<a href="<%=request.getContextPath()%>/admin/du-an?page=<%=i%>"><%=i%></a> |
		 				<%
			 		}
			 	}
			 %>
		 </div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 