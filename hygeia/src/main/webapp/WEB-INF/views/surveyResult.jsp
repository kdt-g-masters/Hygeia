<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>설문조사-결과 페이지</title>
<script src="/jquery-3.6.0.min.js"></script>
</head>

<body>

	<%@ include file="surveyCalculating.jspf" %> 	
	
	최고 스택 : <c:out value="${StackBest}" /> <br><br> 

    <!-- 의심 성인병 (value 를 DB 로 부터 받아오기) --> 
    <section>
      <h3>	의심 성인병 : <c:out value="${resultName}" /> </h3>
    </section>

    <form action="/survey3" method="post" > <br> 
    <!-- 설명 (value 를 DB 로 부터 받아오기) -->
	<br>
	
	추천 식재료 : <br> 
	<c:forEach items="${info}" var="dto2" varStatus="number">

		<c:if test="${dto2.name == resultName}"> 
			<c:out value="${dto2.no}" /> <br> 
			<c:out value="${dto2.name}" /> <br> 
			<c:out value="${dto2.foods}" /> <br> 
		</c:if> 	

	</c:forEach> 

	<br>
	<br> 
	<br>
	<br>
	<input type="text" value="(아이디 자동 로딩)" name="member_id" /> <br>
	<input type="text" value="<c:out value="${resultName}" /> " name="resultDisease" /> <br>
	<input type="submit" value="결과 저장하기 버튼" name="saveresult" /> <br> 
	</form> 
	
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
