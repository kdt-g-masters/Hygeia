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
      <h3>마지막 페이지랍니다~</h3>
    </section>
    
    <!-- 결과 출력 -->

	<br>
		<c:if test="${ result == 1 }">
				<h2>저장 성공</h2>
		</c:if>
			
		<c:if test="${ result == 0 }">
				<h3>저장 실패</h3>
		</c:if>
	<br>
	
	<br>
	<input type="button" value="홈페이지로 이동하기" name="backtoindex" onClick="location.href='http://localhost:8081/index'" />
	<br>
	<br> 

    
</body>

</html>
