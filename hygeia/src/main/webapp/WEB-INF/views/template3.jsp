<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4/dist/css/bootstrap.min.css" crossorigin="anonymous">
<link href="/css/index.css" rel="stylesheet"/>
<link href="/css/chat.css" rel="stylesheet"/>
<script src="/jquery-3.6.0.min.js"></script>
<script src="/js/chat.js"></script>
<script>
	$(document).ready(function() {
		//병 후기 목록 보여주기
		$.ajax({
			url: '<%=request.getContextPath()%>/diseasereview', 
			data: { 'disease_cntntsSn': ${ param.cntntsSn } }, 
			dataType: 'json', 
			success: function (list) {
				var review = "<div id='review'><div id='review-tlb'><div class='container'>";
				for (var i = 0; i < list.length; i++){
					review += "<a href=\"/reviewresult?reviewid=" + list[i].id + "\">" 
						+ "<div class='row review-list' style='cursor: pointer;'>"
						+ "<div class='col-5 title'>" + list[i].title + "</div>"
						+ "<div class='col-2'>" + list[i].member_id + "</div>"
						+ "<div class='col-5'>" + list[i].dateWrtn + "</div>"
						+ "</div></a>";
				}
				review += "</div></div></div>"
				$("#diseaseReview").html(review);
			}//success end
		});//ajax end
		
		//병에 좋은 식재료 리스트
		$.ajax({
			url: '<%=request.getContextPath()%>/helpfulfoodlist', 
			data: { 'disease_cntntsSn': ${ param.cntntsSn } }, 
			dataType: 'json', 
			success: function (list) {
				var helpfulfood = "<div id='outlist'>";
				for (var i = 0; i < list.length; i++){
					helpfulfood += "<div id='list'><div id='imagelist'>"
						+ "<a href=\"/food?num=" + list[i].food_num + "\">" 
						+ "<img id='image' src=\"/images/food/" + list[i].image + "\" onmouseover=\"this.style.opacity='0.5'\" onmouseout=\"this.style.opacity='1'\" class='rounded'>"
						+ "</a><br>"
						+ "<div id='text'><p>" + list[i].name + "</p></div>"
						+ "</div></div>";
				}
				helpfulfood += "</div>"
				$("#helpfulfoodList").html(helpfulfood);
			}
		});//ajax end
	});//ready end
</script>
<style>
/* 전체 테두리 */
#line{
	width: 75%;
	height: auto;
	margin: 0 auto;
}

#diseasename{
	padding: 13px;
}

/* 몸에 좋은 식재료 */
#image{
	width: 110px;
	height: 110px;
	filter: brightness(85%);
}

#imagelist{
	position : relative;
}

#text{
	z-index: 1;
	position: absolute;
	color: white;
	left : 5px;
	top : 45px;
	height: 0px;
	width: 100px;
	font-weight: bold;
}

#list{
	display: inline-block;
	text-align: center;
	margin: 0 auto;
	padding : 10px;
}

#outlist{
	text-align: center;
	margin: 0 auto;
}

/* 병 관련 후기 */
#review-tlb{
    margin: 5vh 20vw 10vh;
    height: 100%;
    text-align: center;
}

.first{
	font-weight: bold;
	background-color: #FCA937;
	border-radius: 30px;
	padding: 0.9vh 0.3vw;
	margin: 0.7vh 0;
	color: white;
	box-shadow: 2px 2px 5px 1px #d7d7d7;
}

.review-list{
	font-weight: bold;
	background-color: white;
	border-radius: 30px;
	padding: 0.9vh 0.3vw;
	margin: 0.7vh 0;
	color: #939393;
	box-shadow: 2px 2px 5px 1px #d7d7d7;
}

