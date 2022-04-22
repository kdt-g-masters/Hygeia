<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/search.css" rel="stylesheet"/>
<script src="/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		
	});
</script>
</head>
<body>
	<br>
	<div id="search">
	  <div class="row justify-content-center">
	    <div id="searchBox" class="d-flex col-4">
	      <div class="input-group">
	        <input name="searchWord" id="searchWord" class="form-control main_input flex-fill" aria-label="search" aria-describedby="btnSearch" placeholder="검색어 입력 또는 마이크를 눌러 음성인식" type="text" onKeyUp="keywordSearch()"> 			
		    <button class="btn btn-primary" id="btnSearch" name="search" type="button">
			  <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#FFF" class="bi bi-search" viewBox="0 0 16 16">
			    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
			  </svg>				
		    </button>		    		    
	      </div>
	      <button id="btnSearchMic" type="button">
		    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-mic-fill" viewBox="0 0 16 16">
		      <path d="M5 3a3 3 0 0 1 6 0v5a3 3 0 0 1-6 0V3z"/>
		      <path d="M3.5 6.5A.5.5 0 0 1 4 7v1a4 4 0 0 0 8 0V7a.5.5 0 0 1 1 0v1a5 5 0 0 1-4.5 4.975V15h3a.5.5 0 0 1 0 1h-7a.5.5 0 0 1 0-1h3v-2.025A5 5 0 0 1 3 8V7a.5.5 0 0 1 .5-.5z"/>
		    </svg>	    
	      </button>
	      <button id="btnMicStop">
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-stop-fill" viewBox="0 0 16 16">
			  <path d="M5 3.5h6A1.5 1.5 0 0 1 12.5 5v6a1.5 1.5 0 0 1-1.5 1.5H5A1.5 1.5 0 0 1 3.5 11V5A1.5 1.5 0 0 1 5 3.5z"/>
			</svg>		      
	      </button>		    
	    </div>
	  </div>
	  <br>
	</div>		
	<div id="suggest" style="background-color: silver">
		<div id="suggestList"></div>
	</div>
	<br><br><br>
</body>
</html>