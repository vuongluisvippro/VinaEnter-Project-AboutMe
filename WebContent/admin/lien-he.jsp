<%@page import="bean.Contact"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div class="grid_12">
	<!-- Example table -->
	<div class="module">
		<h2><span>Danh sách liên hệ</span></h2>
		<%
			ArrayList<Contact> alContact = new ArrayList<Contact>();
			alContact = (ArrayList<Contact>)request.getAttribute("alContact");
		%>
		<%
			if(request.getParameter("msg")!=null){
				String msg = request.getParameter("msg");
				if(msg.equals("del1")){
					out.print("<p style=\"color: green\"><strong>Xóa thông tin người liên hệ thành công</strong></p>");
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
						<th style="width:20%">Họ tên</th>
						<th style="width:15%">Email</th>
						<th style="width:20%">Address</th>
						<th style="width:10%">Phone</th>
						<th style="width:20%">Nội dung</th>
						<th style="width:10%">Chức năng</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(Contact item : alContact){
						%>
							<tr>
								<td class="align-center"><%=item.getId_contact()%></td>
								<td><%=item.getFullname()%></td>
								<td><%=item.getEmail()%></td>
								<td><%=item.getAddress()%></td>
								<td><%=item.getPhone()%></td>
								<td><%=item.getContent()%></td>
								<td align="center">
									<a onClick = "return confirm('Bạn có thực sự xóa không ?')" href="<%=request.getContextPath()%>/admin/xoa-lien-he?cid=<%=item.getId_contact()%>">Xóa<img src="<%=request.getContextPath()%>/templates/admin/images/bin.gif" width="16" height="16" alt="delete" /></a>
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