<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4/dist/css/bootstrap.min.css" crossorigin="anonymous">

<link href="/css/index.css" rel="stylesheet"/>
<link href="/css/chat.css" rel="stylesheet"/>
<link href="/css/my.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script src="/jquery-3.6.0.min.js"></script>
<script src="/js/chat.js"></script>

<!-- datePicker -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" crossorigin="anonymous">
<link rel="stylesheet" href="css/datepicker.css">
<link rel="stylesheet" href="css/datepicker_main.css">

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

	$("#tab1").on('click', function(){
	   	$("#mysurveyresult").css("display", "block");
	   	$("#myreview").css("display", "none");
	   	$("#pwCheck").css("display", "none");
	   	$("#editmyinfo").css("display","none");
	});
	      
	$("#tab2").on('click', function(){
	   	$("#mysurveyresult").css("display", "none");
	   	$("#myreview").css("display", "block");         
	   	$("#pwCheck").css("display", "none");
	   	$("#editmyinfo").css("display","none");
	});

	$("#tab3").on('click', function(){
	   	$("#mysurveyresult").css("display", "none");
	   	$("#myreview").css("display", "none");      
	   	$("#pwCheck").css("display", "block");
	   	$("#editmyinfo").css("display","none");
	}); 

	
	$("#loginBtn").on('click',function(){
		if( $("#password").val() == ${memberInfo.password}){
			alert($("#id").val() + "님의 정보수정 페이지로 이동합니다.");
			$("#pwCheck").css("display", "none");
			$("#editmyinfo").css("display","block");
		}
		else{
			$('#msgLoginFail').html("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
			$('#msgLoginFail').css("visibility", "visible");
		}
	});
	
	
	$("#password_1").focusout(function() {
		if ($("#password_1").val() == $("#password_2").val()) {
			$("#pwAvailable").css("display", "inline");
			$("#pwNotAvailable").css("display", "none");
			joinAvailable = true;
		}
		else {
			$("#pwAvailable").css("display", "none");
			$("#pwNotAvailable").css("display", "inline");
			joinAvailable = false;
		}
	});
	$("#password_2").focusout(function() {
		if ($("#password_1").val() == $("#password_2").val()) {
			$("#pwAvailable").css("display", "inline");
			$("#pwNotAvailable").css("display", "none");
			joinAvailable = true;
		}
		else {
			$("#pwAvailable").css("display", "none");
			$("#pwNotAvailable").css("display", "inline");
			joinAvailable = false;
		}
	});
	$("form").on('submit', pass);
	function pass(e) {
		if (joinAvailable == false) {
			alert("아이디 또는 비밀번호 조건을 확인해주세요.");
			e.preventDefault();
		}
		if($("#password_2").val().length < 5 || $("#password_2").val().length > 10){
			alert("패스워드 형식을 다시 확인해주세요.");
			e.preventDefault();
		}
		if(!$("#name").val().match(/[A-Z가-힣]+/)) {
			alert("이름 형식을 다시 확인해주세요.");
			e.preventDefault();
		}

		if(!$("#phone").val().match(/^010[0-9]{3,4}[0-9]{4}$/)) {
			alert("전화번호 형식을 확인해주세요.");
			e.preventDefault();
		}				
	}
	
	$("#btnSubmit").on('click', function() {
		var formData = new FormData($("#modifyForm")[0]);
		$.ajax({
			url: '/editinfo',
			data: {
				'id': $("#inputMemberId").val(),
				'password': $("#password_2").val(),
				'name': $("#name").val(),
				'gender': $('input[name="gender"]:checked').val(),
				'birthDate': $("#birthDate").val(),
				'phone': $("#phone").val()
			},
			type: 'post',
			dataType: 'json',
			success: function(r) {
				if (r == "1") {
					alert("회원정보 수정이 완료되었습니다.");
				}
				else {
					alert("실패");
				}				
			} // success end
		}); // ajax end		
	}); // on end
}); // ready end
</script>
<style>
#editmyinfo .box{
	width: 35vw;
	height: 80vh;
	margin: 15vh auto;
	padding: 5em;
	border-radius: 2em;
	background-color: white;
	box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.1);
}
.row {
	justify-content: space-around;
}
main h3 {
	font-size: 1.7em;
	font-weight: bold;
}

main h5{
	font-size: 1.3em;
	font-weight: bold;
}

main h2 {
	font-weight: bold;
}

main h1, h2, h3, h4, h5 {
	color: #4A4A4A;
}

.sm_msg{
	color: #7f7c82;
	font-size: 0.8em;
	margin-bottom: 7px;
}

.inline{
	display: inline-block;
}

input[type=text], input[type=password], input[type=radio] {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	font-size: 1.1em;
	height: 2.5em;
	border-radius: 2em;
	border: 0.01em solid #EFEFEF !important;
	background-color: #EFEFEF !important;
	margin-top: 0.1em;
	margin-bottom: 1em;
	padding: 0 1em;
}

