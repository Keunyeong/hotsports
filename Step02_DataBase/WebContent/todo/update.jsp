<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String content = request.getParameter("content");
	String regdate = request.getParameter("regdate");
	
	TodoDto dto = new TodoDto(num,content,regdate);
	TodoDao dao = TodoDao.getInstance();
	boolean isSuccess = dao.update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../include/navbar.jsp"></jsp:include>
	<%if(isSuccess){ %>
	<div class="alert alert-info" role="alert">
		할 일을 수정 했습니다.
	</div>
	<script>
		location.href="/Step02_DataBase/todo/list.jsp"
	</script>
	<%}else{ %>
	<script>
		let cf = confirm("할 일의 수정을 실패 했습니다.다시 하시겠습니까?");
		if(cf){
			location.href="../"
		}else{
			location.href="list.jsp"
		}
	</script>
	<%} %>
</body>
</html>