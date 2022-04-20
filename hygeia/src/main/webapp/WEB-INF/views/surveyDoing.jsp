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
	테스트 영역 
	<br>
	
	<br>

	<br>
 	<c:out value="Test!" /> 
 	<br>
	
	<br>
	현재 페이지는, <c:out value="${survey.no}" />페이지 입니다. 
	<br> 
	
	<br>
	출력 테스트 : <c:out value="10" /> <br>
	출력 테스트 2 : <c:out value="10+10" />  -> 변수 사용해야 함 
	<br>
	
	<br>
	변수 테스트 1) 변수 값 
	<c:set var="noCount" value="1" /> 
	<c:set var="plus" value="1" />
	<br> 
	현재 변수 값 : <c:out value="${noCount}" /> , 더하기 값 : <c:out value="${plus}" /> 
	<br> 
	
	<br>
	변수 테스트 2) 변수 연산 
	<br>
	연산 결과 : <c:out value="${noCount+plus}" /> 
	<br>
	
	<br>
	---------- 
	<br>
	
	<!-- 페이지 포함과 변수와 조건문을 활용해서, no 에 맞게 출력되도록 구성 --> 
	
	<%@ include file="surveyDoingP2.jspf" %> 
		
	<br>
	---------- 
	<br>
	
	<!-- footer -->
	<br>
	<br>
	<br>
	<input type="button" value="made by Hygeia" name="backtomain" onClick="location.href='http://localhost:8081/index'" />
	<br>
	<br>
    
    
</body>

</html>
