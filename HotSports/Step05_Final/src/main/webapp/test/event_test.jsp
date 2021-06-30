<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/event_test.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
<div class="alert alert-danger" role="alert">
  삭제했습니다.
</div>
<nav class="navbar navbar-light bg-light rounded" aria-label="breadcrumb">
	<div class="container-fluid">
	  <ol class="breadcrumb my-2">
	    <li class="breadcrumb-item" ><a href="#" style="text-decoration-line:none;">home</a></li>
	    <li class="breadcrumb-item" ><a href="#" style="text-decoration-line:none;">game</a></li>
	    <li class="breadcrumb-item active" aria-current="page">study</li>
	  </ol>
    </div>
</nav>
  <div class="col-md-4">
    <label for="validationServerUsername" class="form-label">email</label>
    <div class="input-group has-validation">
      <input type="text" class="form-control is-invalid" id="validationServerUsername" aria-describedby="inputGroupPrepend3 validationServerUsernameFeedback" required>
      <div id="validationServerUsernameFeedback" class="invalid-feedback">
        형식이 달라요
      </div>
    </div>
  </div>
  <button type="button" class="btn btn-outline-success">전송</button>
  <div class="mb-3">
  <label for="email" class="form-label">email</label>
  <input type="email" class="form-control" id="email" name=”email”>
</div>
<button id="activeBtn" >이벤트 활성화 하기</button>
<script>
	document.querySelector("#activeBtn").addEventListener("click",function(){
		document.querySelector("#myBtn").addEventListener("click",function(){
			alert("버튼을 눌렀네요?");
		},{once:true});
	});
</script>
</div>
</body>
</html>