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
	진행바
	<br>
	<br>

	<!-- 질문 ~ 답변 부분을 include 페이지로 처리 --> 
	
    <!-- 질문 (value 를 DB 로 부터 받아오기) --> 
    <section>
      <h1>질문 칸</h1>
    </section>

	<!-- a태그 예시 : naver 
	
	<a href="http://www.naver.com">Go Naver</a><br>
	
	  --> 
    
    <!-- 답변 (value 를 DB 로 부터 받아오기) -->
	<br>
	<br>
	답변1 
	<br>
	답변2 
	<br>
	답변3 
	<br>
	답변4 
	<br>
	답변5 
	<br>
	
	<br>
	<br>
	선택완료
	<br>
	
	<br>	
	---------- 
	<br>
	<br>

 	<c:out value="Test!" /> <br>
 		
	<br>
	
	<br>
	
	현재 페이지는, <c:out value="${surveydata.no}" />페이지 입니다. <br> 
	
	<br>
	---------- 
	<br>
	
	
	<!-- footer -->
	<br>
	<br>
	<br>
	<input type="button" value="made by Hygeia" name="backtomain" onClick="location.href='http://localhost:8081/index'" />
    
    
</body>

</html>
