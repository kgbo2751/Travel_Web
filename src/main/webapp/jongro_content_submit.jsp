<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>이미지와 글 작성</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
		
			Connection conn=null;
			Statement stmt=null;
			String url="jdbc:mysql://127.0.0.1:3306/traveley";
			String db_id="root";
			String db_pw="iotiot";
			
			String im1=request.getParameter("im1");
			String de1=request.getParameter("de1");
			String im2=request.getParameter("im2");
			String de2=request.getParameter("de2");
			String im3=request.getParameter("im3");
			String de3=request.getParameter("de3");
			String im4=request.getParameter("im4");
			String de4=request.getParameter("de4");
			String im5=request.getParameter("im5");
			String de5=request.getParameter("de5");
			String im6=request.getParameter("im6");
			String de6=request.getParameter("de6");
			
			String sql="insert into jongro (img1, detail1, img2, detail2, img3, detail3, img4, detail4, img5, detail5, img6, detail6)";
			sql+="values ('"+im1+"', '"+de1+"', '"+im2+"', '"+de2+"', '"+im3+"', '"+de3+"', '"+im4+"', '"+de4+"', '"+im5+"', '"+de5+"', '"+im6+"', '"+de6+"');";
		
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection(url, db_id, db_pw);
				stmt=conn.createStatement();
				stmt.execute(sql);
				response.sendRedirect("jongro_content_developer.jsp");
			}catch(Exception e){
				System.out.println("작성 중 오류 발생 : "+e);
			}finally{
				try{
					if(stmt!=null)stmt.close();
					if(conn!=null)conn.close();
				}catch(Exception ex){
					System.out.println("작성 해제 중 오류 발생 : "+ex);
				}
			}
		%>
	</body>
</html>