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
<div>${ reviewresult.disease_cntntsSn } ${ reviewresult.title } ${ reviewresult.member_id } ${ reviewresult.dateWrtn } ${ reviewresult.views }</div>
<div>${ reviewresult.content }<br>${ reviewresult.tag }</div>
<input type="button" value="rcm">
<input type="button" value="nonrcm">
<input type="button" value="목록 보기">
</body>
</html>