<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../include/navbar.jsp">
		<jsp:param value="member" name="thisPage"/>
	</jsp:include>
	<div class = "container">
		<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
		    <ol class="breadcrumb">
		       <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>">Home</a></li>
		       <li class="breadcrumb-item "><a href="<%=request.getContextPath()%>/member/list.jsp">Member List</a></li>
		       <li class="breadcrumb-item active" aria-current="page">Member Insert</li>
		    </ol>
		</nav>
	<div class="row">
		<div class="col-sm-6 offset-sm-3">
			<form action="insert.jsp" method="post">
				<div class="mb-3">
					<label for="name" class="form-label">이름</label>
					<input type="text" class="form-control" name="name" id="name" />
				</div>
				<div class="mb-3">
					<label for="addr" class="form-label">주소</label>
					<input type="text" class="form-control" name="addr" id="addr" />
				</div>
				<button class="btn btn-primary" type="submit">추가</button>
			</form>
		</div>
	</div>
    
	</div>
</body>
</html>