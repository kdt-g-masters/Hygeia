<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4/dist/css/bootstrap.min.css" crossorigin="anonymous">
<link href="/css/index.css" rel="stylesheet"/>
<link href="/css/chat.css" rel="stylesheet"/>
<link href="/css/my.css" rel="stylesheet"/>
<script src="/jquery-3.6.0.min.js"></script>
<script src="/js/chat.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
			
		// 식재료 후기 보여주기
		$.ajax({
			url: '<%=request.getContextPath()%>/foodreview', 
			data: { 'title': $("#title").val()},
			dataType: 'json', 
			success: function (list) {			
				let filterArr = list.filter(ele => ele.title.indexOf("${fooddto.name }")>-1);
	 			//console.log(filterArr)
	 			//let _htmlHoogi = "" ;
	 			let _name = "";
	 			let _id = "";
	 			let _time = "";
	 			filterArr.forEach(function(v){
	 			//_htmlHoogi += "<div><a href=\"/reviewresult?reviewid=" + v.id + "\">" + v.title + v.member_id + v.dateWrtn + "</a></div><br>";
	 			_name += "<div><a id = 'a' href=\"/reviewresult?reviewid=" + v.id + "\">" + v.title + "</a></div>";
	 			//_id += "<div><a href=\"/reviewresult?reviewid=" + v.id + "\">" + v.member_id + "</a></div>";
	 			//_time += "<div><a href=\"/reviewresult?reviewid=" + v.id + "\">" + v.dateWrtn + "</a></div>";
	 			});
	 			$("#name").append(_name);		 
	 			//$("#id").append(_id);
	 			//$("#time").append(_time);
	 			//$("#foodReview1").html(_htmlHoogi);
			}//success end
		});//식재료 리뷰 ajax end		
	});//ready end
	
</script>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>

#a{
color: #939393;
}

#foodtitle{margin: 0 auto;
text-align: center;
}

#foodname{
padding : 13px;
text-decoration : underline;
text-decoration-color: #FCA937
}

#image{
width: 400px;
height: 400px;
}

#imageshow{
text-align: center;
margin: 0 auto;
}

#line{
margin: 0 auto;
height: auto;
width: 850px;

/* background-color: orange;
border: 1px solid green; */
}

#inline
{
margin: 0 auto;
width: 800px;
height: auto;

/* background-color: blue;
border: 1px solid red; */
}

#dbline{
margin: 0 auto;
width: 800px;
height: auto;

}

#search{
margin: 0 auto;
text-align: center;
}

#effect{
margin: 0 auto;
text-align: center;
}

#reviewTitle{
text-decoration : underline;
text-decoration-color: #FCA937;
}
/* 
#time{
background-color : red;
}

#id{
background-color : yellow;
}

#name{
background-color : blue;
}
 */
</style>
</head>

<body class="bg-color">
<!-- navbar -->
	<%@ include file="navbar.jsp" %>
	
	<main>
<br>
<div id = "foodtitle"><h4 ><span class="badge rounded-pill bg-warning text-white">몸에 좋은 식재료</span></h4></div><br>

<div id = "line" class="border border-2, shadow p-3 mb-5 bg-body rounded"> <!-- 전체 테두리 -->
<!-- 식재료 이름 -->
<div id = "foodname"><h2>${fooddto.name }</h2></div><br><br>

<!-- 식재료 이미지 -->
<div id = "imageshow"><img id= "image" src="/images/food/${fooddto.image }" class="shadow-lg p-3 mb-5 bg-body rounded"></div><br><br><br>

<!-- api 식재료  -->
<%
String foodresult = (String)request.getAttribute("foodresult");
JSONObject total = new JSONObject(foodresult);
JSONObject grid = (JSONObject)total.get("Grid_20171128000000000572_1");
JSONObject result = (JSONObject)grid.get("result");
//String onefood = (String)row.get("PRDLST_NM");

