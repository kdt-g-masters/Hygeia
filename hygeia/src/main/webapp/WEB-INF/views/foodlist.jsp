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

	}); // ready end
	var loopSearch=true;
	function keywordSearch(){
		if(loopSearch==false)
			return;
	 var value=document.frmSearch.searchWord.value;
		$.ajax({
			type : "get",
			async : true, //false인 경우 동기식으로 처리한다.
			url : "/food/keywordSearch.do",
			data : {keyword:value},
			success : function(data, textStatus) {
			    var jsonInfo = JSON.parse(data);
				displayResult(jsonInfo);
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				// alert("작업을완료 했습니다");				
			}
		}); //end ajax	
	} // keywordSearch() end		
	
	function displayResult(jsonInfo){
		var count = jsonInfo.keyword.length;
		if(count > 0) {
		    var html = '';
		    for(var i in jsonInfo.keyword){
			   html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
		    }
		    var listView = document.getElementById("suggestList");
		    listView.innerHTML = html;
		    show('suggest');
		}else{
		    hide('suggest');
		} 
	} // displayResult end
	function select(selectedKeyword) {
		 document.frmSearch.searchWord.value=selectedKeyword;
		 loopSearch = false;
		 hide('suggest');
	}
		
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
</head>
<body>
	<div id="search" >
		<form name="frmSearch" action="/food/searchFood.do" >
			<input id="searchWord" name="searchWord" class="main_input" type="text"  onKeyUp="keywordSearch()"> 
			<input type="submit" name="search" class="btn1"  value="검 색" >
		</form>
		<button id="record">음성 질문 시작</button>
		<button id="stop">음성 질문 종료</button>
		<div id="sound"></div>
	</div>
	<div id="suggest">
        <div id="suggestList"></div>
   </div>
   
	<!-- db 식재료 -->
	<c:forEach items = "${foodlist }" var = "dto">
		<a href="/food?num=${dto.num}" > ${dto.name }</a> <br>
	</c:forEach>
	
	<!-- 음성 질문 처리 구현 코드 -->
	<script>
		var record = document.getElementById("record"); // 녹음 버튼
		var stop = document.getElementById("stop"); // 정지 버튼
		var sound = document.getElementById("sound"); // 오디오 태그 출력 예정
	 	
	 	if (navigator.mediaDevices) { // 녹음기 카메라 지원하는 브라우저?
	 		console.log("지원 가능");
	 		var constraints = { audio: true } // 녹음기 사용
	 	}
	 	
	 	var chuncks=[] // 녹음 내용 임시 저장 예정
	 	navigator.mediaDevices.getUserMedia(constraints)
	 	.then(function(stream) {
	 		var mediaRecorder = new MediaRecorder(stream);
	 		record.onclick = function() {
	 			mediaRecorder.start();
	 			record.style.color = "blue";
	 			record.style.background = "red"; // 녹음 진행중, 파란 글씨 빨간 배경
	 		}
	 		stop.onclick = function() {
	 			mediaRecorder.stop();
	 			record.style.color = "";
	 			record.style.background = "";
	 		}
	 	
		 	// 녹음 시작 상태이면 chuncks에 녹음 데이터 저장
		 	mediaRecorder.ondataavailable = function(e) {
		 		chuncks.push(e.data);
		 	} // ondataavailable end
		 	
		 	// 녹음 정지 상태일 경우
		 	mediaRecorder.onstop = function(e) {
		 		// audio 태그 생성
		 		var audio = document.createElement('audio'); // <audio></audio>
		 		audio.setAttribute("controls", '');
		 		audio.controls = true; // <audio controls="controls"></audio>
		 		sound.appendChild(audio); // <div id="sound"><audio controls="controls"></audio></div>	 		
		 		
		 		// 녹음 데이터 가져와라
		 		var blob = new Blob(chuncks, {"type": "audio/mp3"});
		 		var mp3url = URL.createObjectURL(blob);
		 		audio.src = mp3url;
		 		
		 		// 다음 녹음을 위해 chuncks 초기화
		 		chuncks = [];
		 		
		 		// 파일명 현재 시각 + 확장자 mp3
		 		// text <= ChatbotSTTService test(.mp3 파일)
		 		// ajax 요청 전달 data - 파일 전달(Multipart File, multipart/form-data => form 태그)
		 		// 파일 업로드 => 녹음 컴퓨터에서 스프링 부트 서버로 파일 업로드(ajax 방식 => form 못쓴다.)
		 		// ajax로 파일 업로드 하는 방법
		 		var formData = new FormData(); // form 태그 대신하여 데이터 저장
		 		formData.append("file1", blob, "csr.mp3");
		 		$.ajax({ // 녹음 파일 업로드
		 			url: '/mp3Upload',
		 			data: formData,
		 			type: 'post',
		 			processData: false,
		 			contentType: false,
		 			success: function(server){
		 				if (server == "성공") {
		 					$.ajax({ // 스프링 서버가 ChatbotSTTService test(mp3) 호출 리턴 텍스트 변환 결과
		 						url: '/searchSTT',
		 						data: {'fileName': "csr.mp3"},
		 						type: 'get',
		 						dataType: 'json',
		 						success: function(server) {
		 							$("#searchWord").val(server.text);
		 						}
		 					}); 
		 				}
		 			}
		 		});
		 		
		 	} // onstop end
	 	}) // then end
	 	.catch(function(err) {
	 		console.log("오류 발생" + err);
	 	});
	 </script>
</body>
</html>