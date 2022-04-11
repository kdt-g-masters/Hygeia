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
<h1>만병통치 후기</h1>
<!-- 검색 -->
<input type="search">
<!-- 후기 작성 페이지 링크 -->
<a href="/reviewinput">리뷰쓰기</a>
<div>병명 제목   작성자   일자   조회수</div>
<!-- 후기 목록 -->
<c:forEach items="${ reviewlist }" var="dto">
	<a href="/reviewresult?reviewid=${ dto.id }">${ dto.disease_cntntsSn } ${ dto.title } ${ dto.member_id } ${ dto.dateWrtn } ${ dto.views }</a><br>
</c:forEach>
</body>
</html>