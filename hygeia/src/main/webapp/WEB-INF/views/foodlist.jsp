<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="/jquery-3.6.0.min.js"></script>

<style>

#foodtitle{margin: 0 auto;
text-align: center;
}

#search{
margin: 0 auto;
text-align: center;
}

#image{
width: 110px;
height: 110px;
filter: brightness(85%);
}

#imagelist{
position : relative;
}

#text{
z-index: 1;
position: absolute;
color: white;
left : 5px;
top : 45px;
height: 0px;
width: 100px;
font-weight: bold;
}

#list{
display: inline-block;
text-align: center;
margin: 0 auto;
padding : 10px;

/* background-color: green;
border: 1px solid blue; */
}

#outlist{
text-align: center;
margin: 0 auto;
width: 800px;

/* background-color: orange;
border: 1px solid red; */
}

</style>

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
<br>
<div id = "foodtitle"><h4 ><span class="badge rounded-pill bg-warning text-white">몸에 좋은 식재료</span></h4></div><br>

	<div id="search" >
		<form name="frmSearch" action="/food/searchFood.do" >
			<input name="searchWord" class="main_input" type="text"  onKeyUp="keywordSearch()"> 
			<input type="submit" name="search" class="btn1"  value="검 색" >
		</form>
	</div>
	<div id="suggest">
        <div id="suggestList"></div>
   </div><br>
   
   
	<!-- db 식재료. -->
	
	<div id = "outlist">
	<c:forEach items = "${foodlist }" var = "dto">		
	<div id = "list">
	<div id = "imagelist">
	<a href="/food?num=${dto.num}" > <img id = "image" src="/images/food/${dto.image }" 
	onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'"
	class="rounded"></a><br>
	
	<div id = "text">
		<p>${dto.name }</p>
	</div>
	
	</div>
	</div>
	<%-- <a href="/food?num=${dto.num}" > ${dto.name }</a><br> --%>
	</c:forEach>
	</div>
	
</body>
</html>