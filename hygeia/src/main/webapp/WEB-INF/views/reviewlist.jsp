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
		
		$(".move").on("click", function (e) {
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

		/* 페이지 이동시 스크롤 다운 */
		 $(".scroll_move").click(function(event){     
             event.preventDefault();
             $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
    	 });

	});//ready end
</script>
<style type="text/css">
	.search_wrap{
		margin: 0 auto;
		text-align: center;
	}
	.search_word{
		border: 2px solid #FCA937;
		
	}
	.search_word{
		padding-left: 10px;
	}
	.pageInfo{
		list-style: none;
		display: inline-block;
	}
	.pageInfo li{
		display: inline;
		font-size: 20px;
		margin: 0 5px 0;
		padding: 10px 20px;
		font-weight: 500;
	}
	
	.pageInfo_wrap{ 
		text-align: center;
	}
 	.pageInfo li:hover, li:active{
		color: white;
		background: linear-gradient(to right, #FCA937 30%, #FFD37C);
		border-radius: 1em;
		font-weight: bold;
	} 
	.title a, .title a:link, .title a:visited{ color: #939393; text-decoration: none;}
	.title a:hover{color: #4a4a4a;}
	.write-icon{
		margin: 5vh 25vw 0;
		text-align: right;
	}	
	
	#review #review-tlb{
		margin: 1.5vh 25vw 5vh;
	}
</style>
</head>
<body class="bg-color">
	<!-- navbar -->
	<%@ include file="navbar.jsp" %>
	
	<main>
	
		<section id="section">
			<div class="col-lg-12 mainTitle">
				<span id="title" class="btn btn-primary btn-lg" href="">만병통치 후기</span>
			</div>	
			
		<!-- 검색 -->
		<div class="search_wrap">
			<div class="search_area">
				<input type="text" class="c" name="keyword" placeholder=" 병 명을 입력하세요." "${ pageMaker.cri.keyword }">
				<button>검색</button>
			</div>
		</div>
		<br>
		
		<!-- 후기 작성 페이지 링크 -->
		<div id="review">
		<div id="target"></div>
		<!-- 후기 작성 페이지 링크 -->
		<div class="write-icon">
			<a href="/reviewinput" class="btn btn-primary">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
				  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
				  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
				</svg>
			</a>
		</div>
	
		<!-- 후기 목록 -->
		<div id="review-tlb">
			<div class="container">
				<div class="row first">
						<div class="col">병 명</div>
						<div class="col-5">제 목</div>
						<div class="col-2">작성자</div> 
						<div class="col-2">일 자</div> 
						<div class="col">조회수</div>
				</div>
				<c:forEach items="${ reviewlist }" var="dto">
						<a class="move" href="<c:out value= '${ dto.id }'/>">
							<div class="row review-list" style="cursor: pointer;">
								<div class="col"> ${ dto.name } </div>
								<div class="col-5 title"> ${ dto.title } </div>
								<div class="col-2"> ${ dto.member_id } </div>
								<div class="col-2"> ${ dto.getSubDateWrtn() } </div>
								<div class="col"> ${ dto.views } </div>
							</div>
						</a>
					</c:forEach>
			</div>
		</div>
				
				<!-- 페이징 인터페이스 -->
				<div class="pageInfo_wrap">
					<div class="pageInfo_area">
						<ul id="pageInfo" class="pageInfo">
							
							<!-- 이전 페이지 버튼 -->
							<c:if test="${ pageMaker.prev }">
								<li class="pageInfo_btn previous"><a href="${ pageMaker.startPage-1 }">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
									</svg>
								</a></li>
							</c:if>
							
							<!-- 각 번호 페이지 버튼 -->
							<c:forEach var="num" begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }">
								<li class="pageInfo_btn ${ pageMaker.cri.pageNum == num ? "active":"" }"><a href="${ num }">${ num }</a></li>
							</c:forEach>
							
							<!-- 다음 페이지 버튼 -->
							<c:if test="${pageMaker.next}">
								<li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
									</svg>
								</a></li>
							</c:if>
						</ul>
					</div>
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
