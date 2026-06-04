<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 페이지(이미지와 글 작성과 삭제)</title>
		<link rel="stylesheet" href="css/content.css">
		<script type="text/javascript" src="js/function.js"></script>
	</head>
	<body>
		<script>
			pw = prompt("비밀번호를 입력해주세요.");
			if(pw=='0621'){
				
	        }else{
	            alert('비밀번호가 일치하지 않습니다.');
	            location.reload();
	        }
		</script>
		<div id="wrap">
			<div id="main">
				<form method="post" action="myeongdong_content_submit.jsp">
				<div id="span_sec1">
					<span>이미지1</span><input type="file" accept="image/png, image/jpg, image/gif, image/jpeg" name="im1">
					<span>텍스트1</span><input type="text" name="de1">
				</div>
				<div id="span_sec2">
					<span>이미지2</span><input type="file" accept="image/png, image/jpg, image/gif, image/jpeg" name="im2">
					<span>텍스트2</span><input type="text" name="de2">
				</div>
				<div id="span_sec3">
					<span>이미지3</span><input type="file" accept="image/png, image/jpg, image/gif, image/jpeg" name="im3">
					<span>텍스트3</span><input type="text" name="de3">
				</div>
				<div id="span_sec4">
					<span>이미지4</span><input type="file" accept="image/png, image/jpg, image/gif, image/jpeg" name="im4">
					<span>텍스트4</span><input type="text" name="de4">
				</div>
				<div id="span_sec5">
					<span>이미지5</span><input type="file" accept="image/png, image/jpg, image/gif, image/jpeg" name="im5">
					<span>텍스트5</span><input type="text" name="de5">
				</div>
				<div id="span_sec6">
					<span>이미지6</span><input type="file" accept="image/png, image/jpg, image/gif, image/jpeg" name="im6">
					<span>텍스트6</span><input type="text" name="de6">
				</div>
					<input type="submit" value="완료">
				</form>
			</div>
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
					%>
						<div id="sub">
							<table>
					<%
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
								<tr>
									<td><img src="images/<%=im1 %>"></td>
									<td><%=de1 %></td>
									<td><img src="images/<%=im2 %>"></td>
									<td><%=de2 %></td>
									<td><img src="images/<%=im3 %>"></td>
									<td><%=de3 %></td>
									<td><img src="images/<%=im4 %>"></td>
									<td><%=de4 %></td>
									<td><img src="images/<%=im5 %>"></td>
									<td><%=de5 %></td>
									<td><img src="images/<%=im6 %>"></td>
									<td><%=de6 %></td>
									<td>
										<form method="get" action="myeongdong_content_delete.jsp">
											<input type="hidden" value="<%=im1 %>" name="del">
										</form>
										<a href="myeongdong_content_delete.jsp?del=<%=im1 %>">삭제</a>
									</td>
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
						if(rs!=null)rs.close();
						if(stmt!=null)stmt.close();
						if(conn!=null)conn.close();
					}catch(Exception ex){
						System.out.println("접속 해제중 오류 발생 : "+ex);
					}
				}
			%>
		</div>
	</body>
</html>