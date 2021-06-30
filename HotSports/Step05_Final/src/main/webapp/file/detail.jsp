<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	FileDao dao = FileDao.getInstance();
	FileDto dto = new FileDto();
	dto = dao.getData(num);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1><%=dto.getTitle()%></h1>
<img id="resultImage" src="${pageContext.request.contextPath}/upload/<%=dto.getSaveFileName()%>"></img>

</body>
</html>