input[type=text]:hover, input[type=password]:hover, input[type=radio]:hover, input[type=text]:focus, input[type=password]:focus {
	border:0.01em solid #FCA937;
}

.row {
	justify-content: space-around;
}

button:hover {
	color: #FCA937;
	background-color: transparent;
}

#btnCheckId, #btnCerti, #btnConfirm, #btnSubmit {
	font-size: 1.1em;
	height: 2.5em;	
}

#idAvailable, #pwAvailable {
	display: none;
	color: green;
}

#idNotAvailable, #pwNotAvailable {
	display: none;
	color: red;
}

select {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	color:#7f7c82;
	font-size: 1.1em;
	height: 2.5em;
	border-radius: 30px;
	border: 0.01em solid #7f7c82;
	text-align: center;
}

select:hover{
	border:0.01em solid #FCA937;
}

.gender label {
	font-size: 1.1em;
	margin-top: 0.3em;
}

#btnCal {
	padding: 1em;
}

#btnSubmit {
	background: linear-gradient(to left, #FCA937, #FFD37C);
	border: 0;
	font-size: 1.1em;
}

#btnCancel {
	font-size: 1.1em;
}

#company{
	margin-right: 0.5em;
	font-size: 1.1em;
}

#name {
	padding: 0 1vw;
	margin-right: 4vw;
	margin-left: 4vw;
}

.posRel {
	position: relative;
}

.posRel #check, #warning {
	position: absolute;    
    top: 0.8vh;
    right: 8vw;
}

