<%@page import="test.note.dao.NoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="dto" class="test.note.dto.NoteDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	int num = dto.getNum();
	boolean isSuccess = NoteDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/note/private/update.jsp</title>
</head>
<body>
<script>
<%if(isSuccess){%>
	alert("수정을 완료하였습니다.");
	location.href="../detail.jsp?num=<%=num%>";
<%}else{%>
	alert("수정을 실패하였습니다.");
	location.href="../detail.jsp?num=<%=num%>";
<%}%>
</script>
</body>
</html>