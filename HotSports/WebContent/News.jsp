<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotSports:News</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<style>
	#d1{
		padding-top:70px;
		padding-left:20px;
	}
</style>
</head>
<body>
<div class="container">
	<div class="container fixed-top">
		<jsp:include page="include/navbar.jsp">
			<jsp:param value="News" name="thisPage"/>
		</jsp:include>
	</div>
	
		<div id="d1">
			<h3>리그 순위</h3>
		</div>
	</div>
	<div class="container">
		<div class="row m-2">
			<div class="col-sm-6 col-md-3 card text-dark bg-light " >
			  <div class="card-header fw-bold">프리미어 리그</div>
			  <div class="card-body">
			    <h5 class="card-title text-danger">1 - 맨체스터 시티 FC</h5>
			    <p class="card-text">
			    2 - 맨체스터 유나이티드 FC<br />
			    3 - 리버풀 FC<br />
			    4 - 첼시 FC<br />
			    5 - 레스터 시티 FC<br />
			    </p>
			  </div>
			</div>
			<div class="col-sm-6 col-md-3 card text-dark bg-light "  >
			  <div class="card-header fw-bold">라리가 리그</div>
			  <div class="card-body">
			    <h5 class="card-title text-danger">1 - AT 마드리드</h5>
			    <p class="card-text">
			    2 - 레알 마드리드<br />
			    3 - FC 바르셀로나<br />
			    4 - 세비야 FC<br />
			    5 - 레알 소시에다드<br />
			    </p>
			  </div>
			</div>
			<div class="col-sm-6 col-md-3 card text-dark bg-light " >
			  <div class="card-header fw-bold">세리에A 리그</div>
			  <div class="card-body">
			    <h5 class="card-title text-danger">1 - FC 인터 밀란</h5>
			    <p class="card-text">
			    2 - AC 밀란<br />
			    3 - 아탈란타 BC<br />
			    4 - 유벤투스 FC<br />
			    5 - SSC 나폴리<br />
			    </p>
			    </div>
			</div>
			<div class="col-sm-6 col-md-3 card text-dark bg-light " >
			  <div class="card-header fw-bold">분데스리가</div>
			  <div class="card-body">
			    <h5 class="card-title text-danger">1 - FC 바이에른 뮌헨</h5>
			    <p class="card-text">
			    2 - RB 라이프치히<br />
			    3 - 보루시아 도르트문트<br />
			    4 - VfL 볼프스부르크<br />
			    5 - 프랑크푸르트<br />
			    </p>
			    </div>
			</div>
		</div>
		
</div>
</body>
</html>