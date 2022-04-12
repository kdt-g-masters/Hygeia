<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<script src="/jquery-3.6.0.min.js"></script>

<!-- datePicker -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" crossorigin="anonymous">
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4/dist/css/bootstrap.min.css" crossorigin="anonymous">
<link rel="stylesheet" href="css/datepicker.css">
<link rel="stylesheet" href="css/datepicker_main.css">

<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- CSS --> 
<link href="/css/join.css" rel="stylesheet" />
<link href="/css/index.css" rel="stylesheet"/>
<script>
$(document).ready(function() {
	var joinAvailable = false;
	$("#btnCheckId").on('click', function() {
		$.ajax({
			url: '/join/checkid',
			data: {'id': $("#inputMemberId").val()},
			type: 'post',
			dataType: 'json',
			success: function(r) {
				$("#resultModal").html(r.result);
				if (r.state == "available") {
					$("#idAvailable").css("display", "inline");
					$("#idNotAvailable").css("display", "none");
					joinAvailable = true;
				}
				else {
					$("#idAvailable").css("display", "none");
					$("#idNotAvailable").css("display", "inline");
					joinAvailable = false;
				}				
			} // success end
		}); // ajax end
	}); // on end
	
	$("#password_1").focusout(function() {
		if ($("#password_1").val() == $("#password").val()) {
			$("#pwAvailable").css("display", "inline");
			$("#pwNotAvailable").css("display", "none");
			$("#pwCheck").html("");
			joinAvailable = true;
		}
		else {
			$("#pwAvailable").css("display", "none");
			$("#pwNotAvailable").css("display", "inline");
			$("#pwCheck").html("비밀번호가 일치하지 않습니다.");
			joinAvailable = false;
		}
	});
	$("#password").focusout(function() {
		if ($("#password_1").val() == $("#password").val()) {
			$("#pwAvailable").css("display", "inline");
			$("#pwNotAvailable").css("display", "none");
			$("#pwCheck").html("");
			joinAvailable = true;
		}
		else {
			$("#pwAvailable").css("display", "none");
			$("#pwNotAvailable").css("display", "inline");
			$("#pwCheck").html("비밀번호가 일치하지 않습니다.");
			joinAvailable = false;
		}
	});
	$("form").on('submit', pass);
	function pass(e) {
		if (joinAvailable == false) {
			alert("아이디 또는 비밀번호 조건을 확인해주세요.");
			e.preventDefault();
		}
		if($("#password").val().length < 5 || $("#password").val().length > 10){
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
}); // ready end
</script>
</head>
<body>
  <div class="box">
  <div class="wrapper text-center">
    <!-- 제목  --> 
    <section>
      <h3>Sign In</h3>
    </section>
    
    <section>
      <form action="/join" method="post"><br>
        <!-- 아이디  -->
        <div class="row">
          <h5 class="col-md-4 inline"> 아 이 디</h5>
          <p class="sm_msg">최대 20자까지 입력 가능합니다.</p>
          <div class="col-md-12">
            <input type="text" id="inputMemberId" name="id" placeholder="아이디 입력" maxlength="20" size="31" pattern="[a-zA-Z0-9]{0, 20}" required /> &nbsp;
            <!-- 중복확인(모달)  -->
            <!-- Button trigger modal -->
            <button type="button" id="btnCheckId" class="btn text-white btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#OverlappingCheck1">
              중복확인
            </button>
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16" id="idAvailable">
			  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
			  <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
			</svg>
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16" id="idNotAvailable">
			  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
			  <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
			</svg>
            <!-- Modal -->
            <div class="modal fade" id="OverlappingCheck1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">ID 중복확인</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body" id="resultModal"></div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫 &nbsp;기</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div><br>
        <!-- 비밀번호 -->
        <div class="row">
          <h5 class="col-md-9 inline">비밀번호/확인</h5>
          <p class="sm_msg">영문/숫자/특수문자를 조합하여 기재하세요.</p> 
          <div class="col-md-12">
            <input type="password" id="password_1" name="password_1" size="21" required />&nbsp;&nbsp;
             <!-- 비밀번호 확인 -->
             <input type="password" id="password" name="password" size="21" required />
             <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16" id="pwAvailable">
			  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
			  <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
			</svg>
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16" id="pwNotAvailable">
			  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
			  <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
			</svg>
			<div id="pwCheck"></div>
          </div>
        </div><br>
        <!-- 이름 --> 
        <div class="row">
          <h5 class="col-md-9 inline"> 이 &nbsp;&nbsp;&nbsp;름</h5>
          <div class="col-md-9">
            <input type="text" id="name" name="name" value="" size="45">
          </div>
        </div><br>
        <!-- 생년월일 -->   
        <div class="row">
          <h5 class="col-md-9 inline"> 생년월일</h5>
          <div class="col-md-9">                        
		        <div class="docs-datepicker">
		          <div class="input-group">
		            <input type="text" class="form-control docs-date" name="birthDate" placeholder="Pick a date" autocomplete="off">
		            <div class="input-group-append">
		              <button type="button" class="btn btn-outline-secondary docs-datepicker-trigger" disabled>
		                <i class="fa fa-calendar" aria-hidden="true"></i>
		              </button>
		            </div>
		          </div>
		          <div class="docs-datepicker-container"></div>
		        </div>
		      </div>      
          </div>
        </div><br>
        <!-- 성별 --> 
        <div class="row">
          <h5 class="col-md-9 inline"> 성 &nbsp;&nbsp;&nbsp;별</h5>

          <div class="col-md-9">&nbsp;
            <div class="btn-group gender " role="group" aria-label="Basic radio toggle button group">
              <input type="radio" class="btn-check mainColor" name="gender" id="male" value="0" autocomplete="off" checked>
              <label class="btn btn-outline-primary" for="male">남 &nbsp;&nbsp;성</label>

              <input type="radio" class="btn-check mainColor" name="gender" id="female" value="1" autocomplete="off">
              <label class="btn btn-outline-primary" for="female">여 &nbsp;&nbsp;성</label>
            </div>
          </div>
        </div><br>
        <!-- 휴대전화 -->
        <div class="row">
          <h5 class="col-md-3 inline"> 휴대전화</h5>
          <p class="sm_msg">휴대전화 번호는 로그인 정보 분실시에 활용됩니다.</p>
          <!-- 드랍다운 박스 --> 
          <div class="col-md-9"> 
            <select name="company" id="company">
              <option value=""> 통신사 </option>
              <option value="1">SKT</option>
              <option value="2">KT</option>
              <option value="3">LG U+</option>
              <option value="4">알뜰폰</option>
            </select>
            <!-- 연락처 텍스트칸 -->
            <input type="text" id="phone" name="phone" placeholder="숫자만 입력" pattern="^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$" required /> &nbsp;
            <!-- 인증번호(모달) -->   
            <!-- Button trigger modal -->
            <button type="button" class="btn text-white btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#CertificationNumber">
		          인증번호
            </button>
            <!-- Modal -->
            <div class="modal fade" id="CertificationNumber" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">인증번호 발송</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    인증번호 확인
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫 &nbsp;&nbsp;&nbsp;기</button>
                  </div>
                </div>
              </div>
            </div>
            <!-- 인증번호 텍스트칸 -->
            <p class="sm_msg"></p><br>
            <input type="text" name="certification" placeholder="6자리 인증번호를 입력하세요" size=31 pattern="[0-9]{6}" required /> &nbsp;
            <!-- 확인(모달) -->
            <!-- Button trigger modal -->
            <button type="button" class="btn text-white btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#Checking">
              확 &nbsp;&nbsp;&nbsp;인
            </button> 		
            <!-- Modal -->
            <div class="modal fade" id="Checking" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">인증번호 검사</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    인증번호 확인
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
                  </div>
                </div>
              </div>	
            </div> 
          </div>
        </div><br><br>
        <!-- 가입하기 --> 
        <div class="row flex center"> 
          <div class="col-md-12">
            <button type="submit" id="btnSubmit" class="btn text-white btn-sm btn-primary" style="width:120px;">가입하기</button>&nbsp;&nbsp;&nbsp;
            <!-- 취소 --> 
            <button type="button" id="btnCancel" class="btn text-white btn-sm btn-primary" style="width:120px;">취 &nbsp;&nbsp;&nbsp;소</button>
            <br><br> 
          </div>
        </div>
      </form>
    </section>
  </div>
  </div>
  
 <!-- Scripts --> 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <!-- <script src="https://unpkg.com/jquery@3/dist/jquery.slim.min.js" crossorigin="anonymous"></script> -->
  <script src="https://unpkg.com/bootstrap@4/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <script src="https://fengyuanchen.github.io/shared/google-analytics.js" crossorigin="anonymous"></script>
  <script src="js/datepicker.js"></script>
  <script src="js/datepicker.ko-KR.js"></script>
  <script src="js/main.js"></script>
</body>
</html>