/**
 * 
 */
 $(document).ready(function() {
		$(".floating-button").on('click', function(){
			show('ch-window');
			$("#close").on('click',function(){
				hide('ch-window');
			});
		});
		$(".close").on('click'),hide('ch-window');
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
						parser(serverdata)
						}
				});//ajax end
				$("li").on('click',function(){
					//var $(this).text
						console.log($(this).text());
						$("#record").append("<div class='question'>" + $(this).html() + "</div>");	//선택한 것출력
						$.ajax({
							url : "/chatbotajax2",
							data : {"request": $(this).html(), "event":"입력"}, //request: 인사/생활습관병/식재료/맞춤/후기
							type : "post",
							dataType : "json",
							success : function(serverdata){
								parser(serverdata);
							}
					});// ajax end
				});  //.link end
				$("#request").val(""); // 질문창 리셋
		}); // .ch-input input:button end
		
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
				if(bubbles[b].data.cover.type == "text"){ //멀티링크, 객관식 답변일때
					var textanswer ="<div class='answer'>" + bubbles[b].data.cover.data.description + "</div>";
					$("#record").append(textanswer);
						
					var addlink = "<ul class='link-group'>";//"<div class='link-group'>";
					for(var c in bubbles[0].data.contentTable){
						for(var d in bubbles[0].data.contentTable[c]){
							if(bubbles[0].data.contentTable[c][d].data.type == "button"){
								var link = bubbles[0].data.contentTable[c][d].data.title;
								//링크 있을때의 JSON 추출하기(맞춤정보, 후기정보)
								addlink += "<li class='link' >"+ link +"</li>";
							}
						}
					}
						
					$("#record").append(addlink+"</ul>");
				}
			}
		}
		var quickbnts = serverdata.quickButtons;	
		var addlink = "<div class='link-group'><ul>";
		for(var b in quickbnts){
			var link = quickbnts[b].title;
			addlink += "<li class='link' >"+ link +"</li>";
		}
		$("#record").append(addlink+"</ul></div>");
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