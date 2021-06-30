<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	FileDao dao = FileDao.getInstance();
	FileDto dto = new FileDto();
	dto = dao.getData(num);
	String writer = dto.getWriter();
	String id = (String)session.getAttribute("id");
	
	if(!id.equals(writer)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN);
		return;
	}
	String realPath = request.getServletContext().getRealPath("/upload")+File.separator+ dto.getSaveFileName();
	
	File file = new File(realPath);
	
	boolean isExist = file.exists();
	
	if(file.exists()){
		file.delete();
	}

	boolean isSuccess = dao.delete(num);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/delete.jsp</title>
</head>
<body>
	<%if(isExist){%>
	<script>console.log(<%=file%>)</script>
	<%} %>
	<%if(isSuccess){%>
      <script>
         alert("삭제 했습니다.");
         location.href="${pageContext.request.contextPath }/file/list.jsp";
      </script>
   <%}else{%>
      <script>
         alert("삭제 실패!");
         location.href="${pageContext.request.contextPath }/file/list.jsp";
      </script>
   <%} %>
</body>
</html>