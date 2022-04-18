<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4/dist/css/bootstrap.min.css" crossorigin="anonymous">
<link href="/css/index.css" rel="stylesheet"/>
<script src="/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$(".floating-button").on('click', function(){
			show('box');
			$("#close").on('click',function(){
				hide('box');
			});
		});
		$(".ch-bnt").on('click', function(){
				if( $("#request").val() != ""){
					$("#record").append("<div class='question'>" + $("#request").val() + "</div>");	//질문출력
				}
				$.ajax({
					url : "/chatbotajax2",
					data : {"request": $("#request").val(), "event":$(this).val()}, //입력,대화시작 
					type : "get",
					dataType : "json",
					success : function(serverdata){
						parser(serverdata);
					}
				}); // ajax end
				$("#request").val(""); // 질문창 리셋
		}); // .ch-input input:button end
		$('.link').on('click',function(){
				$("#record").append("<div class='question'>" + $(this).val() + "</div>");	//선택한 것출력
				$.ajax({
					url : "/chatbotajax2",
					data : {"request": $(this).val(), "event":"입력"}, //request: 인사/생활습관병/식재료/맞춤/후기
					type : "get",
					dataType : "json",
					success : function(serverdata){
						parser(serverdata);
					}
				});//ajax end
		}); //.link end
	}); //ready onclick
		
	function parser(serverdata){ // 값을 보냈을 때 화면에서 바뀌는 부분
			var bubbles = serverdata.bubbles;
			for(var b in bubbles){
				if(bubbles[b].type == "text"){ //기본답변일때
					var textanswer = "<div class='answer'>"; 
					textanswer += bubbles[b].data.description;
					$("#record").append(textanswer+"</div>");	
				}	
				else if(bubbles[b].type == "template"){
					if(bubbles[b].data.cover.type == "text"){ //멀티링크답변일때
						var textanswer ="<div class='answer'>" + bubbles[b].data.cover.data.description + "</div>";
						$("#record").append(textanswer);
						
						var addlink = "<div class='link-group'>";//"<div class='link-group'>";
						for(var c in bubbles[0].data.contentTable){
							for(var d in bubbles[0].data.contentTable[c]){
								var link = bubbles[0].data.contentTable[c][d].data.title;
								//링크 있을때의 JSON 추출하기(맞춤정보, 후기정보)
								addlink += "<input type='button' class='link' value=" + link + ">";
							}
						}
						$("#record").append(addlink+"</div>");
					}
					
				}
			}
			
		} // success end
	function show(elementId) {
		 var element = document.getElementById(elementId);
		 if(element) {
		  element.style.display = 'block';
		 }
		}
	
	function hide(elementId){
	   var element = document.getElementById(elementId);
	   if(element){
		  element.style.display = 'none';
	   }
	}
</script>
<style>
/* 부트스트랩 custom start*/
.input-group{
	width: 100%;
	margin: 0;
	padding: 0;
}
.input-group .form-control{
	/* padding: 0.6vh 1vw 0.6vh 1vw; */
	border: 0;
	border-radius: 1.5em;
	background-color: #FFEFD8;
}

/* 부트스트랩 custom end*/

img{
	width: 100%;
	
}
#box {
	display: none;
	width : 25%;
	 height : 70vh;
	 margin: 35px 25px;
	 border-radius: 1.5em;
	 box-shadow: 0.2em 0.2em 5em black;
	 background-color: white;
	 position: fixed;
	 bottom: 0;
  	 right: 0;
	 z-index: 1000;
}
.menu-bar{
	height: 3em;
	border-radius: 1.5em 1.5em 0 0;	
	background: linear-gradient(to right, #FCA937, #FFD37C);
}
.close-chat{
	position: absolute;
	top: 0.5em;
	right: 1em;
}
#close{
	color: gray;
	font-weight: bold;
}
#record-box{
	margin: 10px 3px;
	height: 32em;
	overflow: hidden;
	overflow-y: auto;
}
#record-box::-webkit-scrollbar{
	disbplay: block;
	width: 10px;
}
#record-box::-webkit-scrollbar-thumb {
    background: linear-gradient(to bottom, #FCA937, #FFD37C);
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
 }
.ch-input{	
	width: 23%;
	position: fixed;
	bottom: 0;
	margin: 35px 10px;
}
#event1, #event2{
	float: right;
	width: 18.5%;
	padding: 0.6vh 0.6vw 0.6vh 0.6vw;
	border: 0;
	background-color: #FCA937;
	color: white; 
	font-wieght: bold;
}
#event1{
	border-radius: 0;
	margin: 0.1vw;
}
#event2{
	border-radius: 0 1.5em 1.5em 0;
	padding: 0.6vh 0.9vw 0.6vh 0.6vw;
	margin: 0.1vw;
}
.record{
	overflow: hidden;
}
#request{
	margin: 0.1vw;
	width: 60%;
}
.question{
	min-width: auto;
	max-width: 70%;
	margin: 1vh 0.3vw 1vh auto;
	padding: 0.5vh 0.5vw;
	background-color: #FFD37C;
	right: 0;
 	text-align: right; 
	display: block;
	border-radius: 1.3em 1.3em 0.1em 1.3em;
	font-size: 0.9em;
	box-shadow: 0.2em 0.2em 1em #ffd37c;
}
.answer{
	margin: 1vh 5vw 1vh 0.3vw;
	padding: 0.5vh 0.5vw;
	background-color:#FCA937;
	text-align: left; 
	display: block;
	border-radius: 1.3em 1.3em 1.3em 0.1em;
	font-size: 0.9em;
	color: white;
	box-shadow: 0.2em 0.2em 1em #d7d7d7;
	
}
.link-group{
	margin:0.1vh 0.1vw 1vh 0.1vw;
	padding: 0.1vh 0.1vw 1vh 0.1vw;
	overflow: hidden;
	overflow-x: auto;
}
.link{
	float: left;
	margin: 0.1vh 0.1vw 0.5vh 0.1vw;
	padding: 0.5vh 0.5vw;
	display: inline;
	border-radius: 1.5em;
	border: 0.1em solid #FFD37C;
	background-color: transparent;
	color : dark;
	font-size : 0.8em;
}
.link:hover{
	background-color: #FCA937;
	border-color: #FCA937;
	color : white;
}
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div id="box1">
	<!-- <img src="images/indeximage.jpg"> -->
</div>

<div id="box">
	<div class="menu-bar">
		<span class="close-chat"><a id="close" href="..">
			<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 19 19">
	  			<path fill-rule="evenodd" d="M13.854 2.146a.5.5 0 0 1 0 .708l-11 11a.5.5 0 0 1-.708-.708l11-11a.5.5 0 0 1 .708 0Z"/>
	  			<path fill-rule="evenodd" d="M2.146 2.146a.5.5 0 0 0 0 .708l11 11a.5.5 0 0 0 .708-.708l-11-11a.5.5 0 0 0-.708 0Z"/>
			</svg>
		</a></span>
	</div>
	<div class="ch-input">
		<hr>
		<div class="input-group mb-3">
		    <input type="text" id="request" class="form-control" placeholder="질문을 입력하세요." aria-label="Recipient's username" aria-describedby="basic-addon2">
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

<%@ include file="footer.jsp" %>
		
	<div class="floating-container">
	  <div class="floating-button">
		<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 16 16">
		  <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
		  <!-- chatbot modal? toggle? -->
		</svg>
		<div id="ch-window" style="display:none"></div>
	  </div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>
