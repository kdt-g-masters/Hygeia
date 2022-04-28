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
<script src="/js/join.js"></script>
<script src="/js/chat.js"></script>

<!-- datePicker -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" crossorigin="anonymous">
<link rel="stylesheet" href="css/datepicker.css">
<link rel="stylesheet" href="css/datepicker_main.css">


<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/css/index.css" rel="stylesheet"/>
<link href="/css/join.css" rel="stylesheet"/>
<link href="/css/chat.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body id="joinBgColor">

  <!-- navbar -->
  <%@ include file="navbar.jsp" %>
	
  <main>
	<div id="joinBox">
	  <div class="row">
	    <div id="leftBox" class="col-lg-6">
		  <div class="container d-flex h-100">
		    <div class="row mx-auto text-center justify-content-center align-self-center" id="msgWelcome">
			  <div class="col-12 py-1">
			  	<img src='/images/logo_white.png' id="joinPageLogo" class="col-6"></img><br>
			    <h2 class="text-white">HYGEIA</h2>
			  </div>
			  <div class="col-12 py-1">
			    <p class="sm_msg text-white">히기에이아<br>그리스 신화에 나오는 건강의 신<br>건강한 삶에 필요한 지혜를 가르쳐준다.</p>
			  </div>
			</div>		
		  </div>
	    </div>
	    <div id="rightBox" class="col-lg-6">
	      <div class="row">
	        <div id="joinElements" class="col-lg-12 p-5 m-5">	        
	          <h3 class="mb-5">회원가입</h3>
	      	  <form action="/join" method="post" class="mx-5">
	      	  	<!-- 아이디 -->
	      	    <div class="row">
	      	      <div class="d-flex">
	      	        <h5 class="inline">아이디</h5>
	      	        <p class="sm_msg mx-2">최대 20자까지 입력 가능합니다.</p>
	      	      </div>
	      	      <div class="col-12 d-flex posRel">
	      	        <input type="text" id="inputMemberId" name="id" class="flex-fill" placeholder="아이디 입력" maxlength="20" size="31" pattern="[a-zA-Z0-9]{0, 20}" required />
		            <!-- 중복확인 결과 아이콘 -->
		            <div id="check">
		              <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16" id="idAvailable">
					    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
					    <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
					  </svg>		            
		            </div>
		            <div id="warning">
					  <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16" id="idNotAvailable">
					    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
					    <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
					  </svg>	      	        	      	      	      	    		            
		            </div>	      	            	      	      	        	            
	      	        <button type="button" id="btnCheckId" class="btn text-white btn-sm btn-primary col-2 mx-2" data-bs-toggle="modal" data-bs-target="#OverlappingCheck1">중복확인</button>
	      	      </div>
	      	      <div class="col-2">
		            	      	      
	      	      </div>
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
	            
	            <!-- 비밀번호 -->
                <div class="row">
                  <div class="d-flex">
                    <h5 class="inline">비밀번호</h5>
                    <p class="sm_msg mx-2">영문/숫자/특수문자를 조합하여 기재하세요.</p>
                  </div>
		          <div class="col-12 d-flex posRel">
		            <input type="password" id="password_1" name="password_1" class="flex-fill" size="21" required />&nbsp;&nbsp;
		            <!-- 비밀번호 확인 -->
		            <input type="password" id="password" name="password" class="flex-fill" size="21" required />
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
	            <div class="row d-flex">
	              <h5 class="inline col-12">이름</h5>
	              <input type="text" id="name" name="name" placeholder="이름 입력">		              	              
	            </div>
	            
		        <!-- 성별, 생년월일 --> 
		        <div class="row">
		          <div class="col-6">
		            <h5 class="col-12">성별</h5>
		            <div class="col-12">
		              <div class="btn-group gender col-12" role="group" aria-label="Basic radio toggle button group">
		                <input type="radio" class="btn-check mainColor" name="gender" id="male" value="0" autocomplete="off" checked>
		                <label id="btnPadding" class="btn btn-outline-primary" for="male">남성</label>
		
		                <input type="radio" class="btn-check mainColor" name="gender" id="female" value="1" autocomplete="off">
		                <label id="btnPadding" class="btn btn-outline-primary" for="female">여성</label>
		              </div>
		            </div>		              
		          </div>
		          
		          <div class="col-6">
			        <h5 class="col-12">생년월일</h5>
			        <div class="col-12">                        
					  <div class="docs-datepicker">
				        <div class="input-group">
				          <input type="text" class="form-control docs-date" name="birthDate" aria-label="birthDate" aria-describedby="btnCal" placeholder="날짜 선택" autocomplete="off" required>
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
	            <div class="row">
	              <div class="d-flex">
	                <h5 class="inline"> 휴대전화</h5>
	                <p class="sm_msg mx-2">휴대전화 번호는 로그인 정보 분실시에 활용됩니다.</p>	               	            
	              </div>
	              <div class="col-12 d-flex">
	              	<!-- 드랍다운 박스 --> 
	                <select name="company" id="company" class="col-3">
	                  <option value="">통신사</option>
	                  <option value="1">SKT</option>
	                  <option value="2">KT</option>
	                  <option value="3">LG U+</option>
	                  <option value="4">알뜰폰</option>
	                </select>
	                <!-- 연락처 텍스트 -->
	                <input type="text" id="phone" name="phone" class="col-6 ml-2" placeholder="숫자만 입력" pattern="^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$" required />
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
	              <div class="col-12 d-flex">
	                <!-- 인증번호 텍스트칸 -->
	                <input type="text" name="certification" class="col-9" placeholder="6자리 인증번호를 입력하세요." size=31 pattern="[0-9]{6}" required />
		            <!-- Button trigger modal -->
		            <button type="button" id="btnConfirm" class="btn text-white btn-sm btn-primary col-3 mx-2" data-bs-toggle="modal" data-bs-target="#Checking">확인</button>	                
	              </div>                	      
      	        </div>
      	         
		        <div class="row d-flex center mt-5">         
		            <!-- 취소 --> 
		            <button type="button" id="btnCancel" class="btn btn-outline-primary mx-1">취소</button> 
		            <!-- 가입하기 -->
		            <button type="submit" id="btnSubmit" class="btn btn-primary mx-1">가입하기</button>		     
		        </div>      	        	      	    
	      	  </form>
	      	            
	        </div>
	      </div>	      
	    </div>
	  </div>
	</div>
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
	    <!--
	    send 부분 아이콘으로 변경하기
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
  		
  <div class="floating-container">
    <div class="floating-button">
	  <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 16 16">
	    <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
	    <!-- chatbot modal? toggle? -->
	  </svg>
    </div>
  </div>

  <!-- footer -->
  <%@ include file="footer.jsp" %>
  
  <!-- Scripts --> 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <script src="https://unpkg.com/bootstrap@4/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <script src="https://fengyuanchen.github.io/shared/google-analytics.js" crossorigin="anonymous"></script>
  <script src="js/datepicker.js"></script>
  <script src="js/datepicker.ko-KR.js"></script>
  <script src="js/main.js"></script> 
</body>
</html>