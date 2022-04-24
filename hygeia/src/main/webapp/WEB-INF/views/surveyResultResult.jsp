<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>설문조사-결과 결과 페이지</title>
<script src="/jquery-3.6.0.min.js"></script>
</head>

<body>

	<br>
    <!-- 저장 결과 알림 --> 
    <section>
      <h3>저장되었을까요...!?</h3>
    </section>

	<!-- a태그 예시 : naver 
	
	<a href="http://www.naver.com">Go Naver</a><br>
	
	  --> 
    
    <!-- 결과 출력 -->
	<br>
	<br>
	<br>
	<br>
	저장에 성공했습니다 
	<br>
	<br>	
	저장에 실패했습니다  
	<br> 
	<br> 
	
	---------- 
	<br>
		<c:if test="${ result == 1 }">
				<h2>저장 성공</h2>
		</c:if>
			
		<c:if test="${ result == 0 }">
				<h3>저장 실패</h3>
		</c:if>
			
	---------- 
	<br>
	
	
	<!-- footer -->
	<br>
	<br>
	<br>
	<br>
	<input type="button" value="made by Hygeia" name="backtomain" onClick="location.href='http://localhost:8081/index'" />
	<br>
	<br> 
    
    
</body>

</html>
