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
		
		//jquery code
	});
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

</style>

<body>
<br>
<div id = "foodtitle"><h4 ><span class="badge rounded-pill bg-warning text-white">몸에 좋은 식재료</span></h4></div><br>

<!-- 검색 -->
<div id="search" >
		<form name="frmSearch" action="/food/searchFood.do" >
			<input name="searchWord" class="main_input" type="text"  onKeyUp="keywordSearch()"> 
			<input type="submit" name="search" class="btn1"  value="검 색" >
		</form>
	</div>
	<div id="suggest">
        <div id="suggestList"></div>
   </div><br>
<!-- 검색end. -->

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
	String effect = (String)onefood.get("EFFECT");
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
<%=trt %><br>
<h4><span class="badge rounded-pill bg-secondary">효능</span></h4>
<%= effect %>
</div>
<%
}
%>

<!-- DB 식재료 설명, 효능 -->
<div id = "dbline">
<p>${fooddto.description }</p><br><br> <!-- 식재료 설명 -->
<h4><span class="badge rounded-pill bg-secondary">효능</span></h4>
<p>${fooddto.effect }</p> <!-- 식재료 효능 --> 
</div>
</div>

<br>
<br>
<br>
</body>
</html>