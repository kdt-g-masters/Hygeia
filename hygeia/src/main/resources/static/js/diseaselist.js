//diseaselist.js
 $(document).ready(function() {
	// 검색 버튼 클릭시
	$("#btnSearch").on('click', function(){
		$.ajax({
			url: '/disease/searchDisease.do',
			data: {'searchWord': $("#searchWord").val()},
			type: 'get',
			dataType: 'json',
			success: function(diseaseList) {
				var result = "";
				for (var i = 0; i < diseaseList.length; i++){
					result += "<div id='listcol'><div class='col-sm-4 col-md-2 col-lg-2 col-xl-1'>"
					+ "<a href=\"/diseaseresult?cntntsSn=" + diseaseList[i].cntntsSn + "\">" 
					+ "<div class='card shadow diseaseCardStyle'><div class='card-body cardTextCenter'>"
					+ "<h4 class='card-title'>" + diseaseList[i].name + "</h4>"
					+ "</div></div></a></div></div>";
				}
				$("#diseaseList").html(result);
			} // function end
		});	// ajax end		
	}); // on end
});

var loopSearch=true;
function keywordSearch(){
	if(loopSearch==false)
		return;

	var value = $("#searchWord").val();
	$.ajax({
		type : "get",
		async : true, //false인 경우 동기식으로 처리한다.
		url : "/disease/keywordSearch.do",
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
	 $("#searchWord").val(selectedKeyword)
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