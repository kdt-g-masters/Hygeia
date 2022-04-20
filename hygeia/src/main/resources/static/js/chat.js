/*chatbot.js */
 $(document).ready(function() {
		$(".floating-button").on('click', function(){
			show('ch-window');
			$("#close").on('click',function(){
				hide('ch-window');
			});
		});
		//---입력, 대화시작 클릭시 
		$(".ch-bnt").on('click', function(){
				if( $("#request").val() != ""){
					$("#record").append("<div class='question'>" + $("#request").val() + "</div>");	//질문출력
				}
				$.ajax({
					url : "/chatbot",
					data : {"request": $("#request").val(), "event":$(this).val()}, //입력,대화시작 
					type : "get",
					dataType : "json",
					success : function(serverdata){
						parser(serverdata)
						$("li").on('click',function(){
							console.log($(this).text());
							$("#record").append("<div class='question'>" + $(this).html() + "</div>");	//선택한 것출력
							$.ajax({
								url : "/chatbot",
								data : {"request": $(this).html(), "event":"입력"}, //request: 인사/생활습관병/식재료/맞춤/후기
								type : "post",
								dataType : "json",
								success : function(serverdata){
									parser(serverdata);
								}
							});//ajax end
						});  //li end
						}//function end
				});// ajax end
				
				$("#request").val(""); // 질문창 리셋
		}); // .ch-input input:button end
	}); //ready onclick
		
	function parser(serverdata){ // 값을 보냈을 때 화면에서 바뀌는 부분
		var bubbles = serverdata.bubbles;
		for(var b in bubbles){
			if(bubbles[b].type == "text"){ //기본답변일때
				var textanswer = "<div class='answer'>" + bubbles[b].data.description +"</div>"; 
				$("#record").append(textanswer);
			}
			else if(bubbles[b].type == "template"){
				if(bubbles[b].data.cover.type == "text"){ //멀티링크, 객관식 답변일때
					var textanswer ="<div class='answer'>" + bubbles[b].data.cover.data.description + "</div>";
					$("#record").append(textanswer);
				}
				var contentTable = bubbles[b].data.contentTable;	
				var addlink = "<ul class='link-group'>";//"<div class='link-group'>";
				for(var c in contentTable){
					for(var d in contentTable[c]){
						var text = contentTable[c][d].data.title;
						if( contentTable[c][d].data.data.action.type == "link" ) {
							addlink += "<li class='link'><a href='" + contentTable[c][d].data.data.action.data.url + "'>" +
									text + "</a></li>"	
						}
						else  {
							addlink += "<li class='link'>"+ text + "</li>" ;
						}
						//링크 있을때의 JSON 추출하기(맞춤정보, 후기정보)
					}
				}	
				$("#record").append(addlink+"</ul>");
			}
		}
		
		if(serverdata.quickButtons){
			var quickbnts = serverdata.quickButtons;	
			var quickbnt = "<ul class='link-group'>";
			for(var b in quickbnts){
				quickbnt += "<li class='link' >"+ quickbnts[b].title +"</li>";
			}
			$("#record").append(quickbnt+"</ul>");
		}
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