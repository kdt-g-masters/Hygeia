<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
<form action="reviewmodify" method="post">
	<!-- reviewid값 전달 -->
	<input type="text" name="id" value="${ reviewmodify.id }" hidden>
	<!-- 병 -->
	<div>${ reviewmodify.name }</div>
	<div>
		<!-- 작성자 아이디 -->
		<div>${ reviewmodify.member_id }</div>
		<!-- 수정 전 날짜 -->
		<div>${ reviewmodify.dateWrtn }</div>
	</div>
	<!-- 제목 -->
	<input type="text" name="title" value="${ reviewmodify.title }">
	<!-- 첨부파일 -->
	<input type="text" name="attachments" value="${ reviewmodify.attachments }" readonly="readonly">
	<!-- 태그 -->
	<input type="text" name="tag" value="${ reviewmodify.tag }" readonly="readonly">
	<!-- 후기 내용 -->
	<textarea rows="40" cols="100" name="content">${ reviewmodify.content }</textarea>
	<input type="submit" value="후기 수정">
</form>
<button type="button" onclick="location.href='/reviewresult?reviewid=${ reviewmodify.id }'">수정 취소</button>
</body>
</html>