# Remove this code:

				<div class="aside">
					<h2>Những Câu Nói Hay</h2>
					<%
						ArrayList<Say> alSay = new ArrayList<Say>();
						Say item = new Say();
						if(request.getAttribute("alSay")!=null){
							alSay = (ArrayList<Say>)request.getAttribute("alSay");
						}
						int index = new Random().nextInt(alSay.size());
						item = alSay.get(index);
					%>
					<ul style="list-style-type:none">
						<li>
								<p style="color: <%=LibraryUsefull.getColorRandom()%>">
									<%=item.getContent()%>
								</p>
							<span class="author"><%=item.getAuthor()%></span>
						</li>	
					</ul>
				</div>
        
# Run: http://localhost:8080/aboutme.vuongluis.com/
