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
	<input type="button" value="답변1(증상 1)" name="ans1" onClick="location.href='http://www.daum.net'" /> 
	<br>
	<input type="button" value="답변2(증상 2)" name="ans2" onClick="location.href='http://www.daum.net'" /> 
	<br>
	<input type="button" value="답변3(증상 3)" name="ans3" onClick="location.href='http://www.daum.net'" /> 
	<br>
	<input type="button" value="답변4(증상 4)" name="ans4" onClick="location.href='http://www.daum.net'" /> 
	<br>
	<input type="button" value="답변5(증상 5)" name="ans5" onClick="location.href='http://www.daum.net'" /> 
	<br>
	
	<!-- footer -->
	<br>
	<br>
	<br>
	<input type="button" value="made by Hygeia" name="backtomain" onClick="location.href='http://www.daum.net'" />
    
    
</body>

</html>
