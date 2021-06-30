<%@page import="test.note.dao.NoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="test.note.dto.NoteDto"></jsp:useBean>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	NoteDao dao = NoteDao.getInstance();
	dto = dao.getData(num);
	String writer = dto.getWriter();
	String id = (String)session.getAttribute("id");
	
	if(!id.equals(writer)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN);
		return;
	}
	boolean isSuccess = dao.delete(num);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/note/private/delete.jsp</title>
</head>
<body>
	<%if(isSuccess){%>
      <script>
         alert("삭제 했습니다.");
         location.href="${pageContext.request.contextPath }/note/list.jsp";
      </script>
   <%}else{%>
      <script>
         alert("삭제 실패!");
         location.href="detail.jsp?num=<%=num%>";
      </script>
   <%} %>
</body>
</html>