<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=2000px, initial-scale=1">
		<title>Myeongdong</title>
		<link rel="stylesheet" href="css/myeongdong.css">
		<script src="jquery-3.7.1.min.js"></script>
		<script type="text/javascript" src="js/myeongdong.js"></script>
	</head>
	<body>
		<nav>
            <ul class="main">
                <li><img src="images/menu.png" id="icon">
                    <ul class="sub">
                        <form method="post" action="seoul_traveley.do">
                        	<div class="list">
                    			<input type="image" img src="images/home.png">
                    		</div>
                    	</form>
                    	<form method="post" action="jongro.do">
                    		<div class="list">
                    			<input type="submit" value="종로" class="list_text">
                    		</div>
                    	</form>
                    	<form method="post" action="gangnam.do">
	                    	<div class="list">
	                    		<input type="submit" value="강남" class="list_text">
	                    	</div>
                    	</form>
                    </ul>
                </li>
            </ul>
        </nav>

	    <div id="place">
			<div id="sec1">
				<div class="images">
		            <ul class="pan">
		                <li><img src="images/myeongdong.jpg" class="slide"></li>
		                <li><img src="images/myeongdong2.jpg" class="slide"></li>
		                <li><img src="images/myeongdong3.jpg" class="slide"></li>
		            </ul>
		        </div>
		        
		        <div id="map">
		        	<div id="daumRoughmapContainer1701737617581" class="root_daum_roughmap root_daum_roughmap_landing"></div>
					<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
					<script charset="UTF-8">
						new daum.roughmap.Lander({
							"timestamp" : "1701737617581",
							"key" : "2h3vr",
							"mapWidth" : "550",
							"mapHeight" : "200"
						}).render();
					</script>
		        </div>
			</div>
			
			<div id="sec2">
				<div id="content_wrap">
					<%
						request.setCharacterEncoding("UTF-8");
					
						Connection conn=null;
						Statement stmt=null;
						ResultSet rs=null;
						String url="jdbc:mysql://127.0.0.1:3306/traveley";
						String db_id="root";
						String db_pw="iotiot";
						try{
							Class.forName("com.mysql.cj.jdbc.Driver");
							conn=DriverManager.getConnection(url, db_id, db_pw);
							stmt=conn.createStatement();
							String sql="select * from myeongdong;";
							System.out.println(sql);
							rs=stmt.executeQuery(sql);
							
							while(rs.next()){
								String im1=rs.getString("img1");
								String de1=rs.getString("detail1");
								String im2=rs.getString("img2");
								String de2=rs.getString("detail2");
								String im3=rs.getString("img3");
								String de3=rs.getString("detail3");
								String im4=rs.getString("img4");
								String de4=rs.getString("detail4");
								String im5=rs.getString("img5");
								String de5=rs.getString("detail5");
								String im6=rs.getString("img6");
								String de6=rs.getString("detail6");
					%>
								<div id="food">
									<img src="images/food.png" class="icon">
									<div id="content1">
										<img src="images/<%=im1 %>" id="content_img">
										<div id="content_text"><%=de1 %></div>
									</div>
									<div id="content2">
										<img src="images/<%=im2 %>" id="content_img">
										<div id="content_text"><%=de2 %></div>
									</div>
									<div id="content3">
										<img src="images/<%=im3 %>" id="content_img">
										<div id="content_text"><%=de3 %></div>
									</div>
								</div>
								<div id="culture">
									<img src="images/culture.png" class="icon">
									<div id="content4">
										<img src="images/<%=im4 %>" id="content_img">
										<div id="content_text"><%=de4 %></div>
									</div>
									<div id="content5">
										<img src="images/<%=im5 %>" id="content_img">
										<div id="content_text"><%=de5 %></div>
									</div>
									<div id="content6">
										<img src="images/<%=im6 %>" id="content_img">
										<div id="content_text"><%=de6 %></div>
									</div>
								</div>
					<%
							}
					%>
						<%
						}catch(Exception e){
							System.out.println("접속 중 오류 발생 : "+e);
						}finally{
							try{
								if(rs!=null)rs.close();
								if(stmt!=null)stmt.close();
								if(conn!=null)conn.close();
							}catch(Exception ex){
								System.out.println("접속 해제중 오류 발생 : "+ex);
							}
						}
					%>
				</div>
				
				<div id="comment">
					<img src="images/comment.png" class="comment_icon">
					<div id="comment_wrap">
						<div id="comment_main">
							<form method="post" action="myeongdong_comment_submit.jsp">
								<span>제목</span><input type="text" name="ti" id="input1" placeholder="최대 50자">
								<span>내용</span><input type="text" name="de" id="input2" placeholder="최대 200자">
								<input type="submit" value="완료" id="input3">
							</form>
						</div>
						<%
							request.setCharacterEncoding("UTF-8");
						
							Connection conn2=null;
							Statement stmt2=null;
							ResultSet rs2=null;
							String url2="jdbc:mysql://127.0.0.1:3306/traveley";
							String db_id2="root";
							String db_pw2="iotiot";
							try{
								Class.forName("com.mysql.cj.jdbc.Driver");
								conn2=DriverManager.getConnection(url2, db_id2, db_pw2);
								stmt2=conn2.createStatement();
								String sql2="select * from comment1;";
								System.out.println(sql2);
								rs2=stmt2.executeQuery(sql2);
								%>
									<div id="sub">
										<table>
											<tr>
												<th id="sort1" class="num">번호</th>
												<th id="sort1" class="title">제목</th>
												<th id="sort1" class="detail">내용</th>
											</tr>
								<%
								while(rs2.next()){
									String num=rs2.getString("num");
									String title=rs2.getString("title");
									String detail=rs2.getString("detail");
									%>
										<tr>
											<td id="sort1" class="num"><%=num %></td>
											<td id="sort2" class="title"><%=title %></td>
											<td id="sort2" class="detail"><%=detail %></td>
										</tr>
									<%
								}
								%>
										</table>
									</div>
								<%
							}catch(Exception e){
								System.out.println("접속 중 오류 발생 : "+e);
							}finally{
								try{
									if(rs2!=null)rs2.close();
									if(stmt2!=null)stmt2.close();
									if(conn2!=null)conn2.close();
								}catch(Exception ex){
									System.out.println("접속 해제중 오류 발생 : "+ex);
								}
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>