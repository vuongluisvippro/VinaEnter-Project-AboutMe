<%@page import="java.util.ArrayList"%>
<%@page import="bean.Say"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div class="bottom-spacing">
	  <!-- Button -->
	  <div class="float-left">
		  <a href="<%=request.getContextPath()%>/admin/them-moi-cau-noi" class="button">
			<span>Thêm câu nói hay <img src="<%=request.getContextPath()%>/templates/admin/images/plus-small.gif" alt="ThÃªm tin"></span>
		  </a>
	  </div>
	  <div class="clear"></div>
</div>

<div class="grid_12">
	<!-- Example table -->
	<div class="module">
		<h2><span>Danh sách những câu nói hay</span></h2>
		<%
			ArrayList<Say> alUser = new ArrayList<Say>();
			alSay = (ArrayList<Say>)request.getAttribute("alSay");
		%>
		<%
			if(request.getParameter("msg")!=null){
				String msg = request.getParameter("msg");
				if(msg.equals("add1")){
					out.print("<p style=\"color: green\"><strong>Thêm mới câu nói thành công</strong></p>");
				}else if(msg.equals("add0")){
					out.print("<p style=\"color: red\"><strong>Thêm mới câu nói thất bại. Vui lòng thử lại</strong></p");
				}
			}
		
			if(request.getParameter("msg")!=null){
				String msg = request.getParameter("msg");
				if(msg.equals("edit1")){
					out.print("<p style=\"color: green\"><strong>Cập nhật câu nói thành công</strong></p>");
				}else if(msg.equals("edit0")){
					out.print("<p style=\"color: red\"><strong>Cập nhật câu nói thất bại.Vui lòng thử lại</strong></p");
				}
			}
		
			if(request.getParameter("msg")!=null){
				String msg = request.getParameter("msg");
				if(msg.equals("del1")){
					out.print("<p style=\"color: green\"><strong>Xóa câu nói thành công</strong></p>");
				}else if(msg.equals("del0")){
					out.print("<p style=\"color: red\"><strong>Xóa câu nói thất bại.Vui lòng thử lại</strong></p>");
				}
			}
		%>
		<div class="module-table-body">
			<form action="">
			<table id="myTable" class="tablesorter">
				<thead>
					<tr>
						<th style="width:5%; text-align: center;">ID</th>
						<th style="width:40%">Nội dung</th>
						<th style="width:40%">Tác giả</th>
						<th style="width:20%">Chức năng</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(Say item : alSay){
						%>
							<tr>
								<td class="align-center"><%=item.getId_saying()%></td>
								<td><a href="<%=request.getContextPath()%>/admin/cap-nhat-cau-noi?cid=<%=item.getId_saying()%>"><%=item.getContent()%></a></td>
								<td><%=item.getAuthor()%></td>
								<td align="center">
									<a href="<%=request.getContextPath()%>/admin/editUser?cid=<%=item.getId_saying()%>">Sữa<img src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif" alt="edit" /></a>
									<a onClick = "return confirm('Bạn có thực sự xóa không ?')" href="<%=request.getContextPath()%>/admin/deleteUser?cid=<%=item.getId_saying()%>">Xóa<img src="<%=request.getContextPath()%>/templates/admin/images/bin.gif" width="16" height="16" alt="delete" /></a>
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