// foodlist.js
$(document).ready(function() {
	$("#btnSearch").on('click', function(){		
		$.ajax({
			url: '/food/searchFood.do',
			data: {'searchWord': $("#searchWord").val()},
			type: 'get',
			dataType: 'json',
			success: function(foodList) {
				var result = "";
				for (var i = 0; i < foodList.length; i++){									
					result += "<div id=\"list\">"
			       			+ "<div id=\"imagelist\">"
				   			+ "<a href=\"/food?num=" + foodList[i].num + "\">"
				        	+ "<img id=\"image\" src=\"/images/food/" + foodList[i].image + "\" onmouseover=\"this.style.opacity='0.5'\" onmouseout=\"this.style.opacity='1'\" class=\"rounded\">"
				      		+ "</a>"
				      		+ "<br>"
				      		+ "<div id=\"text\">"				      	
				      		+ "<p>" + foodList[i].name + "</p>"
					    	+ "</div>"
					    	+ "</div>"
				      		+ "</div>";				   			     
				}
				$("#outlist").html(result);
			} // function end
		});	// ajax end		
	}); // on end		
}); // ready end

var loopSearch=true;
function keywordSearch(){
	if(loopSearch==false)
		return;
		
 var value=$("#searchWord").val();
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