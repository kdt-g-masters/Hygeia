/**
 * 회원가입
 */
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