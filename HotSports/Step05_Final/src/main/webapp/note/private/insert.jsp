<%@page import="test.note.dao.NoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="test.note.dto.NoteDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	//로그인된 아이디를 session 영역에서 얻어내기
	String writer=(String)session.getAttribute("id");
	
	dto.setWriter(writer);
	
	boolean isSuccess=NoteDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/note/private/insert.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
   <script>
      alert("새 글이 추가 되었습니다.");
      location.href="${pageContext.request.contextPath}/note/list2.jsp";
   </script>
   <%}else{ %>
   <script>
      alert("글 추가 실패!");
      location.href="insertform.jsp";
   </script>
   <%} %>
</body>
</html>