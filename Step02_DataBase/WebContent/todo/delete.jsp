<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   int num = Integer.parseInt(request.getParameter("num"));
   TodoDto dto = new TodoDto();
   dto.setNum(num);
   
   TodoDao dao = TodoDao.getInstance();
   dao.delete(dto);
   //boolean isSuccess = dao.delete(dto);
   
   /*
   		절대 경로 이동할 때 필요한 context path 는 나중에 제거 되거나 변경될 예정이기 때문에 
   		
   		메소드를 이용해서 얻어와서 써야 한다.
   
   */
   
   String cPath=request.getContextPath();
   
   // - 클라이언트에게 특정 경로로 요청을 다시 하라고 응답한다.(리다이렉트)
   //이동할 절대 경로를 문자열로 전달하면 클라이언트 웹브라우저가 전달한 경로로 다시 요청을 한다.
   response.sendRedirect(cPath+"/todo/list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/delete.jsp</title>
</head>
<body>
	<!-- <% //if(isSuccess){ %>
      <script>
      	alert("할 일을 삭제하였습니다!")
      	location.href="list.jsp"
      </script>
    <% //}else{ %>
      <script>
      	alert("삭제 실패!")
      	location.href="list.jsp"
      </script>
    <%//} %> -->
</body>
</html>