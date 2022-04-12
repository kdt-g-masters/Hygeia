<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
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
		$.ajax({
			url: '<%=request.getContextPath()%>/diseasereview', 
			data: {'disease_cntntsSn': 5300}, 
			dataType: 'json', 
			success: function (list) {
				var review = "";
				for (var i = 0; i < list.length; i++){
					review += "<a href=\"/reviewresult?reviewid=" + list[i].id + "\">" + list[i].title + list[i].member_id + list[i].dateWrtn + "</a>";
				}
				$("#diseaseReview").html(review);
			}//success end
		});//ajax end
	});
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<%
String diseaseresult = (String)request.getAttribute("diseaseresult");
JSONObject total = new JSONObject(diseaseresult);
JSONObject xml = (JSONObject)total.get("XML");
JSONObject svc = (JSONObject)xml.get("svc");
JSONObject cntntsClList = (JSONObject)svc.get("cntntsClList");
JSONArray cntntsCl = (JSONArray)cntntsClList.get("cntntsCl");

String cntntssj = (String)svc.get("CNTNTSSJ");//병 이름 부분
//병 개요 부분
JSONObject overview = (JSONObject)cntntsCl.get(0);
String overviewcontent = (String)overview.get("CNTNTS_CL_CN");
%>
<div>
	<h2><%= cntntssj %></h2>
	<div><%= overviewcontent %></div>
</div>
<div id="diseaseReview"></div>
</body>
</html>