<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //1. 폼 전송되는 회원의 이름과 주소를 읽어와서
   request.setCharacterEncoding("utf-8");
   String content=request.getParameter("content");
   //이름과 주소를 MemberDto 객체에 담는다.
   TodoDto dto=new TodoDto();
   dto.setContent(content);
   //2. DB 에 저장하고
   TodoDao dao=TodoDao.getInstance();
   //작업의 성공여부를 리턴 받는다.
   // dao.insert(dto);
   boolean isSuccess=dao.insert(dto);
   //3. 응답한다.
%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insert.jsp</title>
</head>
<body>
<div class="container">
   <%if(isSuccess){ %>
      <script>
      	alert("할 일이 생겼습니다!")
      	location.href="list.jsp"
      </script>
   <%}else{ %>
      <script>
      	alert("추가 실패!")
      	location.href="insertform.jsp"
      </script>
   <%} %>
</div>

</body>
</html>