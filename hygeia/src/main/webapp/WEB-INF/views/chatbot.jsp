<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("input:button").on('click', function(){
			if( $("#request").val() != ""){
				$("#record").append("<div class='question'>" + $("#request").val() + "</div>");	//질문출력
			}
			$.ajax({
				url : "/chatbotajax2",
				data : {"request": $("#request").val(), "event":$(this).val()}, //입력,대화시작 
				type : "get",
				dataType : "json",
				success : function(serverdata){ // 값을 보냈을 때 화면에서 바뀌는 부분
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
										addlink += "<span class='link'>"+link+"</span>";
									}
								}
								$("#record").append(addlink+"</div><br>");
							}
							
						}
					}
					
				} // success end
			}); // ajax end
			$("#request").val(""); // 질문창 리셋
		}); // input:button onclick
	});
</script>

<style>
#box {
	 border : 1px solid gray;
	 width : 25%;
	 height : 70vh;
	 margin: auto auto;
	 overflow: hidden;
	 overflow-y: auto;
	 
}
#event1, #event2{
	float: right;
	margin: 0.1vw;
	padding: 0.6vh 1vw 0.6vh 1vw;
	border: 0;
	border-radius: 1.5em;
	background-color: #FCA937;
	color: white; 
}
.record{
	overflow-y: scroll;
}
#request{
	margin: 0.1vw;
	height: 3vh;
	width:58%;
}
.question{
	margin: 1vh 0.3vw 1vh 5vw;
	padding: 0.5vh 0.5vw;
	background-color: #FFEFD8;
	text-align: right;
	display: block;
	border-radius: 1.3em 1.3em 0.1em 1.3em;
	font-size: 0.9em;
	box-shadow: 0.2em 0.2em 1em #d7d7d7;
}
.answer{
	margin: 1vh 5vw 1vh 0.3vw;;
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
	border: 0;
	display: inline;
	border-radius: 1.5em;
	border: 0.1em solid #FFD37C;
	background-color: #FFEFD8; 
	color : dark;
	font-size : 0.8em;
}
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<div id="box">
<input type="text" id="request" name="text" placeholder="질문을 입력하세요." >  <!-- 질문이 한줄 이상 넘어가면 textarea로 만들것 -->
<input type="button" id="event1" value="입력" name="event">
<input type="button" id="event2" value="대화시작" name="event">

<div id="sound"></div>
 <div id="record"></div>

</div>

</body>
</html>
