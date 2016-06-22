<%@page import="java.io.File"%>
<%@page import="bean.New"%>
<%@page import="bean.User"%>
<%@page import="bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div class="bottom-spacing">
	  <!-- Button -->
	  <div class="float-left">
		  <a href="<%=request.getContextPath()%>/admin/them-moi-tin-tuc?type=load" class="button">
			<span>Thêm Tin tức <img src="<%=request.getContextPath()%>/templates/admin/images/plus-small.gif" alt="Thêm tin"></span>
		  </a>
	  </div>
	  <%
	  	ArrayList<Category> alCat = new ArrayList<Category>();
	  	if(request.getAttribute("alCat")!=null){
	  		alCat = (ArrayList<Category>)request.getAttribute("alCat");
	  	}
	  %>
	  <div class="clear"></div>
</div>
<form action="" id="frmTimKiem" method="post" style="background-color:#d7d7d7">
	<label>Tiêu đề: </label>
	<input type="search" value="" size="34" placeholder="Từ khóa tin tức" name="searchName"/> 
	<label>Danh mục: </label>
</form>
<div class="grid_12">
	<!-- Example table -->
	<div class="module">
		<h2><span>Danh sách tin tức</span></h2>
		<%
			ArrayList<New> alNew = new ArrayList<New>();
			alNew = (ArrayList<New>)request.getAttribute("alNew");
		%>
		<%
			if(request.getParameter("msg")!=null){
				String msg = request.getParameter("msg");
				if(msg.equals("add1")){
					out.print("<p style=\"color: green\"><strong>Thêm mới tin tức thành công</strong></p>");
				}else if(msg.equals("add0")){
					out.print("<p style=\"color: red\"><strong>Thêm mới tin tức thất bại. Vui lòng thử lại</strong></p");
				}
			}
		
			if(request.getParameter("msg")!=null){
				String msg = request.getParameter("msg");
				if(msg.equals("edit1")){
					out.print("<p style=\"color: green\"><strong>Cập nhật tin tức thành công</strong></p>");
				}else if(msg.equals("edit0")){
					out.print("<p style=\"color: red\"><strong>Cập nhật tin tức thất bại.Vui lòng thử lại</strong></p");
				}
			}
		
			if(request.getParameter("msg")!=null){
				String msg = request.getParameter("msg");
				if(msg.equals("del1")){
					out.print("<p style=\"color: green\"><strong>Xóa tin tức thành công</strong></p>");
				}else if(msg.equals("del0")){
					out.print("<p style=\"color: red\"><strong>Xóa tin tức thất bại.Vui lòng thử lại</strong></p>");
				}
			}
		%>
		<div class="module-table-body">
			<form action="">
			<table id="myTable" class="tablesorter">
				<thead>
					<tr>
						<th style="width:5%; text-align: center;">ID</th>
						<th style="width:30%">Tên Tin Tức</th>
						<th style="width:25%">Danh Mục</th>
						<th style="width:5%">Trạng thái</th>
						<th style="width:15%">Hình ảnh</th>
						<th style="width:10%">Chức năng</th>
						<th style="widht:10%">
							Chọn: 
							<input type="checkbox" value="" name="chkAll">
							<input type="submit" value="Xóa" name="dels">
						</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(New item : alNew){
						%>
							<tr>
								<td class="align-center"><%=item.getId_new()%></td>
								<td><a href=""><%=item.getName()%></a></td>
								<td><%=item.getNameCat()%></td>
								<td></td>
								<td><img src="<%=request.getContextPath()%>/files/<%=item.getPicture()%>" alt ="" width="100px" height="100px"></td>
								<td align="center">
									<a href="<%=request.getContextPath()%>/admin/editNew?cid=<%=item.getId_new()%>">Sữa<img src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif" alt="edit" /></a>
									<a onClick = "return confirm('Bạn có thực sự xóa không ?')" href="<%=request.getContextPath()%>/admin/deleteNew?cid=<%=item.getId_new()%>">Xóa<img src="<%=request.getContextPath()%>/templates/admin/images/bin.gif" width="16" height="16" alt="delete" /></a>
								</td>
								<td align="center">
									<input type="checkbox" value="<%=item.getId_new()%>">
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
			<div class="numbers">
				<span>Trang:</span> 
				<a href="">1</a> 
				<span>|</span> 
				<a href="">2</a> 
				<span>|</span> 
				<span class="current">3</span> 
				<span>|</span> 
				<a href="">4</a> 
				<span>|</span> 
				<a href="">5</a> 
				<span>|</span> 
				<a href="">6</a> 
				<span>|</span> 
				<a href="">7</a>
				<span>|</span> 
				<a href="">8</a> 
				<span>|</span> 
				<a href="">9</a>
				<span>|</span> 
				<a href="">10</a>   
			</div> 
			<div style="clear: both;"></div> 
		 </div>
	
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 