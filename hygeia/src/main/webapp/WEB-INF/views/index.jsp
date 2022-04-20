<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4/dist/css/bootstrap.min.css" crossorigin="anonymous">
<link href="/css/index.css" rel="stylesheet"/>
<script src="/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$(".floating-button").on("click",function(){
			location.href = "/chatbotajax";
		});
	});
</script>
</head>
<body class="bg-color">
	<!-- navbar -->
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
		<div class="row">
			<div class="col-lg-12 mainTitle">
				<input class="btn btn-primary" type="button" value="생활습관병"/>
			</div>			
		</div>
		<div id="box2">
			<div class="row">
			  <c:forEach items="${ diseaseList }" var="dto">
				  <div class="col-sm-4 col-md-2 col-lg-2 col-xl-1">
				    <a href="/diseaseresult?cntntsSn=${ dto.cntntsSn }">
				      <div class="card shadow diseaseCardStyle">				      
				        <div class="card-body cardTextCenter">
				          <h5 class="card-title"> ${ dto.name } </h5>
				        </div>				      
				      </div>
				    </a>
				  </div>
			  </c:forEach>
			</div>		
		</div>
		<div class="row">
			<div class="col-lg-12 mainTitle">
				<a id="myInfo" class="btn btn-primary btn-lg" href="survey1">					
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard-pulse" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M10 1.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-1Zm-5 0A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5v1A1.5 1.5 0 0 1 9.5 4h-3A1.5 1.5 0 0 1 5 2.5v-1Zm-2 0h1v1H3a1 1 0 0 0-1 1V14a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V3.5a1 1 0 0 0-1-1h-1v-1h1a2 2 0 0 1 2 2V14a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V3.5a2 2 0 0 1 2-2Zm6.979 3.856a.5.5 0 0 0-.968.04L7.92 10.49l-.94-3.135a.5.5 0 0 0-.895-.133L4.232 10H3.5a.5.5 0 0 0 0 1h1a.5.5 0 0 0 .416-.223l1.41-2.115 1.195 3.982a.5.5 0 0 0 .968-.04L9.58 7.51l.94 3.135A.5.5 0 0 0 11 11h1.5a.5.5 0 0 0 0-1h-1.128L9.979 5.356Z"/>
					</svg>
					내 건강 정보 확인하기					
				</a>
			</div>			
		</div>					
	</main>
	
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