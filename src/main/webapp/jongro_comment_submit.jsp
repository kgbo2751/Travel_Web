<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>댓글 작성</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
		
			Connection conn2=null;
			Statement stmt2=null;
			String url2="jdbc:mysql://127.0.0.1:3306/traveley";
			String db_id2="root";
			String db_pw2="iotiot";
			
			String ti=request.getParameter("ti");
			String de=request.getParameter("de");
			
			String sql2="insert into comment2 (title, detail)";
			sql2+="values ('"+ti+"', '"+de+"');";
		
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn2=DriverManager.getConnection(url2, db_id2, db_pw2);
				stmt2=conn2.createStatement();
				stmt2.execute(sql2);
				response.sendRedirect("jongro.jsp");
			}catch(Exception e){
				System.out.println("댓글 작성 중 오류 발생 : "+e);
			}finally{
				try{
					if(stmt2!=null)stmt2.close();
					if(conn2!=null)conn2.close();
				}catch(Exception ex){
					System.out.println("댓글 작성 해제 중 오류 발생 : "+ex);
				}
			}
		%>
	</body>
</html>