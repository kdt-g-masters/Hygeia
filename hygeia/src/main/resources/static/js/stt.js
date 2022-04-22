/**
 * 음성 질문 처리
 */
var record = document.getElementById("btnSearchMic"); // 녹음 버튼
var stop = document.getElementById("btnMicStop"); // 정지 버튼
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
		record.style.display = "none";
		stop.style.display = "inline-block";
	}
	stop.onclick = function() {
		mediaRecorder.stop();
		record.style.color = "";
		record.style.background = "";
		record.style.display = "inline-block";
		stop.style.display = "none";		
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