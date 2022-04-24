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

	<c:set var="Stack1" value="1" /> 
	<c:set var="Stack2" value="2" /> 
	<c:set var="Stack3" value="3" /> 
	<c:set var="Stack4" value="4" /> 
	<c:set var="Stack5" value="5" /> 
	<c:set var="Stack6" value="6" /> 
	<c:set var="Stack7" value="7" /> 
	<c:set var="Stack8" value="8" /> 
	<c:set var="Stack9" value="9" /> 
	<c:set var="Stack10" value="10" /> 
	<c:set var="Stack11" value="11" /> 
	<c:set var="Stack12" value="12" /> 

	<br>
	<c:forEach items="${result}" var="dto" varStatus="number">
		번호 : <c:out value="${number.count}" /> <br> 
   		<c:out value="${dto.value}" /> <br>
   		
   		<c:set var="Stack'${number.count}'" value="<c:out value="${dto.value}" />" /> <br> 
   		<c:out value="Stack'${number.count}'" /> <br>
	</c:forEach> 

	<br>

    <!-- 의심 성인병 (value 를 DB 로 부터 받아오기) --> 
    <section>
      <h3>(의심 성인병 이름)</h3>
    </section>

    <form action="/survey3" method="post" > <br> 
    <!-- 설명 (value 를 DB 로 부터 받아오기) -->
	<br>
	<br>
	<br>
	<br>
	당신의 의심 증상은...
	<br>
	(의심 성인병 이름) 
	<br> 
	<br>
	추천 식재료 : 
	<br> 
	(추천 식재료 리스트) 
	<br>
	<br> 
	<br>
	<br>
	<input type="text" placeholder="아이디 입력" name="member_id" /> <br>
	<input type="text" placeholder="의심 성인병 입력" name="resultDisease" /> <br>
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
