<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>댓글 삭제</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
			Connection conn2=null;
			Statement stmt2=null;
			String url2="jdbc:mysql://127.0.0.1:3306/traveley";
			String db_id2="root";
			String db_pw2="iotiot";
			
			String number=request.getParameter("del");
			
			String sql2="delete from comment3 where num="+number+";";
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn2=DriverManager.getConnection(url2, db_id2, db_pw2);
				stmt2=conn2.createStatement();
				int result=stmt2.executeUpdate(sql2);
				System.out.println("삭제된 댓글 수 : "+result);
				response.sendRedirect("gangnam_comment_developer.jsp");
			}catch(Exception e){
				System.out.println("댓글 삭제 중 오류 발생 : "+e);
			}finally{
				try{
					if(stmt2!=null)stmt2.close();
					if(conn2!=null)conn2.close();
				}catch(Exception ex){
					System.out.println("댓글 삭제 접속 해제 중 오류발생 : "+ex);
				}
			}
		%>
	</body>
</html>