<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		
	});
</script>
</head>
<body>
검색 결과 총 ${ cnt }개의 검색 결과가 있습니다.<br>
<c:forEach items="${ foodList }" var="dto">
	<a href="/food?num=${ dto.num }">
		${ dto.name }
		<img src="/images/food/${ dto.image }" width="50px" height="50px">
	</a><br>
</c:forEach>
</body>
</html>