.review-list .title{
	text-align: left;
}
</style>
</head>
<body class="bg-color">
	<!-- navbar -->
	<%@ include file="navbar.jsp" %>
	
	<main>
		<!-- api 데이터 -->
		<%
		//json 데이터 분류하기
		String diseaseresult = (String)request.getAttribute("diseaseresult");
		JSONObject total = new JSONObject(diseaseresult);
		JSONObject xml = (JSONObject)total.get("XML");
		JSONObject svc = (JSONObject)xml.get("svc");
		JSONObject cntntsClList = (JSONObject)svc.get("cntntsClList");
		JSONArray cntntsCl = (JSONArray)cntntsClList.get("cntntsCl");

		String cntntssj = (String)svc.get("CNTNTSSJ");//병 이름 부분

		//병 개요, 내용 부분
		JSONObject overview = null;
		JSONObject view1 = null;
		if(cntntssj.equals("골관절염")){
			overview = (JSONObject)cntntsCl.get(0);
			view1 = (JSONObject)cntntsCl.get(4);
		}
		else if(cntntssj.equals("이상지질혈증")){
			overview = (JSONObject)cntntsCl.get(0);
			view1 = (JSONObject)cntntsCl.get(8);
		}
		else if(cntntssj.equals("급성 심근경색증")){
			overview = (JSONObject)cntntsCl.get(0);
			view1 = (JSONObject)cntntsCl.get(11);
		}
		else if(cntntssj.equals("급성 바이러스 위장관염")){
			overview = (JSONObject)cntntsCl.get(0);
			view1 = (JSONObject)cntntsCl.get(4);
		}
		else if(cntntssj.equals("비만")){
			overview = (JSONObject)cntntsCl.get(0);
			view1 = (JSONObject)cntntsCl.get(8);
		}
		else if(cntntssj.equals("고혈압")){
			overview = (JSONObject)cntntsCl.get(0);
			view1 = (JSONObject)cntntsCl.get(18);
		}
		else if(cntntssj.equals("당뇨병")){
			overview = (JSONObject)cntntsCl.get(0);
			view1 = (JSONObject)cntntsCl.get(26);
		}
		else if(cntntssj.equals("폐색성죽상동맥경화증")){
			overview = (JSONObject)cntntsCl.get(0);
			view1 = (JSONObject)cntntsCl.get(3);
		}
		else if(cntntssj.equals("뇌졸중")){
			overview = (JSONObject)cntntsCl.get(0);
			view1 = (JSONObject)cntntsCl.get(10);
		}
		else if(cntntssj.equals("골다공증")){
			overview = (JSONObject)cntntsCl.get(1);
			view1 = (JSONObject)cntntsCl.get(7);
		}
		else{
			overview = (JSONObject)cntntsCl.get(2);	
			view1 = (JSONObject)cntntsCl.get(8);
		}
		String overviewcontent = (String)overview.get("CNTNTS_CL_CN");
		String view1content = (String)view1.get("CNTNTS_CL_CN");
		%>
		
		<br>
		<br>
		<!-- 전체 테두리 -->
		<div id="line" class="border border-2, shadow p-3 mb-5 bg-body rounded">
			<!-- 병 이름 -->
			<div id="diseasename"><h2><%= cntntssj %></h2></div><br><br>
			
			<!-- 병 개요 -->
			<h4><%= cntntssj %> 개요</h4>
			<div><%= overviewcontent %></div><br>
			
			<!-- 병 내용 -->
			<h4><%= cntntssj %>에 대한 내용</h4>
			<div><%= view1content %></div><br><br>
			
			<!-- 병에 좋은 식재료 -->
			<h4><%= cntntssj %> 에 좋은 식재료</h4>
			<div id="helpfulfoodList"></div>
			<br><br>
			
			<!-- 병 관련 후기 -->
			<h4><%= cntntssj %> 관련 후기</h4>
			<div id="diseaseReview"></div>
		</div>
			
	</main>
	
	<!-- chatbot -->
	<div id="ch-window" style="display:none">
		<div class="menu-bar">
			<div class="chat-close"><span id="close">
				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 19 19">
		  			<path fill-rule="evenodd" d="M13.854 2.146a.5.5 0 0 1 0 .708l-11 11a.5.5 0 0 1-.708-.708l11-11a.5.5 0 0 1 .708 0Z"/>
		  			<path fill-rule="evenodd" d="M2.146 2.146a.5.5 0 0 0 0 .708l11 11a.5.5 0 0 0 .708-.708l-11-11a.5.5 0 0 0-.708 0Z"/>
				</svg>
			</span></div>
		</div>	
		
		<div class="ch-input">
			<hr>
			<div class="input-group mb-3">
			    <input type="text" id="request" class="form-control" placeholder="..입력 시 첫대화로 이동" aria-label="Recipient's username" aria-describedby="basic-addon2">
			    <input type="button" id="event1" class="ch-bnt" value="입력" name="event">
				    <!-- send 부분 아이콘으로 변경하기
				    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send-fill" viewBox="0 0 16 16">
		  				<path d="M15.964.686a.5.5 0 0 0-.65-.65L.767 5.855H.766l-.452.18a.5.5 0 0 0-.082.887l.41.26.001.002 4.995 3.178 3.178 4.995.002.002.26.41a.5.5 0 0 0 .886-.083l6-15Zm-1.833 1.89L6.637 10.07l-.215-.338a.5.5 0 0 0-.154-.154l-.338-.215 7.494-7.494 1.178-.471-.47 1.178Z"/>
					</svg> 
					-->
				<input type="button" id="event2" class="ch-bnt" value="대화시작" name="event">
			</div>
		</div>
		
		<div id="record-box">
			<div id="sound"></div>
			<div id="record"></div>
		</div>
	
	</div>
	
	<!-- footer -->
	<%@ include file="footer.jsp" %>
		
	<div class="floating-container">
	  <div class="floating-button">
		<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 16 16">
		  <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
		  <!-- chatbot modal? toggle? -->
		</svg>
	  </div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>