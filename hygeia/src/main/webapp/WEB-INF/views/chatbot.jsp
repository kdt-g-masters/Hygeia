<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4/dist/css/bootstrap.min.css" crossorigin="anonymous">
<link href="/css/index.css" rel="stylesheet"/>
<link href="/css/chat.css" rel="stylesheet"/>
<script src="/jquery-3.6.0.min.js"></script>
<script src="/js/chat.js"></script>
<script type="text/javascript">
	
</script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<%@ include file="navbar.jsp" %>

	<main>
		<div id="box1">
			<div id="mainText">
				<p>당신은 ( </p>
				<p class="texts">
				  <c:forEach items="${ diseaseList }" var="dto">				  	
				  	<span><a href="/diseaseresult?cntntsSn=${ dto.cntntsSn }">${ dto.name }</a></span>
				  </c:forEach>			  
				</p>
				<p> ) 에 걸리실 수 있습니다.</p>		
			</div>	
		</div>
		<div id="box2">
			<div class="row">
			  <c:forEach items="${ diseaseList }" var="dto">
				  <div class="col-sm-1">
				    <a href="/diseaseresult?cntntsSn=${ dto.cntntsSn }">
				      <div class="card shadow">				      
				        <div class="card-body">
				          <h5 class="card-title"> ${ dto.name } </h5>
				        </div>				      
				      </div>
				    </a>
				  </div>
			  </c:forEach>
			</div>		
		</div>			
	</main>

<div id="ch-window" style="display:none">
	<div class="menu-bar">
		<span class="close-chat"><a id="close" href="/">
			<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 19 19">
	  			<path fill-rule="evenodd" d="M13.854 2.146a.5.5 0 0 1 0 .708l-11 11a.5.5 0 0 1-.708-.708l11-11a.5.5 0 0 1 .708 0Z"/>
	  			<path fill-rule="evenodd" d="M2.146 2.146a.5.5 0 0 0 0 .708l11 11a.5.5 0 0 0 .708-.708l-11-11a.5.5 0 0 0-.708 0Z"/>
			</svg>
		</a></span>
	</div>	
	
	<div class="ch-input">
		<hr>
		<div class="input-group mb-3">
		    <input type="text" id="request" class="form-control" placeholder="질문을 입력하세요." aria-label="Recipient's username" aria-describedby="basic-addon2">
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
