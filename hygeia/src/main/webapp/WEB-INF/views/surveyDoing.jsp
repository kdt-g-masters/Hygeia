<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>설문조사-설문페이지</title>
<script src="/jquery-3.6.0.min.js"></script>
</head>

<body>

	이미지 
	<br> 
	<br>

	<!-- 질문 ~ 답변 부분을, include 페이지로 처리 --> 

	<br>
	
	<!-- 페이지 포함 --> 

	<c:if test="${survey.no == 1}"> 
		<%@ include file="surveyDoingP1.jspf" %> 
	</c:if> 
	
	<c:if test="${survey.no == 2}"> 
		<%@ include file="surveyDoingP2.jspf" %> 
	</c:if> 

	<c:if test="${survey.no == 3}"> 
		<%@ include file="surveyDoingP3.jspf" %> 
	</c:if> 
	
	<c:if test="${survey.no == 4}"> 
		<%@ include file="surveyDoingP4.jspf" %> 
	</c:if> 

	<c:if test="${survey.no == 5}"> 
		<%@ include file="surveyDoingP5.jspf" %> 
	</c:if> 
	
	<c:if test="${survey.no == 6}"> 
		<%@ include file="surveyDoingP6.jspf" %> 
	</c:if> 
	
	<c:if test="${survey.no == 7}"> 
		<%@ include file="surveyDoingP7.jspf" %> 
	</c:if> 
	
	<c:if test="${survey.no == 8}"> 
		<%@ include file="surveyDoingP8.jspf" %> 
	</c:if> 
	
	<c:if test="${survey.no == 9}"> 
		<%@ include file="surveyDoingP9.jspf" %> 
	</c:if> 
	
	<c:if test="${survey.no == 10}"> 
		<%@ include file="surveyDoingP10.jspf" %> 
	</c:if> 
	
	<c:if test="${survey.no == 11}"> 
		<%@ include file="surveyDoingP11.jspf" %> 
	</c:if> 

	<c:if test="${survey.no == 12 }"> 
		<%@ include file="surveyDoingP12.jspf" %> 
	</c:if> 

	<br>
	---------- 
	<br>
	
	<br>
	<form action="/surveynext" method="POST" > 
		<input type="submit" value="설문 그만하기" name="gotofinal" />  
	</form>
	<br>
	
	<!-- footer -->
	<br>
	<br>
	<br>
	<br>

    
    
</body>

</html>
