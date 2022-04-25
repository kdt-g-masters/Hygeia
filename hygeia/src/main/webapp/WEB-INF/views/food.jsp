<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="/jquery-3.6.0.min.js"></script>
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
	 			let _htmlHoogi = "" ;
	 			filterArr.forEach(function(v){
	 			_htmlHoogi += "<div><a href=\"/reviewresult?reviewid=" + v.id + "\">" + v.title + v.member_id + "</a></div><br>";
	 			});
	 			$("#foodReview1").append(_htmlHoogi);			
			}//success end
		});//식재료 리뷰 ajax end		
	});//ready end
	
</script>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>

<style>

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

</style>

<body>
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
String num = (String)request.getParameter("num");
String effect = (String)request.getParameter("fooddto.effect");
String description = (String)request.getParameter("fooddto.description");


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
	
	//out.println("<h1>" + value + "</h1>"); //식재료 이름
	//out.println(effect); //효능
	//out.println(purchase);// 좋은 식재료 고르는 방법
	//out.println(cook); //조리
	//out.println(trt); //보관방법	
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
<p>${fooddto.description }</p><br> <!-- db 식재료 설명 -->
<h4 id = effect><span class="badge rounded-pill bg-secondary">효능</span></h4><br>
<p>${fooddto.effect }</p> <!-- db 식재료 효능 -->
</c:when> 
</c:choose> 
</div>
</div>
<div id="foodReview1" ></div><br>
<br>
<br>
<br>
</body>
</html>