<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	.col, .row > div {
		border:1px dotted red;
	}

</style>
</head>
<body>

	<div class="container-fluid border border-primary">
		<h1>.container-fluid</h1>
		<div class="row">
			<div class="col">col</div>
			<div class="col">col</div>
			<div class="col">col</div>
		</div>
		<div class="row">
		<!-- 
			col-sm-6 은 device 폭이 576px 이상에서 6/12 의 크기 즉 50% width 값을 갖는다.
			col-lg-3 은 device 폭이 992px 이상에서 3/12 의 크기 즉 25% width 값을 갖는다.
		 -->
			<div class="col-sm-6 col-lg-3">
				<img class="img-fluid" src="../images/image1.png" alt="" />
			</div>
			<div class="col-sm-6 col-lg-3">
				<img class="img-fluid" src="../images/image2.png" alt="" />
			</div>
			<div class="col-sm-6 col-lg-3">
				<img class="img-fluid" src="../images/image3.png" alt="" />
			</div>
			<div class="col-sm-6 col-lg-3">
				<img class="img-fluid" src="../images/image4.png" alt="" />
			</div>
		</div>
	</div>
	
	<div class="container border border-secondary">
		<h1>.container</h1>
		<div class="row">
			<div class="col">col</div>
			<div class="col">col</div>
			<div class="col">col</div>
		</div>
		<div class="row">
			<div class="col">
				<img src="../images/image1.png" alt="" />
			</div>
			<div class="col">
				<img src="../images/image2.png" alt="" />
			</div>
			<div class="col">
				<img src="../images/image3.png" alt="" />
			</div>
			<div class="col">
				<img src="../images/image4.png" alt="" />
			</div>
		</div>
	</div>
</body>
</html>