JSONArray row = (JSONArray)grid.get("row");
for(int i = 0; i < row.length(); i++){
	JSONObject onefood = (JSONObject)row.get(i);
	//JSONObject fl = (JSONObject)onefood.get("ROW_NUM");
	String value = (String)onefood.get("PRDLST_NM");
	String effect1 = (String)onefood.get("EFFECT");
	String purchase = (String)onefood.get("PURCHASE_MTH");
	String cook = (String)onefood.get("COOK_MTH");
	String trt = (String)onefood.get("TRT_MTH");
%>
<div id = "inline">
<%= purchase %><br>
<%=cook%><br>
<%=trt %><br><br>
<h4 id = effect><span class="badge rounded-pill bg-secondary">효능 </span></h4><br>
<%= effect1 %>
</div>
<%
}
%>

<!-- DB 식재료 설명, 효능 -->
<div id = "dbline">

<c:choose> 
<c:when test= "${not empty fooddto.description}"> 
<div>${fooddto.description }</div><br> <!-- db 식재료 설명 -->
<h4 id = effect><span class="badge rounded-pill bg-secondary">효능</span></h4><br>
<div>${fooddto.effect }</div> <!-- db 식재료 효능 -->
</c:when> 
</c:choose> 
</div>
<br>
<br>

<!-- 식재료 리뷰  -->
<h4 id = "reviewTitle" > ${fooddto.name } 관련 후기</h4><br>

	<div id="review">
			<div class="container">
				<div id = reviewtext class="row review-list" style="cursor: pointer;">
					<div id = 'name' class='col'></div>
					<!-- <div id = 'id' class='col'></div> -->
					<!-- <div id = 'time' class='col'></div> -->
				</div>
			</div>	
</div>
</div>
<br>

</main>
<!-- chatbot -->
	<div id="ch-window" style="display:none">
		<div class="menu-bar">
			<div class="chat-close"><span id="close">
				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 19 19">
		  			<path fill-rule="evenodd" d="M13.854 2.146a.5.5 0 0 1 0 .708l-11 11a.5.5 0 0 1-.708-.708l11-11a.5.5 0 0 1 .708 0Z"/>
		  			<path fill-rule="evenodd" d="M2.146 2.146a.5.5 0 0 0 0 .708l11 11a.5.5 0 0 0 .708-.708l-11-11a.5.5 0 0 0-.708 0Z"/>
				</svg>
			</span></div>
		</div>	
		
		<div class="ch-input">
			<hr>
			<div class="input-group mb-3">
			    <input type="text" id="request" class="form-control" placeholder="..입력 시 첫대화로 이동" aria-label="Recipient's username" aria-describedby="basic-addon2">
			    <input type="button" id="event1" class="ch-bnt" value="입력" name="event">
				    <!-- send 부분 아이콘으로 변경하기
				    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send-fill" viewBox="0 0 16 16">
		  				<path d="M15.964.686a.5.5 0 0 0-.65-.65L.767 5.855H.766l-.452.18a.5.5 0 0 0-.082.887l.41.26.001.002 4.995 3.178 3.178 4.995.002.002.26.41a.5.5 0 0 0 .886-.083l6-15Zm-1.833 1.89L6.637 10.07l-.215-.338a.5.5 0 0 0-.154-.154l-.338-.215 7.494-7.494 1.178-.471-.47 1.178Z"/>
					</svg> 
					-->
				<input type="button" id="event2" class="ch-bnt" value="대화시작" name="event">
			</div>
		</div>
		
		<div id="record-box">
			<div id="sound"></div>
			<div id="record"></div>
		</div>
	
	</div>
	
	<!-- footer -->
	<%@ include file="footer.jsp" %>
		
	<div class="floating-container">
	  <div class="floating-button">
		<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 16 16">
		  <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
		  <!-- chatbot modal? toggle? -->
		</svg>
	  </div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>