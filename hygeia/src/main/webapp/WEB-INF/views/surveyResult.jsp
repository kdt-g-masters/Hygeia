<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사-결과 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4/dist/css/bootstrap.min.css" crossorigin="anonymous">
<link href="/css/index.css" rel="stylesheet"/>
<link href="/css/chat.css" rel="stylesheet"/>
<link href="/css/my.css" rel="stylesheet"/>

<script src="/jquery-3.6.0.min.js"></script>
<script src="/js/chat.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
<style>
#surveyresult .box{
    background-color: white;
    border-radius: 30px;
    margin: 5vh 25vw 10vh;
    padding: 5em;
    height: 100%;
    box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.1);
    text-align: center;
	line-height: 150%	
}
#surveyresult .title{
	text-align: left;
}
input[type="text"]{
	text-align: center;
	font-size: 1.2em;	
	font-weight: bold;
	width: 200px;
}
input[type="submit"]{
	width: 100%;
	
}
#saveresult{
	background: linear-gradient(to left, #FCA937, #FFD37C);
	border: 0;
	font-size: 1.1em;
}

#returntomain , #gotofinal {
	font-size: 1.1em;
}
#returntomain:hover , #gotofinal:hover{
	background: linear-gradient(to left, #FCA937, #FFD37C);
	border-color: rgba(255, 255, 255, 0.3);
}
</style>
</head>
<body class="bg-color">
	<!-- navbar -->
	<%@ include file="navbar.jsp" %>
	<%@ include file="surveyCalculating.jspf" %>
	<main>
	
	<section id="section">
    <!-- 의심 성인병 (value 를 DB 로 부터 받아오기) --> 
	    <div id="surveyresult">
	    <div class="box"> 
	    	<h4 class="title"><b>${memberInfo.id}님 건강 진단 결과</b></h4>
			<hr>
			<br><br>
			<h4>의심 성인병</h4><br>  <h1><span class="underline"><b><c:out value="${resultName}" /></b></span></h1>
			<br><br><br>
			
			<!-- 추천 식재료 : infodisease테이블 접근-->
			<c:forEach items="${info}" var="dto2" varStatus="number">
				<c:if test="${dto2.name == resultName}"> 
					<div class="rcm-food">
						<h5><span class="underline"><c:out value="${dto2.name}" /></span>에 좋은 식재료들</h5><br>
						<div class="foodList">
							<script>
								 var str = "${dto2.foods}";
		     					 var list = str.split(',');
		     					 for(var i in list)
		      					 document.write( '<span class="btn btn-primary md-2">'+list[i]+'</span>' );
		    				</script>
						</div>
					</div>
					</c:if> 
				</c:forEach> 
				<br><br><hr><br>
			    <form action="/survey3" method="post" > 
			    	<h5>
					<input type="text" value="${memberInfo.id}" name="member_id" readonly /> 님의 의심 성인병 진단 결과 : 
					<input type="text" value="<c:out value='${resultName}'/> " name="resultDisease" readonly/> </h5><br>
					
					<input type="submit" id="saveresult" class="btn btn-primary mx-1" value="결과 저장하기" name="saveresult" /> <br> 
				</form> 
				
				<br> 
					<form action="/surveynext" method="POST" > 
					<input type="submit" id="gotofinal" class="btn btn-outline-primary mx-1" value="마지막 페이지로 이동" name="gotofinal" />  
				</form>
				<br>
				
				<form action="/survey0" method="POST" > 
					<input type="submit" id="returntomain" class="btn btn-outline-primary mx-1" value="다시 테스트 하기" name="returntomain" /> 
				</form> 
				<br>
			</div>
			<br>
		</div>
	    
	
	</section>
    </main>
	
	<!-- chatbot -->
	<div id="ch-window" style="display:none">
		<div class="menu-bar">
			<div class="chat-close"><span id="close">
				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 19 19">
		  			<path fill-rule="evenodd" d="M13.854 2.146a.5.5 0 0 1 0 .708l-11 11a.5.5 0 0 1-.708-.708l11-11a.5.5 0 0 1 .708 0Z"/>
		  			<path fill-rule="evenodd" d="M2.146 2.146a.5.5 0 0 0 0 .708l11 11a.5.5 0 0 0 .708-.708l-11-11a.5.5 0 0 0-.708 0Z"/>
				</svg>
			</span></div>
		</div>	
		
		<div class="ch-input">
			<hr>
			<div class="input-group mb-3">
			    <input type="text" id="request" class="form-control" placeholder="..입력 시 첫대화로 이동" aria-label="Recipient's username" aria-describedby="basic-addon2">
			    <input type="button" id="event1" class="ch-bnt" value="입력" name="event">
				    <!-- send 부분 아이콘으로 변경하기
				    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send-fill" viewBox="0 0 16 16">
		  				<path d="M15.964.686a.5.5 0 0 0-.65-.65L.767 5.855H.766l-.452.18a.5.5 0 0 0-.082.887l.41.26.001.002 4.995 3.178 3.178 4.995.002.002.26.41a.5.5 0 0 0 .886-.083l6-15Zm-1.833 1.89L6.637 10.07l-.215-.338a.5.5 0 0 0-.154-.154l-.338-.215 7.494-7.494 1.178-.471-.47 1.178Z"/>
					</svg> 
					-->
				<input type="button" id="event2" class="ch-bnt" value="대화시작" name="event">
			</div>
		</div>
		
		<div id="record-box">
			<div id="sound"></div>
			<div id="record"></div>
		</div>
	
	</div>
	
	<!-- footer -->
	<%@ include file="footer.jsp" %>
		
	<div class="floating-container">
	  <div class="floating-button">
		<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 16 16">
		  <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
		  <!-- chatbot modal? toggle? -->
		</svg>
	  </div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>