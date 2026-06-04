<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>명동 관리자 페이지(댓글 삭제)</title>
		<link rel="stylesheet" href="css/developer.css">
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
					String sql2="select * from comment2;";
					System.out.println(sql2);
					rs2=stmt2.executeQuery(sql2);
					%>
						<div id="sub">
							<table>
								<tr>
									<th id="sort1">번호</th>
									<th id="sort1">제목</th>
									<th id="sort1">내용</th>
									<th>삭제</th>
								</tr>
					<%
					while(rs2.next()){
						String num=rs2.getString("num");
						String title=rs2.getString("title");
						String detail=rs2.getString("detail");
						%>
							<tr>
								<td id="sort1"><%=num %></td>
								<td id="sort2"><%=title %></td>
								<td id="sort2"><%=detail %></td>
								<td>
									<form method="get" action="jongro_comment_delete.jsp">
										<input type="hidden" value="<%=num %>" name="del">
									</form>
									<a href="jongro_comment_delete.jsp?del=<%=num %>">삭제</a>
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
						if(rs2!=null)rs2.close();
						if(stmt2!=null)stmt2.close();
						if(conn2!=null)conn2.close();
					}catch(Exception ex){
						System.out.println("접속 해제중 오류 발생 : "+ex);
					}
				}
			%>
		</div>
	</body>
</html>