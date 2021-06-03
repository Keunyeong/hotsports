<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotSports:Main</title>
<jsp:include page="include/resource.jsp"></jsp:include>
	<style>
		#h1 {
			padding-top:10px;
		}
		#h2 {
			padding:20px;
			padding-left:0px;
		}
		#d3 {
			padding-top:10px;
		}
		.blinking{
            -webkit-animation:blink .5s ease-in-out infinite alternate;
            -moz-animation:blink .5s ease-in-out infinite alternate;
            animation:blink .5s ease-in-out infinite alternate;
        }
        @-webkit-keyframes blink{
            0% {opacity:0;}
            100% {opacity:1;}
        }
        @-moz-keyframes blink{
            0% {opacity:0;}
            100% {opacity:1;}
        }
        @keyframes blink{
            0% {opacity:0;}
            100% {opacity:1;
        }
	</style>
</head>
<body>
	<div class="container">
		<jsp:include page="include/navbar.jsp"></jsp:include>
		<h4 id="h1">Today News <span class="blinking badge bg-danger">HOT</span></h4>
		<div class="row">
			<div class="col-4 mb-3 ">
				<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
				    <div class="carousel-indicators">
				    	<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				    	<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
				    	<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				    </div>
				    <div class="carousel-inner" style=" width:100%; height: 200px !important;">
				    
				    	<div class="carousel-item active">
					    	<a href="https://sports.news.naver.com/news.nhn?oid=076&aid=0003736645">
					        	<img src="https://imgnews.pstatic.net/image/076/2021/06/01/2021060201000086200002201_20210601120504289.jpg?type=w647" class="d-block w-100" alt="...">
					    	</a>
				    	</div>
					    <div class="carousel-item">
					    	<a href="https://sports.news.naver.com/news.nhn?oid=311&aid=0001305389">
					        	<img src="https://imgnews.pstatic.net/image/311/2021/06/01/0001305389_001_20210601165404373.jpg?type=w647"  class="d-block w-100" alt="...">
							</a>		    
					    </div>
					    <div class="carousel-item">
					    	<a href="https://sports.news.naver.com/news.nhn?oid=413&aid=0000119745">
					    		<img src="https://imgnews.pstatic.net/image/413/2021/06/01/0000119745_001_20210601140005094.jpg?type=w647" class="d-block w-100" alt="...">
					    	</a>
					    </div>
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div>
			</div>
			<div class="col-8 border-start">
				<p>
					<a class="text-decoration-none text-dark" href="https://sports.news.naver.com/news.nhn?oid=413&aid=0000119745">
						세계 최고의 선수 맞나...유벤투스, 호날두 이적료로 단돈 '380억' 책정
					</a>
				</p>
				<p>
					<a class="text-decoration-none text-dark" href="https://sports.news.naver.com/news.nhn?oid=076&aid=0003736645">
						장례식에서도 울지 않는 '바위'…아내 앞에서 흘린 '2번째 눈물'
					</a>
				</p>
				<p>
					<a class="text-decoration-none text-dark" href="https://sports.news.naver.com/news.nhn?oid=311&aid=0001305389">
						토트넘 회장, 맨시티에 "케인 줄게, 두 명 다오" 스왑딜 추진.
					</a>
				</p>
				<p>
					<a class="text-decoration-none text-dark" href="https://sports.news.naver.com/news.nhn?oid=139&aid=0002151605">
						지금부터 손흥민이 리더"…새 감독 누구든 손흥민과 대화 먼저!
					</a>
				</p>
				<p>
					<a class="text-decoration-none text-dark" href="http://www.busan.com/view/busan/view.php?code=2021060118511708459">
						국대 간판 수비수 김민재 유벤투스행?
					</a>
				</p>
			</div>
		</div>
		<div class="row-mt-3">
			<div>
				<a class="text-decoration-none" href="member/list.jsp">
					<div class="text-center p-3 mb-2 bg-primary bg-gradient text-white rounded">
	  					>>>>> HotSports 축구팀 인원 모집 Click! <<<<<
					</div>
				</a>
			</div>
		</div>
		
		<h4 id="h1">Hot Items <span class="blinking badge bg-danger">SALE</span></h4>
		<div class="row row-cols-1 row-cols-md-1 row-cols-lg-3">
		  <div class="col">
		    <div class="card">
		      <img src="https://contents.sixshop.com/thumbnails/uploadedFiles/45508/product/image_1604896303481_1000.png" class="card-img-top" >
		      <div class="card-body">
		        <h5 class="card-title"><a class="text-decoration-none text-dark" href="https://socksupmoment.com/">[삭스업]</a></h5>
		        <p class="card-text">축구 양말은!! 이영표 양말!</p>
		      </div>
		    </div>
		  </div>
		  <div class="col">
		    <div class="card">
		      <img src="//theninetyplus.com/web/product/big/202105/0faee70e768e3f22da332a2f650327e4.jpg" class="card-img-top" >
		      <div class="card-body">
		        <h5 class="card-title"><a class="text-decoration-none text-dark" href="https://theninetyplus.com/index.html">[나인티 플러스]</a></h5>
		        <p class="card-text">축구복은 역시!</p>
		      </div>
		    </div>
		  </div>
		  <div class="col">
		    <div class="card">
		      <img src="data:image/png;base64,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" class="card-img-top" >
		      <div class="card-body">
		        <h5 class="card-title"><a class="text-decoration-none text-dark" href="https://www.capostore.co.kr/">[카포풋볼스토어]</a></h5>
		        <p class="card-text">축구화 사러 오세요!</p>
		      </div>
		    </div>
		  </div>
		</div>
	
	</div>
</body>
</html>