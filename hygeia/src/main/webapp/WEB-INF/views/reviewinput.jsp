<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
	});
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<h1>만병통치 후기</h1>
<form action="reviewinput" method="post">
	<select name="disease_cntntsSn">
		<option value="5300">고혈압</option>
		<option value="5305">당뇨병</option>
		<option value="5292">비만</option>
		<option value="5215">고지혈증</option>
		<option value="5340">동맥경화증</option>
		<option value="5243">심장병</option>
		<option value="5495">뇌졸중</option>
		<option value="5833">골다공증</option>
		<option value="5839">폐질환</option>
		<option value="5288">위장병</option>
		<option value="1988">관절염</option>
	</select>
	<div>
		<div>작성자</div><input type="text" name="member_id">
		<%Date now = new Date(); SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); %>
		<div><%=formatter.format(now) %></div><input type="text" name="dateWrtn" value="<%=formatter.format(now) %>" hidden>
	</div>
	<input type="text" name="title">
	<input type="text" name="attachments">
	<input type="text" name="tag">
	<textarea rows="40" cols="100" name="content"></textarea>
	<input type="submit" value="후기 올리기">
</form>
</body>
</html>