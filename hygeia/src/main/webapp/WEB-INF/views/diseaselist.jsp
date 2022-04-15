<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		// 검색 버튼 클릭시
		$("#search").on('click', function(){
			$.ajax({
				url: '/disease/searchDisease.do',
				data: {'searchWord': $("#searchWord").val()},
				type: 'get',
				dataType: 'json',
				success: function(diseaseList) {
					var result = "";
					for (var i = 0; i < diseaseList.length; i++){
						result += "<a href=\"/diseaseresult?cntntsSn=" + diseaseList[i].cntntsSn + "\">" + diseaseList[i].name + "</a><br>";
					}
					$("#dList").html(result);
				} // function end
			});	// ajax end		
		}); // on end
	});
	var loopSearch=true;
	function keywordSearch(){
		if(loopSearch==false)
			return;
	 var value=document.frmSearch.searchWord.value;
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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<h1>생활습관병</h1>

<!-- 검색 -->
<div id="search" >
	<form name="frmSearch" action="/disease/searchDisease.do" >
		<input name="searchWord" id="searchWord" class="main_input" type="text"  onKeyUp="keywordSearch()"> 
		<input type="button" id="search" name="search" class="btn1"  value="검 색" >
	</form>
</div>
<div id="suggest" style="background-color: silver">
       <div id="suggestList"></div>
</div>
<hr>
   
<!-- 병 목록 -->
<div id="dList">
	<c:forEach items="${ diseaselist }" var="dto">
		<a href="/diseaseresult?cntntsSn=${ dto.cntntsSn }">${ dto.name }</a><br>
	</c:forEach>
</div>
</body>
</html>