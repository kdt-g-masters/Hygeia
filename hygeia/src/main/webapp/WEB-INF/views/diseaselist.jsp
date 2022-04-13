<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
	});
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<h1>생활습관병</h1>
<!-- 검색 -->
<input type="search">
<!-- 병 목록 -->
<div>
	<c:forEach items="${ diseaselist }" var="dto">
		<a href="/diseaseresult?cntntsSn=${ dto.cntntsSn }">${ dto.name }</a><br>
	</c:forEach>
</div>
</body>
</html>