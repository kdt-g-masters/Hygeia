<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.6.0.min.js"></script>
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
<body>
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
<c:forEach items="${ reviewlist }" var="dto">
	<a class="move" href="<c:out value= '${ dto.id }'/>">${ dto.name } ${ dto.title } ${ dto.member_id } ${ dto.dateWrtn } ${ dto.views }</a><br>
</c:forEach>

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
</body>
</html>