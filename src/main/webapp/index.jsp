    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=2100px, initial-scale=1">
		<title>Main</title>
		<link rel="stylesheet" href="css/index.css">
		<script src="jquery-3.7.1.min.js"></script>
		<script type="text/javascript" src="js/index.js"></script>
	</head>
	<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
		<div id="wrap">
			<div id="titlename">Seoul Traveley</div>
			
			<div class="images">
	            <ul class="pan">
	                <li><img src="images/seoul.png" class="slide"></li>
	                <li><img src="images/seoul2.jpg" class="slide"></li>
	                <li><img src="images/seoul3.jpg" class="slide"></li>
	            </ul>
	        </div>
	        
			<div id="bar"></div>
		</div>
		
		<div id="wrap2">
			<form method="post" action="myeongdong.do">
                  	<div id="btn">
                  		<input type="submit" value="명동" id="name">
              			<img src="images/myeongdong.jpg">
              		</div>
           	</form>
           	<form method="post" action="jongro.do">
               	<div id="btn">
               		<input type="submit" value="종로" id="name">
           			<img src="images/jongro.jpg">
           		</div>
           	</form>
           	<form method="post" action="gangnam.do">
               	<div id="btn">
               		<input type="submit" value="강남" id="name">
           			<img src="images/gangnam.jpg">
           		</div>
          	</form>
		</div>
		
		<div id="wrap3">
			<div id="run"><img src="images/email.png"></div>
	        <div id="email_back"></div>
	        <div id="email">
	            <div id="detail_text">문의사항</div>
	            <div id="input1">제목<input type="text" id="text1" placeholder="최대 50자"></div><br>
	            <div id="input2">내용<input type="text" id="text2" placeholder="최대 200자"></div>
	            <button id="send">전송</button>
	        </div>
        </div>
	</body>
</html>