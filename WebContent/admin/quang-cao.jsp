<%@page import="bean.Advs"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
	<div class="bottom-spacing">
		  <!-- Button -->
		  <div class="float-left">
			  <a href="<%=request.getContextPath()%>/admin/them-moi-quang-cao?type=load" class="button">
				<span>Thêm quảng cáo <img src="<%=request.getContextPath()%>/templates/admin/images/plus-small.gif" alt="Thêm tin"></span>
			  </a>
		  </div>
		  <%
		  	ArrayList<Advs> alAdvs = new ArrayList<Advs>();
		  	if(request.getAttribute("alAdvs")!=null){
		  		alAdvs = (ArrayList<Advs>)request.getAttribute("alAdvs");
		  	}
		  %>
		  <div class="clear"></div>
	</div>
	<div class="grid_12">
		<!-- Example table -->
		<div class="module">
			<h2><span>Danh sách quảng cáo</span></h2>
			<%
				if(request.getParameter("msg")!=null){
					String msg = request.getParameter("msg");
					if(msg.equals("add1")){
						out.print("<p style=\"color: green\"><strong>Thêm mới thông tin thành công</strong></p>");
					}else if(msg.equals("add0")){
						out.print("<p style=\"color: red\"><strong>Thêm mới thông tin thất bại. Vui lòng thử lại</strong></p");
					}
				}
			
				if(request.getParameter("msg")!=null){
					String msg = request.getParameter("msg");
					if(msg.equals("edit1")){
						out.print("<p style=\"color: green\"><strong>Cập nhật thông tin thành công</strong></p>");
					}else if(msg.equals("edit0")){
						out.print("<p style=\"color: red\"><strong>Cập nhật thông tin thất bại.Vui lòng thử lại</strong></p");
					}
				}
			
				if(request.getParameter("msg")!=null){
					String msg = request.getParameter("msg");
					if(msg.equals("del1")){
						out.print("<p style=\"color: green\"><strong>Xóa thông tin thành công</strong></p>");
					}else if(msg.equals("del0")){
						out.print("<p style=\"color: red\"><strong>Xóa thông tin thất bại.Vui lòng thử lại</strong></p>");
					}
				}
			%>
			<div class="module-table-body">
				<form action="">
				<table id="myTable" class="tablesorter">
					<thead>
						<tr>
							<th style="width:5%; text-align: center;">ID</th>
							<th style="width:50%">Tên Quảng Cáo</th>
							<th style="width:25%">Link</th>
							<th style="width:10%">Hình ảnh</th>
							<th style="width:10%">Chức năng</th>
						</tr>
					</thead>
					<tbody>
					<%
						for(Advs item : alAdvs){
							%>
								<tr>
									<td class="align-center"><%=item.getId_advs()%></td>
									<td><a href="<%=request.getContextPath()%>/admin/cap-nhat-quang-cao?cid=<%=item.getId_advs()%>"><%=item.getName()%></a></td>
									<td><a href="<%=item.getLink()%>" target="blank"><%=item.getLink()%></a></td>
									<td class="align-center"><img src="<%=request.getContextPath()%>/files/<%=item.getBanner()%>" alt ="" width="100px" height="100px"></td>
									<td align="center">
										<a href="<%=request.getContextPath()%>/admin/cap-nhat-quang-cao?cid=<%=item.getId_advs()%>">Sữa<img src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif" alt="edit" /></a>
										<a onClick = "return confirm('Bạn có thực sự xóa không ?')" href="<%=request.getContextPath()%>/admin/xoa-quang-cao?cid=<%=item.getId_advs()%>">Xóa<img src="<%=request.getContextPath()%>/templates/admin/images/bin.gif" width="16" height="16" alt="delete" /></a>
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
			 					<a href="<%=request.getContextPath()%>/admin/quang-cao?page=<%=i%>" class="current"><%=i%></a>
			 				<%	
			 			}else{
			 				%>
			 					<a href="<%=request.getContextPath()%>/admin/quang-cao?page=<%=i%>" class="current"><%=i%></a> |
			 				<%
			 			}
			 			
			 		}else if(i == sotrang){
			 			%>
			 				<a href="<%=request.getContextPath()%>/admin/quang-cao?page=<%=i%>"><%=i%></a>
			 			<%
			 		}else{
			 			%>
		 					<a href="<%=request.getContextPath()%>/admin/quang-cao?page=<%=i%>"><%=i%></a> |
		 				<%
			 		}
			 	}
			 %>
			 </div>
	</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 