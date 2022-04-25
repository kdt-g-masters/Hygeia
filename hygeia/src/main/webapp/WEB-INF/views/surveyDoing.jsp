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
	연산 결과 1 : <c:out value="${noCount+plus}" /> <br> 
	연산 결과 2 : <c:set var="noCount" value="${noCount+noCount}" /> 
	<c:out value="${noCount}" /> 
	<br>
	
	<br>
	---------- 
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
