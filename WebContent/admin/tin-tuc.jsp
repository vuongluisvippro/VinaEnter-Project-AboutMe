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
	<form id="frmTimKiem" method="post" action="<%=request.getContextPath()%>/admin/tin-tuc" style="padding-bottom:18px">
		Tiêu đề: 
		<input type="search" value="" size="34" placeholder="Từ khóa tin tức" name="searchName"/>
		Danh mục:  
		<select style="max-width:200px" name="searchDM">
			<option value="">Tất cả danh mục</option>
			<%
				for(Category item : alCat){
					%>
						<option value="<%=item.getId_cat()%>"><%=item.getName()%></option>
					<%
				}
			%>
		</select>
		Trạng thái:
		<select name="searchActive">
			<option value="">Tất cả</option>
			<option value="active">Kích hoạt</option>
			<option value="noactive">Không kích hoạt</option>
		</select>
		<input id="btnSearch" type="submit" value="Tìm kiếm" name="search">
		<input id="showall" type="submit" value="Hiển thị tất cả" name="showall">
	</form>
	<div class="grid_12">
		<!-- Example table -->
		<div class="module">
			<h2><span>Danh sách tin tức</span></h2>
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
			<%
				ArrayList<New> alNew = new ArrayList<New>();
				if(request.getAttribute("alNew")!=null){
					alNew = (ArrayList<New>)request.getAttribute("alNew");	
					%>
						<div class="module-table-body">
						<form action="">
						<table id="myTable" class="tablesorter">
							<thead>
								<tr>
									<th style="width:5%; text-align: center;">ID</th>
									<th style="width:30%">Tên Tin Tức</th>
									<th style="width:30%">Danh Mục</th>
									<th style="width:5%">Trạng thái</th>
									<th style="width:10%">Hình ảnh</th>
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
											<td><a href="<%=request.getContextPath()%>/admin/cap-nhat-tin-tuc?cid=<%=item.getId_new()%>"><%=item.getName()%></a></td>
											<td><%=item.getNameCat()%></td>
											<td align="center" class="active-<%=item.getId_new()%>">
												<a href="javascript:void(0)"  onclick="return doActive(<%=item.getId_new()%>,<%=item.getIs_active()%>)" title="">
													<%
														if(item.getIs_active() == 1){
															%><img src="<%=request.getContextPath()%>/templates/admin/images/tick-circle.gif" alt="tick"/><%
														}else{
															%><img src="<%=request.getContextPath()%>/templates/admin/images/minus-circle.gif" alt="minus"/><%
														}
													%>
												</a>
											</td>
											<td class="align-center"><img src="<%=request.getContextPath()%>/files/<%=item.getPicture()%>" alt ="" width="100px" height="100px"></td>
											<td align="center">
												<a href="<%=request.getContextPath()%>/admin/cap-nhat-tin-tuc?cid=<%=item.getId_new()%>">Sữa<img src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif" alt="edit" /></a>
												<a onclick = "return confirm('Bạn có thực sự xóa không ?')" href="<%=request.getContextPath()%>/admin/xoa-tin-tuc?cid=<%=item.getId_new()%>">Xóa<img src="<%=request.getContextPath()%>/templates/admin/images/bin.gif" width="16" height="16" alt="delete" /></a>
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
					 <%         
						int sotrang = (Integer)request.getAttribute("sotrang");
					 	int current_page = (Integer)request.getAttribute("current_page");
					 	out.print("<strong>Trang: </strong>"); 
					 	for(int i = 1;i <= sotrang;i++){
					 		if(current_page == i){
					 			if(i == sotrang){
					 				%>
					 					<a href="<%=request.getContextPath()%>/admin/tin-tuc?page=<%=i%>" class="current"><%=i%></a>
					 				<%	
					 			}else{
					 				%>
					 					<a href="<%=request.getContextPath()%>/admin/tin-tuc?page=<%=i%>" class="current"><%=i%></a> |
					 				<%
					 			}
					 			
					 		}else if(i == sotrang){
					 			%>
					 				<a href="<%=request.getContextPath()%>/admin/tin-tuc?page=<%=i%>"><%=i%></a>
					 			<%
					 		}else{
					 			%>
				 					<a href="<%=request.getContextPath()%>/admin/tin-tuc?page=<%=i%>"><%=i%></a> |
				 				<%
					 		}
					 	}
					 %>
					 </div>
					<%
				}else if(request.getAttribute("listSearch")!=null){
					alNew = (ArrayList<New>)request.getAttribute("listSearch");
					%>
						<div class="module-table-body">
						<form action="">
						<table id="myTable" class="tablesorter">
							<thead>
								<tr>
									<th style="width:5%; text-align: center;">ID</th>
									<th style="width:30%">Tên Tin Tức</th>
									<th style="width:30%">Danh Mục</th>
									<th style="width:5%">Trạng thái</th>
									<th style="width:10%">Hình ảnh</th>
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
											<td><a href="<%=request.getContextPath()%>/admin/cap-nhat-tin-tuc?cid=<%=item.getId_new()%>"><%=item.getName()%></a></td>
											<td><%=item.getNameCat()%></td>
											<td></td>
											<td class="align-center"><img src="<%=request.getContextPath()%>/files/<%=item.getPicture()%>" alt ="" width="100px" height="100px"></td>
											<td align="center">
												<a href="<%=request.getContextPath()%>/admin/cap-nhat-tin-tuc?cid=<%=item.getId_new()%>">Sữa<img src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif" alt="edit" /></a>
												<a onClick = "return confirm('Bạn có thực sự xóa không ?')" href="<%=request.getContextPath()%>/admin/xoa-tin-tuc?cid=<%=item.getId_new()%>">Xóa<img src="<%=request.getContextPath()%>/templates/admin/images/bin.gif" width="16" height="16" alt="delete" /></a>
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
					<%
				}
			%>
			<script type="text/javascript">
				function doActive(idnews,active){
					$.ajax({
						url: '<%=request.getContextPath()%>/admin/ajax',
						type: 'POST',
						cache: false,
						data: {
							id_news: idnews,
							is_active: active,
						},
						success: function(data){
							$('.active-'+idnews).html(data);
						},
						error: function (data){
							alert('Có lỗi xảy ra nhé');
						}
					});
				}
			</script>		
	</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 