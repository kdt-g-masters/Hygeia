<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hygeia</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/css/index.css" rel="stylesheet"/>
<link href="/css/chat.css" rel="stylesheet"/>
<link href="/css/login.css" rel="stylesheet"/>
<script src="/jquery-3.6.0.min.js"></script>
<script src="/js/chat.js"></script>
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
		
		//후기 작성 비로그인 시 경고창
		let result = '<c:out value="${result}"/>';
		
		checkAlert(result);
		
		function checkAlert(result) {
			if(result === "warning"){
				alert("로그인 이후에 사용 가능합니다.");
			}
			else{
				return;
			}
		}
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
								<a href="#" id="findIdPw" name="findIdPw"> 아이디 / 비밀번호 찾기 </a>						
							</div>
	
						</div>
					</div>
				</div>
				<div id="rightBox" class="col-lg-6">
					<div class="container d-flex h-100">
						<div class="row mx-auto text-center justify-content-center align-self-center" id="msgWelcome">
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