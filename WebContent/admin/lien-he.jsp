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
			<%         
				int sotrang = (Integer)request.getAttribute("sotrang");
			 	int current_page = (Integer)request.getAttribute("current_page");
				 	out.print("<strong>Trang: </strong>"); 
				 	for(int i = 1;i <= sotrang;i++){
				 		if(current_page == i){
				 			if(i == sotrang){
				 				%>
				 					<a href="<%=request.getContextPath()%>/admin/lien-he?page=<%=i%>" class="current"><%=i%></a>
				 				<%	
				 			}else{
				 				%>
				 					<a href="<%=request.getContextPath()%>/admin/lien-he?page=<%=i%>" class="current"><%=i%></a> |
				 				<%
				 			}
				 			
				 		}else if(i == sotrang){
				 			%>
				 				<a href="<%=request.getContextPath()%>/admin/lien-he?page=<%=i%>"><%=i%></a>
				 			<%
				 		}else{
				 			%>
			 					<a href="<%=request.getContextPath()%>/admin/lien-he?page=<%=i%>"><%=i%></a> |
			 				<%
				 		}
				 	}
			 %>
		 </div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 