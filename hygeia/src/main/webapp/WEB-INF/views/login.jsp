<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hygeia</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/css/index.css" rel="stylesheet"/>
<link href="/css/login.css" rel="stylesheet"/>
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
	<div id="box">
		<form action="">
			<input class = "form-control me-2" type="text" id="id" name="id" placeholder= "아이디">
			<input class = "form-control me-2" type="text" id="password" name="password" placeholder="비밀번호">
			<input id="keep" type="checkbox" name="autoLogin" value="자동로그인"> Remember me <br>
			<input class="btn btn-primary" type="button" id="loginBtn" name="loginBtn" value="로그인">
			<input class="btn btn-outline-primary" id="btnFindId" type="button" name="btnFindId" value="아이디 / 비밀번호 찾기">
			<a href="/join" class="btn btn-outline-primary" type="button" id="joinBtn" name="joinBtn">회원가입</a>
		</form>
	</div>
</body>
</html>