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
		//현재 페이지의 url에서 param값 받아오기 $.urlParam('변수') param 변수의 값 받아온다.
		$.urlParam = function(name){
		    var results = new RegExp('[\?&amp;]' + name + '=([^&amp;#]*)').exec(window.location.href);
		    return results[1] || 0;
		}
		
		//병 후기 목록 보여주기
		$.ajax({
			url: '<%=request.getContextPath()%>/diseasereview', 
			data: { 'disease_cntntsSn': $.urlParam('cntntsSn') }, 
			dataType: 'json', 
			success: function (list) {
				var review = "";
				for (var i = 0; i < list.length; i++){
					review += "<a href=\"/reviewresult?reviewid=" + list[i].id + "\">" + list[i].title + list[i].member_id + list[i].dateWrtn + "</a><br>";
				}
				$("#diseaseReview").html(review);
			}//success end
		});//ajax end
	});//ready end
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<%
//json 데이터 분류하기
String diseaseresult = (String)request.getAttribute("diseaseresult");
JSONObject total = new JSONObject(diseaseresult);
JSONObject xml = (JSONObject)total.get("XML");
JSONObject svc = (JSONObject)xml.get("svc");
JSONObject cntntsClList = (JSONObject)svc.get("cntntsClList");
JSONArray cntntsCl = (JSONArray)cntntsClList.get("cntntsCl");

String cntntssj = (String)svc.get("CNTNTSSJ");//병 이름 부분

//병 개요 부분
JSONObject overview = null;
if(cntntssj.equals("골다공증")){
	overview = (JSONObject)cntntsCl.get(1);
}
else if(cntntssj.equals("만성폐쇄성폐질환")){
	overview = (JSONObject)cntntsCl.get(2);
}
else{
	overview = (JSONObject)cntntsCl.get(0);	
}
String overviewcontent = (String)overview.get("CNTNTS_CL_CN");
%>

<div>
	<h2><%= cntntssj %></h2>
	
	<div><%= overviewcontent %></div>
</div>

<br>
<h4><%= cntntssj %> 관련 후기</h4>

<div id="diseaseReview">
	
</div>
</body>
</html>