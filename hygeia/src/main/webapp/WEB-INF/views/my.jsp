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
<link href="/css/chat.css" rel="stylesheet"/>
<link href="/css/my.css" rel="stylesheet"/>
<script src="/jquery-3.6.0.min.js"></script>
<script src="/js/chat.js"></script>
<script>
	$(document).ready(function() {
		/* 마이페이지 메뉴 underline */
		var marker = document.querySelector('#marker');
		var item = document.querySelectorAll('#section nav a');
		
		
		function indicator(e) {
			marker.style.left = e.offsetLeft + 'px';
			marker.style.width = e.offsetWidth + 'px';
		}
		
		item.forEach(link => {
			link.addEventListener("click", (e) => {	
				indicator(e.target);			
			})
		})
		
	});
	
</script>
<style>
#mysurveyresult{
	display: none;
}
</style>
</head>
<body class="bg-color">
	<!-- navbar -->
	<%@ include file="navbar.jsp" %>
	
	<main>
	
		<section id="section">
			<div class="col-lg-12 mainTitle">
				<a id="title" class="btn btn-primary btn-lg" href="">MY PAGE</a></div>	
			
			<nav>
				<div id="marker"></div>
				<a href="#">내 건강 결과</a>
				<a href="#">후기 관리</a>
				<a href="#">내 정보 수정</a>
			</nav>
			<!-- 내 건강 결과 메뉴  -->
			<div id="mysurveyresult">
				<div class="mypage-box"> 
				<!-- DB(Storage)테이블에서 세션아이디의 건강 진단 결과 select 후 mypage view에 전달 -->
					<h4><b>${ sessionid }님 건강 진단 결과</b></h4>
					<hr>
					<h4>생활습관병 중 <br> 
					<span class="underline">(병명)<%--  ${diseaseName} --%></span> 발생 가능성이 있습니다.<br> 
					가장 효과적이고 간편하게 식재료를 활용한 식습관을 개선해보세요.</h4>
					
					<div class="content"></div>
					
					<div class="rcm-food">
						<h5>(병명)<%--  ${diseaseName} --%>에 좋은 음식들</h5>
				   <%-- <c:foreach items="${helpfulfoodlist}" var="dto">
						<span class="btn btn-primary md-2">
							<a href="/food?num=${dto.foodnum}"> ${ dto.name }</a>
						</span>
						</c:foreach> --%>
						<div class="foodList">
							<span class="btn btn-primary md-2">자몽</span>
							<span class="btn btn-primary md-2">한라봉</span>
							<span class="btn btn-primary md-2">레몬</span>
							<span class="btn btn-primary md-2">블루베리</span>
							<span class="btn btn-primary md-2">생선</span>
							<span class="btn btn-primary md-2">피스타치오</span>
							<span class="btn btn-primary md-2">당근</span>
							<span class="btn btn-primary md-2">토마토</span>
							<span class="btn btn-primary md-2">브로콜리</span>
							<span class="btn btn-primary md-2">요거트</span>
							<span class="btn btn-primary md-2">시금치</span>
						</div>
					</div>
				</div>
		
		
				<div class="col-lg-12 mainTitle">
					<a id="myInfo" class="btn btn-primary btn-lg" href="survey1">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard-pulse" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M10 1.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-1Zm-5 0A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5v1A1.5 1.5 0 0 1 9.5 4h-3A1.5 1.5 0 0 1 5 2.5v-1Zm-2 0h1v1H3a1 1 0 0 0-1 1V14a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V3.5a1 1 0 0 0-1-1h-1v-1h1a2 2 0 0 1 2 2V14a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V3.5a2 2 0 0 1 2-2Zm6.979 3.856a.5.5 0 0 0-.968.04L7.92 10.49l-.94-3.135a.5.5 0 0 0-.895-.133L4.232 10H3.5a.5.5 0 0 0 0 1h1a.5.5 0 0 0 .416-.223l1.41-2.115 1.195 3.982a.5.5 0 0 0 .968-.04L9.58 7.51l.94 3.135A.5.5 0 0 0 11 11h1.5a.5.5 0 0 0 0-1h-1.128L9.979 5.356Z"/>
						</svg>
						건강 진단 다시하기					
					</a>
				</div>	
			</div>
			
			
			<!-- 후기 관리 메뉴 -->
			<div id="myreview">This is the area that shows <b>my review</b> list.</div>
			
			
			<!-- 내 정보 수정 -->
			<div id="editmyinfo">This is the area where I <b>edit my information</b>.</div>
			

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
