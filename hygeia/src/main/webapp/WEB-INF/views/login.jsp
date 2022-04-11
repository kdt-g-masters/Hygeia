<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#loginBtn").on('click', function(){
			$.ajax({
				url: '/login',
				data: {'id': $("#id").val(), 'password': $("#password").val()},
				type: 'post',
				dataType: 'json',
				success: function(result) {
					if (result == '1') {
						alert("로그인 성공");
						location.replace('/');
					}
					else {
						alert("로그인 실패");
					}
				} // function end
			});	// ajax end		
		}); // on end
	});
</script>
</head>
<body>
	<form action="">
		<input type="text" id="id" name="id" placeholder= "아이디">
		<input type="text" id="password" name="password" placeholder="비밀번호">
		<input type="button" id="loginBtn" name="loginBtn" value="로그인">
		<input type="button" id="joinBtn" name="joinBtn" value="회원가입">
	</form>
</body>
</html>