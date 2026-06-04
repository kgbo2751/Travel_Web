<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>이미지와 글 삭제</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
			Connection conn=null;
			Statement stmt=null;
			String url="jdbc:mysql://127.0.0.1:3306/traveley";
			String db_id="root";
			String db_pw="iotiot";
			
			String number=request.getParameter("del");
			
			String sql="delete from jongro where img1="+0+";";
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection(url, db_id, db_pw);
				stmt=conn.createStatement();
				int result=stmt.executeUpdate(sql);
				System.out.println("삭제된 수 : "+result);
				response.sendRedirect("jongro_content_developer.jsp");
			}catch(Exception e){
				System.out.println("삭제 중 오류 발생 : "+e);
			}finally{
				try{
					if(stmt!=null)stmt.close();
					if(conn!=null)conn.close();
				}catch(Exception ex){
					System.out.println("삭제 접속 해제 중 오류발생 : "+ex);
				}
			}
		%>
	</body>
</html>