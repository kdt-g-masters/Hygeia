<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		//jquery code
	});
</script>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>

<!-- 식재료이미지 -->
<img id= "image" src="/images/${fooddto.image }"><br><br> 

<!-- 식재료 이름 -->
<h1>${fooddto.name }</h1><br> 

<!-- open api 식재료  -->
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
	String img = (String)onefood.get("IMG_URL");
	
	//out.println("<h1>" + value + "</h1>"); //식재료 이름
	out.println("<h3>" + effect + "</h3>"); //효능
	out.println("<h3>" + purchase + "</h3>");// 좋은 식재료 고르는 방법
	out.println("<h3>" + cook + "</h3>"); //조리
	out.println("<h3>" + trt + "</h3>"); //보관방법	
}
%>
<div>
<!-- DB 식재료 설명, 효능 -->
<h3>${fooddto.description }</h3><br><br> <!-- 식재료 설명 -->
<h3>${fooddto.effect }</h3><br> <!-- 식재료 효능 --> 
</div>

</body>
</html>

