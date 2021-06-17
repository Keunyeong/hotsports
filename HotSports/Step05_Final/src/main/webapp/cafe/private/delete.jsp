<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	CafeDao dao = CafeDao.getInstance();
	CafeDto dto = new CafeDto();
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
<title>/cafe/private/delete.jsp</title>
</head>
<body>
	<%if(isSuccess){%>
      <script>
         alert("삭제 했습니다.");
         location.href="${pageContext.request.contextPath }/cafe/list.jsp";
      </script>
   <%}else{%>
      <script>
         alert("삭제 실패!");
         location.href="detail.jsp?num=<%=num%>";
      </script>
   <%} %>
</body>
</html>