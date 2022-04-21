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
<script type="text/javascript">
	$(document).ready(function () {
		//뒤로가기로 목록 페이지에 왔을 때
		window.onpageshow = function(event) {
		    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
		    	location.reload();
		    }
		}
		
		//alert창 띄우기
		let result = '<c:out value="${result}"/>';
		
		checkAlert(result);
		
		function checkAlert(result) {
			if(result === "input success"){
				alert("등록이 완료되었습니다.");
			}
			else if(result === "modify success"){
				alert("수정이 완료되었습니다.");
			}
			else{
				return;
			}
		}
		
		//목록 상세 페이지 이동
		let moveForm = $("#moveForm");
		
		$(".review-list").on("click", function (e) {
			//클릭한 a태그 기능 정지
			e.preventDefault();
			
			//form태그 내부에 reviewid 값을 저장하는 input태그 생성
			moveForm.append("<input type='hidden' name='reviewid' value='" + $(this).attr("href") + "'>");
			//form태그 action속성 추가
			moveForm.attr("action", "reviewresult");
			//form태그 내부 데이터 서버 전송
			moveForm.submit();
		});//on click end
		
		$(".pageInfo a").on("click", function (e) {
			//클릭한 a태그 기능 정지
			e.preventDefault();
			
			//form태그 내부 pageNum과 관련된 input태그 value속성 값에 클릭한 a태그의 페이지 번호 삽입
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			//form태그 action속성 추가
			moveForm.attr("action", "reviewlist");
			//form태그 내부 데이터 서버 전송
			moveForm.submit();
		});//on click end
		
		$(".search_area button").on("click", function (e) {
			e.preventDefault();
			//사용자가 작성한 keyword값 변수 value에 저장
			let val = $("input[name='keyword']").val();
			//form태그 내부에 name속성이 keyword인 input태그에 val값 저장
			moveForm.find("input[name='keyword']").val(val);
			//pageNum 1로 변경
			moveForm.find("input[name='pageNum']").val(1);
			//form태그 내부 데이터 서버 전송
			moveForm.submit();
		});//on click end		
		
	});//ready end
</script>
<style type="text/css">
	.pageInfo{
		list-style: none;
		display: inline-block;
		margin: 50px 0 0 100px;
	}
	
	.pageInfo li{
		float: left;
		font-size: 20px;
		margin-left: 18px;
		padding: 7px;
		font-weight: 500;
	}
	
	a:link {color: black; text-decoration: none;}
	a:visited {color: black; text-decoration: none;}
	a:hover {color: black; text-decoration: underline;}
	
	.active{background-color: gray;}
</style>
</head>
<body class="bg-color">
	<!-- navbar -->
	<%@ include file="navbar.jsp" %>
	
	<main>
	
		<section id="section">
			<div class="col-lg-12 mainTitle">
				<a id="title" class="btn btn-primary btn-lg" href="">MY PAGE</a>
			</div>	
			
<h1>만병통치 후기</h1>
<!-- 검색 -->
<div class="search_wrap">
	<div class="search_area">
		<input type="text" name="keyword" value="${ pageMaker.cri.keyword }">
		<button>검색</button>
	</div>
</div>

<!-- 후기 작성 페이지 링크 -->
<a href="/reviewinput">리뷰쓰기</a>

<!-- 후기 목록 -->
<div>병명 제목   작성자   일자   조회수</div>

	

<!-- 후기 목록 -->
			<div id="review">
				<div id="review-tlb">
					<div class="container">
						<div class="row first">
								<div class="col-2">병 명</div>
								<div class="col-5">제 목</div>
								<div class="col-2">작성자</div> 
								<div class="col-2">일 자</div> 
								<div class="col">조회수</div>
						</div>
						<c:forEach items="${ reviewlist }" var="dto">
					
							<c:out value= '${ dto.id }'/>
							<div class="row review-list" style="cursor: pointer;" onclick="location.href='/';">
									<div class="col"> ${ dto.name } </div>
									<div class="col-5 title"> ${ dto.title } </div>
									<div class="col-2"> ${ dto.member_id } </div> 
									<div class="col-2"> ${ dto.dateWrtn } </div> 
									<div class="col"> ${ dto.views } </div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>


<!-- 페이징 인터페이스 -->
<div class="pageInfo_wrap">
	<div class="pageInfo_area">
		<ul id="pageInfo" class="pageInfo">
			
			<!-- 이전 페이지 버튼 -->
			<c:if test="${ pageMaker.prev }">
				<li class="pageInfo_btn previous"><a href="${ pageMaker.startPage-1 }">Previous</a></li>
			</c:if>
			
			<!-- 각 번호 페이지 버튼 -->
			<c:forEach var="num" begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }">
				<li class="pageInfo_btn ${ pageMaker.cri.pageNum == num ? "active":"" }"><a href="${ num }">${ num }</a></li>
			</c:forEach>
			
			<!-- 다음 페이지 버튼 -->
			<c:if test="${pageMaker.next}">
				<li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
			</c:if>
		</ul>
	</div>
</div>

<!-- pageNum과 amount정보를 전송 -->
<form id="moveForm">
	<input type="hidden" name="pageNum" value="${ pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${ pageMaker.cri.amount }">
	<input type="hidden" name="keyword" value="${ pageMaker.cri.keyword }">
</form>
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
