<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
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
			data: {''}, 
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
		
	});//ready end
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<!-- 후기 상세 구현 -->
<div>${ reviewresult.name } ${ reviewresult.title } ${ reviewresult.member_id } ${ reviewresult.dateWrtn } ${ reviewresult.views }</div>
<div>${ reviewresult.content }<br>${ reviewresult.tag }</div>
<!-- 추천과 비추천 -->
<input type="button" value="rcm" id="rcm">
<input type="button" value="nonrcm">
<!-- 후기 수정으로 이동 -->
<button type="button" id="modify_btn" onclick="location.href='/reviewmodify?reviewid=${ param.reviewid }'">후기 수정</button>
<!-- 후기 목록으로 이동 -->
<button type="button" onclick="location.href='/reviewlist'">목록 보기</button>
</body>
</html>