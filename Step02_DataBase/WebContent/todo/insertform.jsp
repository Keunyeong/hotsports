<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insertform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	.container{
		padding-top: 20px;
	}
</style>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../include/navbar.jsp"></jsp:include>
	<div class="container">
		<h1>일정 추가하기</h1>
	</div>
	<div class="container">
	    <form action="insert.jsp" method="post"class="row g-3">
			<div class="mb-3">
				<label for="content" class="form-label">할 일 입력!</label>
				<input type="text"  class="form-control" name="content" id="content" />
			</div>
			<button type="submit" class="btn btn-primary mb-3">추가!</button>
		</form>
	</div>
</body>
</html>