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
<script src="/jquery-3.6.0.min.js"></script>
<script src="/js/chat.js"></script>
<script>
	$(document).ready(function() {
		//현재 페이지의 url에서 param값 받아오기 $.urlParam('변수') param 변수의 값 받아온다.
		$.urlParam = function(name){
		    var results = new RegExp('[\?&amp;]' + name + '=([^&amp;#]*)').exec(window.location.href);
		    if(results == null){
		    	return null;
		    }
		    else{
			    return results[1] || 0;		    	
		    }
		}
		
		//세션 아이디 값 가져오기
		var memberid = '<%= (String)session.getAttribute("memberInfo") %>';
		
		//후기 추천수
		$.ajax({
			url: '<%=request.getContextPath() %>/rcmcount', 
			data: {'reviewid':$.urlParam('reviewid')}, 
			dataType: 'json', 
			success: function (rcmcount){
				$("#rcm_count").html("<h3>추천수=" + rcmcount + "</h3>");
			}
		});//ajax end
		
		//후기 추천 기능
		$("#rcm").on('click', function () {
			if(memberid == "null"){
				alert("로그인이 필요한 항목입니다.");
				location.replace("/login");
			}
			else{
				$.ajax({
					url: '<%=request.getContextPath() %>/reviewrcm', 
					data: {'review_id':$.urlParam('reviewid'), 'member_id':memberid}, 
					dataType: 'json', 
					error: function () {
						alert("에러");
					}, 
					success: function (rcmcheck) {
						if(rcmcheck == 0){
							alert("추천완료");
							location.reload();
						}
						else if(rcmcheck == 1){
							alert("추천취소");
							location.reload();
						}
					}//success end
				});//ajax end	
			}//if end
		});//on end
	});
</script>
<style>
/* 후기 상세 정보 */
#review-tlb{
    margin: 5vh 25vw 10vh;
    height: 100%;
}

.first{
	font-weight: bold;
	background-color: #FCA937;
	border-radius: 15px;
	padding: 0.9vh 0.3vw;
	margin: 0.7vh 0;
	color: white;
	box-shadow: 2px 2px 5px 1px #d7d7d7;
	text-align: center;
}

.first .title{
	text-align: left;
}

/* 후기 내용 정보 */
#contents {
	border-radius: 15px;
}

/* 후기 상세 버튼들 */
#contents1 {
	width: 48%;
	margin: 0 auto;
	text-align: center;
}
</style>
</head>
<body class="bg-color">
	<!-- navbar -->
	<%@ include file="navbar.jsp" %>
	
	<main>
		<br><br>
		
		<!-- 후기 상세 정보 -->
		<div id="review-tlb">
			<div class="container">
				<div class="row first">
					<div class="col"> ${ reviewresult.name } </div>
					<div class="col-5 title"> ${ reviewresult.title } </div>
					<div class="col-2"> ${ reviewresult.member_id } </div>
					<div class="col-2"> ${ reviewresult.dateWrtn } </div>
					<div class="col"> ${ reviewresult.views } </div>
				</div>
			</div>
			
			<!-- 후기 내용 정보 -->
			<div id="contents" class="border border-2, shadow p-3 mb-5 bg-body">
				<!-- 이미지 파일 -->
				<c:if test="${ !empty reviewresult.filename }">
					<img src="/images/reviewfiles/${ reviewresult.filename }">
				</c:if>
				
				<!-- 내용 -->
				<div>${ reviewresult.content }</div>
				<br>
				<div>${ reviewresult.tag }</div>			
			</div>
		</div>
		
		<div id="contents1">
			<!-- 공감 기능 -->
			<input type="button" value="공감" id="rcm">
			<div id="rcm_count"></div>
			
			<!-- 후기 수정으로 이동 -->
			<button type="button" id="modify_btn" class="btn btn-primary" onclick="location.href='/reviewmodify?reviewid=${ param.reviewid }'">후기 수정</button>
			
			<!-- 후기 목록으로 이동 -->
			<button type="button" class="btn btn-primary" onclick="location.href='/reviewlist'">목록 보기</button>
		</div>
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