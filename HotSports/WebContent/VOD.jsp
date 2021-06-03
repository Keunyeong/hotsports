<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotSports:VOD</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<style>
	#d1 {	
		padding-top:60px;
	}
	#d2 {
		padding-top:10px;
	}
</style>
</head>
<body>
	<div class="container fixed-top">
		<jsp:include page="include/navbar.jsp">
			<jsp:param value="VOD" name="thisPage"/>
		</jsp:include>
	</div>
	<div class="container">
		<div id="d1">
			<div class="p-3 mb-2 bg-dark text-white"><img src="images2/champ2.png" alt="" width="40" height="40" > 챔피언스 리그</div>
			<div class="row">
		      <div class="col">
		         <div class="ratio ratio-16x9">
		              <iframe src="https://www.youtube.com/embed/lVuiVNoWxJQ" title="YouTube video" allowfullscreen></iframe>
		         </div>
		      </div>
		      <div class="col">
		         <div class="ratio ratio-16x9">
		              <iframe src="https://www.youtube.com/embed/BQETzf4Am-8" title="YouTube video" allowfullscreen></iframe>
		         </div>
		      </div>
		   </div>
		</div>
		<div id="d2">
			<div class="p-3 mb-2 bg-dark text-white"><img src="images2/uel2.png" alt="" width="34" height="34" > UEL</div>
			<div class="row">
		      <div class="col">
		         <div class="ratio ratio-16x9">
		              <iframe src="https://www.youtube.com/embed/2uELRa7SBuU" title="YouTube video" allowfullscreen></iframe>
		         </div>
		      </div>
		      <div class="col">
		         <div class="ratio ratio-16x9">
		              <iframe src="https://www.youtube.com/embed/Awl4OaSMy0g" title="YouTube video" allowfullscreen></iframe>
		         </div>
		      </div>
		   </div>
		</div>
		<div id="d2">
			<div class="p-3 mb-2 bg-dark text-white"><img src="images2/premier2.jpg" alt="" width="40" height="30" > 프리미어 리그</div>
			<div class="row">
		      <div class="col">
		         <div class="ratio ratio-16x9">
		              <iframe src="https://www.youtube.com/embed/bGMfsG7cyOE" title="YouTube video" allowfullscreen></iframe>
		         </div>
		      </div>
		      <div class="col">
		         <div class="ratio ratio-16x9">
		              <iframe src="https://www.youtube.com/embed/2zUgf7A9dPs" title="YouTube video" allowfullscreen></iframe>
		         </div>
		      </div>
		   </div>
		</div>
		<div id="d2">
			<div class="p-3 mb-2 bg-dark text-white"><img src="images2/laliga.png" alt="" width="34" height="34" > 라리가 리그</div>
			<div class="row">
		      <div class="col">
		         <div class="ratio ratio-16x9">
		              <iframe src="https://www.youtube.com/embed/skb3K5fVnxs" title="YouTube video" allowfullscreen></iframe>
		         </div>
		      </div>
		      <div class="col">
		         <div class="ratio ratio-16x9">
		              <iframe src="https://www.youtube.com/embed/c7LlGNloFEs" title="YouTube video" allowfullscreen></iframe>
		         </div>
		      </div>
		   </div>
		</div>
	</div>
</body>
</html>