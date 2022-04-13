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
			$("#record").append("<div class='question'>" + $("#request").val() + "</div><br>");	//질문출력
			
			$.ajax({
				url : "/chatbotajax2",
				data : {"request": $("#request").val(), "event":$(this).val()}, //질문, 입력 
				type : "get",
				dataType : "json",
				success : function(serverdata){ // 값을 보냈을 때 화면에서 바뀌는 부분
					var bubbles = serverdata.bubbles;
					for(var b in bubbles){
						if(bubbles[b].type == "text"){ //기본답변일때
							var textanswer = "<div class='answer'>"; 
							textanswer += bubbles[b].data.description;
							$("#record").append(textanswer+"</div><br>");	
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
	 width : 30%;
	 margin: auto auto;
	 
}
#event{
	float: right;
	margin: 0.05vw;
	height: 3.7vh;
	width: 9.5%;
	border: 0;
	border-radius: 1.5em;
	background-color: royalblue;
	color : white;
}

#request{
	margin: 0.1vw;
	height: 3vh;
	width:58%;
}
.question{
	margin: 0.1vw;
	border: 2px solid pink;
	text-align:left;
	display: block;
	border-radius: 5px;
}
.answer{
	margin: 0.1vw;
	border: 2px solid skyblue;
	text-align: right; 
	display: block;
	border-radius: 5px;
}
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<div id="box">
<input type="text" id="request" name="text" placeholder="질문을 입력하세요." >  <!-- 질문이 한줄 이상 넘어가면 textarea로 만들것 -->
<input type="button" id="event" value="입력" name="event">
<div id="sound"></div>
 <div id="record"></div>

</div>

</body>
</html>
