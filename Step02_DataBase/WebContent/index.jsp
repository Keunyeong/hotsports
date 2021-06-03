<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<style>
	.container{
		
	    padding-top: 20px;
	 }
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="include/navbar.jsp"></jsp:include>
		<div class="container">
			<h1>사장님이 미쳤어요  <span class="badge bg-danger"> 70%할인</span></h1>
		</div>
		<div id="carouselExampleControls" class="carousel slide" data-bs-touch="false" data-bs-interval="false">
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="images/top01.jpg" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="images/top02.jpg" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="images/top03.jpg" class="d-block w-100" alt="...">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
	</div>
	
	<div class="container">
		<div class="row align-items-center">
		
		  <div class="col-3">
		    <div class="card h-100">
		      <img src="images/1.jpg" class="card-img-top img-fluid" alt="...">
		      <div class="card-body">
		        <h5 class="card-title">Card title</h5>
		        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
		      </div>
		      <div class="card-footer">
		        <small class="text-muted">Last updated 3 mins ago</small>
		      </div>
		    </div>
		  </div>
		  
		  <div class="col-3">
		    <div class="card h-100">
		      <img src="images/2.jpg" class="card-img-top img-fluid" alt="...">
		      <div class="card-body">
		        <h5 class="card-title">Card title</h5>
		        <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
		      </div>
		      <div class="card-footer">
		        <small class="text-muted">Last updated 3 mins ago</small>
		      </div>
		    </div>
		  </div>
		  
		  <div class="col-3">
		    <div class="card h-jpg">
		      <img src="images/3.jpg" class="card-img-top img-fluid" alt="...">
		      <div class="card-body">
		        <h5 class="card-title">Card title</h5>
		        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
		      </div>
		      <div class="card-footer">
		        <small class="text-muted">Last updated 3 mins ago</small>
		      </div>
		    </div>
		  </div>
		  
		  <div class="col-3">
		    <div class="card h-jpg">
		      <img src="images/4.jpg" class="card-img-top img-fluid" alt="...">
		      <div class="card-body">
		        <h5 class="card-title">Card title</h5>
		        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
		      </div>
		      <div class="card-footer">
		        <small class="text-muted">Last updated 3 mins ago</small>
		      </div>
		    </div>
		  </div>
		  
		</div>
	</div>
</body>
</html>
