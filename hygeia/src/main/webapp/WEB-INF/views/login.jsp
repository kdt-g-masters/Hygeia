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
						alert($("#id").val() + "님 환영합니다.");
						location.replace('/');
					}
					else {
						$('#msgLoginFail').html("아이디 또는 비밀번호가 일치하지 않습니다.");
						$('#msgLoginFail').css("visibility", "visible");
					}
				} // function end
			});	// ajax end		
		}); // on end
	});
</script>
</head>
<body id="loginBgColor">
	<!-- navbar -->
	<%@ include file="navbar.jsp" %>
	
	<main>
		<div id="box">
			<div class="row">
				<div id="leftBox" class="col-lg-6">
					<div class="row">
						<div id="loginElements" class="col-lg-12">
							<h3 class="mb-4">로그인</h3>
							<input class="form-control me-2" type="text" id="id" name="id" placeholder= " 아이디">
							<input class="form-control me-2" type="password" id="password" name="password" placeholder=" 비밀번호">						
							<div id="msgLoginFail">로그인 실패</div>
							
							<input class="btn btn-primary col-12 mt-4 mb-2" type="button" id="loginBtn" name="loginBtn" value="로그인">
							<div class="d-flex justify-content-between">
								<div><input id="autoLogin" type="checkbox" name="autoLogin" value="자동로그인"><label for="autoLogin"> 아이디 저장</label></div>							
								<a href="#" id="findIdPw" class="float-left" name="findIdPw"> 아이디 / 비밀번호 찾기 </a>						
							</div>
	
						</div>
					</div>
				</div>
				<div id="rightBox" class="col-lg-6">
					<div class="container d-flex h-100 w-100">
						<div class="row text-center justify-content-center align-self-center" id="msgWelcome">
							<div class="col-12 py-1">
								<h2>Welcome to login</h2>
							</div>
							<div class="col-12 py-1">
								회원이 아니신가요?
							</div>
							<div class="col-12 py-1">
								<a href="/join" class="btn btn-primary" type="button" id="joinBtn" name="joinBtn">회원가입</a>
							</div>
						</div>		
					</div>			
				</div>		
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
</body>
</html>