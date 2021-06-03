<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	TodoDto dto = new TodoDto();
	TodoDao dao = TodoDao.getInstance();
	dto = dao.getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/updateform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	.container{
		padding-top: 20px;
	}
	.h1 {
		
		padding:auto;
		margin:auto;
		color: blue;
	}
</style>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../include/navbar.jsp"></jsp:include>
		<div class="h1">
			<h1 class = "primary"><%=num %>번 할 일 수정하기</h1>
		</div>
		<div class = "container">
			
			<form action="<%=request.getContextPath() %>/todo/update.jsp" class="row g-3" >
			<!-- 수정할때 -->
			<input type="hidden" name = "num" value="<%=dto.getNum() %>" />
			<input type="hidden" name = "regdate" value="<%=dto.getRegdate() %>" />
				<div class="container">
					<label for="num">번호</label>
					<%--input 요소에 disabled 속성을 추가하면 --%>
					<input type="text" class="form-control" name="num" id = "num" value = "<%=dto.getNum() %>" disabled />
				</div>
				<div class="container">
					<label for="content">내용</label>
					<input type="text" class="form-control" name="content" id = "content" value = "<%=dto.getContent() %>" />
				</div>
				<div class="container">
					<label for="regdate">날짜</label>
					<input type="text" class="form-control" name="regdate" id = "regdate" value ="<%=dto.getRegdate() %>" disabled />
				</div>
				<button type = "submit" class="btn btn-primary mb-3">수정</button>
				<button type = "reset" class="btn btn-primary mb-3">취소</button>
			</form>
		</div>
</body>
</html>