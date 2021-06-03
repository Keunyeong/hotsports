<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	
	MemberDto dto = new MemberDto();
	dto.setNum(num);
	dto.setName(name);
	dto.setAddr(addr);
	MemberDao dao = MemberDao.getInstance();
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
	<script>
		location.href="/Step02_DataBase/member/list.jsp"
	</script>
	<%}else{ %>
	<script>
		location.href="/Step02_DataBase/member/list.jsp"
	</script>
	<%} %>
</body>
</html>