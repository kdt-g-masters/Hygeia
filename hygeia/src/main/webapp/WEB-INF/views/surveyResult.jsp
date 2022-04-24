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

	<c:set var="Stack1" value="0" /> 
	<c:set var="Stack2" value="0" /> 
	<c:set var="Stack3" value="0" /> 
	<c:set var="Stack4" value="0" /> 
	<c:set var="Stack5" value="0" /> 
	<c:set var="Stack6" value="0" /> 
	<c:set var="Stack7" value="0" /> 
	<c:set var="Stack8" value="0" /> 
	<c:set var="Stack9" value="0" /> 
	<c:set var="Stack10" value="0" /> 
	<c:set var="Stack11" value="0" /> 
	<c:set var="Stack12" value="0" /> 

	<br>
	<c:forEach items="${result}" var="dto" varStatus="number">

		<c:if test="${dto.diseaseName == '고혈압'}"> 
			<c:set var="Stack1" value="${dto.value}" />
		</c:if> 
		
		<c:if test="${dto.diseaseName == '뇌졸중'}"> 
			<c:set var="Stack2" value="${dto.value}" /> 
		</c:if> 
		
		<c:if test="${dto.diseaseName == '당뇨병'}"> 
			<c:set var="Stack3" value="${dto.value}" /> 
		</c:if> 
		
		<c:if test="${dto.diseaseName == '동맥경화증'}"> 
			<c:set var="Stack4" value="${dto.value}" /> 
		</c:if> 
		
		<c:if test="${dto.diseaseName == '급성심근경색'}"> 
			<c:set var="Stack5" value="${dto.value}" /> 
		</c:if> 
		
		<c:if test="${dto.diseaseName == '위염'}"> 
			<c:set var="Stack6" value="${dto.value}" /> 
		</c:if> 
		
		<c:if test="${dto.diseaseName == '비만'}"> 
			<c:set var="Stack7" value="${dto.value}" /> 
		</c:if> 
		
		<c:if test="${dto.diseaseName == '만성폐쇄성 폐질환'}"> 
			<c:set var="Stack8" value="${dto.value}" /> 
		</c:if> 
		
		<c:if test="${dto.diseaseName == '골다공증'}"> 
			<c:set var="Stack9" value="${dto.value}" /> 
		</c:if> 
		
		<c:if test="${dto.diseaseName == '관절염'}"> 
			<c:set var="Stack10" value="${dto.value}" /> 
		</c:if> 
		
		<c:if test="${dto.diseaseName == '고지혈증'}"> 
			<c:set var="Stack11" value="${dto.value}" /> 
		</c:if> 
		
		<c:if test="${dto.diseaseName == '건강함'}"> 
			<c:set var="Stack12" value="${dto.value}" /> 
		</c:if> 

	</c:forEach> 

	고혈압 스택 : <c:out value="${Stack1}" /> <br> 
	뇌졸중 스택 : <c:out value="${Stack2}" /> <br> 
	당뇨병 스택 : <c:out value="${Stack3}" /> <br> 
	동맥경화증 스택 : <c:out value="${Stack4}" /> <br> 
	급성심근경색 스택 : <c:out value="${Stack5}" /> <br> 
	위염 스택 : <c:out value="${Stack6}" /> <br> 
	비만 스택 : <c:out value="${Stack7}" /> <br> 
	만성폐쇄성 폐질환 스택 : <c:out value="${Stack8}" /> <br> 
	골다공증 스택 : <c:out value="${Stack9}" /> <br> 
	관절염 스택 : <c:out value="${Stack10}" /> <br> 
	고지혈증 스택 : <c:out value="${Stack11}" /> <br> 
	건강함 스택 : <c:out value="${Stack12}" /> <br> 
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