.posRel #pwCheck, #pwWarning {
	position: absolute;    
    top: 0.8vh;
    right: 1.3vw;
}

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
			
			<nav>
				<div id="marker"></div>
				<a href="#" id="tab1">내 건강 결과</a>
				<a href="#" id="tab2">후기 관리</a>
				<a href="#" id="tab3">내 정보 수정</a>
			</nav>
			
			<!-- 내 건강 결과 메뉴  -->
			<div id="mysurveyresult">
				<div class="box"> 
					<!-- DB(Storage)테이블에서 세션아이디의 건강 진단 결과 select 후 mypage view에 전달 -->
					<h4><b>${ sessionid }님 건강 진단 결과</b></h4>
					<hr>
					<h4>생활습관병 중 <br> 
						<span class="underline">(병명)<%--  ${diseaseName} --%></span> 발생 가능성이 있습니다.<br> 
						가장 효과적이고 간편하게 식재료를 활용한 식습관을 개선해보세요.
					</h4>
					
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
			<div id="myreview" style="display:none">
				<div id="review-tlb">
					<div class="container">
						<div class="row first">
								<div class="col-2">병 명</div>
								<div class="col-5">제 목</div>
								<div class="col-2">작성자</div> 
								<div class="col-2">일 자</div> 
								<div class="col">조회수</div>
						</div>
						
						<c:forEach items="${reviewlist}" var="dto">
							<a href="/reviewresult?reviewid=${ dto.id }">
								<div class="row review-list" style="cursor: pointer;">
										<div class="col"> ${dto.name} </div>
										<div class="col-5 title"> ${dto.title}</div>
										<div class="col-2"> ${dto.member_id} </div> 
										<div class="col-2"> ${dto.getSubDateWrtn()} </div> 
										<div class="col"> ${dto.views} </div>
								</div>
							</a>
						</c:forEach>
					</div>
				</div>
			</div>
				
			
			<!-- 내 정보 수정 -->
			<div id="pwCheck" style="display:none">
				<div class="box">
					<div class="row">				  
						<div id="confirm-info" class="col-lg-12">						
							<div class="row"><input class="form-control me-2 col" type="text" id="id" name="id" value=" ${sessionid}" disabled/></div>
							<div class="row"><input class="form-control me-2 col" type="password" id="password" name="password" placeholder=" 비밀번호"></div>						
							<div id="msgLoginFail"></div>
							
							<input class="btn btn-primary col-12 mt-4 mb-2" type="button" id="loginBtn" name="loginBtn" value="내 정보 수정 하기">
						</div>
					</div>
				</div>
			</div>
			
			<div id="editmyinfo" style="display:none">
			  <div class="box">
				<div class="row">
				  <form action="" id="modifyForm">
		      	    <!-- 아이디 -->
		      	    <div class="row mb-2">
		      	  	  <div class="d-flex">
		      	  		<h5 class="inline">아이디</h5>		      	    
		      	  	  </div>
		      	  	  <div class="col-12 d-flex posRel">
		      	  		<input type="text" id="inputMemberId" name="id" class="flex-fill" value="${memberInfo.id}" readonly />
		              </div>
		            </div>
		            
		            <!-- 비밀번호 -->
	                <div class="row mb-2">
	                  <div class="d-flex">
	                    <h5 class="inline">비밀번호</h5>
	                    <p class="sm_msg mx-2">영문/숫자/특수문자를 조합하여 기재하세요.</p>
	                  </div>
			          <div class="col-12 d-flex posRel">
			            <input type="password" id="password_1" name="password_1" class="flex-fill" value="${memberInfo.password}" size="21" required />&nbsp;&nbsp;
			            <!-- 비밀번호 확인 -->
			            <input type="password" id="password_2" name="password" class="flex-fill" value="${memberInfo.password}" size="21" required />
	                    <div id="pwCheck">
		                  <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16" id="pwAvailable">
					        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
					        <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
					      </svg>                   
	                    </div>
	                    <div id="pwWarning">
					      <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16" id="pwNotAvailable">
					        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
					        <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
					      </svg>                                                       
	                    </div>		             
			          </div>	                
	                </div>
	                
		            <!-- 이름 --> 
		            <div class="row mb-2 px-2">
		              <h5 class="col-12">이름</h5>
		              <input type="text" id="name" name="name" placeholder="이름 입력" value="${memberInfo.name}">		         
		            </div>
		            
			        <!-- 성별, 생년월일 --> 
			        <div class="row mb-2">
			          <div class="col-6 px-0">
			            <h5 class="col-12">성별</h5>
			            <div class="col-12 px-0">
			              <div class="btn-group gender col-12" role="group" aria-label="Basic radio toggle button group">
							<input type="radio" class="btn-check mainColor" name="gender" id="male" value="0" autocomplete="off" <c:if test="${memberInfo.gender eq 0}">checked</c:if> />
				            <label id="labelMale" class="btn btn-outline-primary" for="male">남성</label>
				                
				            <input type="radio" class="btn-check mainColor" name="gender" id="female" value="1" autocomplete="off" <c:if test="${memberInfo.gender eq 1}">checked</c:if> />
				            <label id="labelFemale" class="btn btn-outline-primary" for="female">여성</label>
			              </div>
			            </div>		              
			          </div>
			          
			          <div class="col-6">
				        <h5 class="col-12">생년월일</h5>
				        <div class="col-12">                        
						  <div class="docs-datepicker">
					        <div class="input-group">
					          <input type="text" class="form-control docs-date" id="birthDate" name="birthDate" aria-label="birthDate" aria-describedby="btnCal" value="${memberInfo.birthDate}" autocomplete="off" placeholder="날짜 선택">
					          <div class="input-group-append" >
					            <button id="btnCal" name="birthDate" type="button" class="btn btn-outline-secondary docs-datepicker-trigger" disabled>
					              <i class="fa fa-calendar" aria-hidden="true"></i>
					            </button>
					          </div>
					        </div>
					        <div class="docs-datepicker-container"></div>
					      </div>
					    </div> 		            
			          </div>		           
			        </div>
			        
		            <!-- 휴대전화 -->
		            <div class="row my-3">
		              <div class="d-flex">
		                <h5 class="inline">휴대전화</h5>
		                <p class="sm_msg mx-2">휴대전화 번호는 로그인 정보 분실시에 활용됩니다.</p>	               	            
		              </div>
		              <div class="col-12 d-flex">
		                <!-- 연락처 텍스트 -->
		                <input type="text" id="phone" name="phone" class="col ml-2" placeholder="숫자만 입력" value="${memberInfo.phone}" pattern="^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$" required />
		                
		                <!-- 인증번호(모달) -->   
		                <!-- Button trigger modal -->
		                <button type="button" id="btnCerti" class="btn text-white btn-sm btn-primary col-3 mx-2" data-bs-toggle="modal" data-bs-target="#CertificationNumber">인증번호</button>		          
			            <!-- Modal -->
			            <div class="modal fade" id="CertificationNumber" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			              <div class="modal-dialog">
			                <div class="modal-content">
			                  <div class="modal-header">
			                    <h5 class="modal-title" id="staticBackdropLabel">인증번호 발송</h5>
			                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			                  </div>
			                </div>
			              </div>
			            </div>	                
		              </div>      	      
	      	        </div>
	      	         
			        <div class="row d-flex center mt-5">
			            <!-- 수정하기 -->
			            <button type="button" id="btnSubmit" class="btn btn-primary mx-1">수정하기</button>		     
			        </div>      	        	      	    
		      	  </form>
		      	</div>
	      	  </div>
			</div>
		</section>
	</main>
	
	<!-- chatbot -->
	<div id="ch-window" style="display:none">
		<div class="menu-bar">
			<div class="chat-close">
				<span id="close">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 19 19">
		  				<path fill-rule="evenodd" d="M13.854 2.146a.5.5 0 0 1 0 .708l-11 11a.5.5 0 0 1-.708-.708l11-11a.5.5 0 0 1 .708 0Z"/>
		  				<path fill-rule="evenodd" d="M2.146 2.146a.5.5 0 0 0 0 .708l11 11a.5.5 0 0 0 .708-.708l-11-11a.5.5 0 0 0-.708 0Z"/>
					</svg>
				</span>
			</div>
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
    <script src="https://unpkg.com/bootstrap@4/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://fengyuanchen.github.io/shared/google-analytics.js" crossorigin="anonymous"></script>
    <script src="js/datepicker.js"></script>
    <script src="js/datepicker.ko-KR.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
