<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	CafeDto dto = new CafeDto();
	CafeDao dao = CafeDao.getInstance();
	dto = dao.getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/updateform.jsp</title>
</head>
<body>
	<div class="container">
		<h1>글 수정 폼입니다.</h1>
		<form action="update.jsp">
		  <input type="hidden" name="num" value="<%=dto.getNum() %>" />
		  <div>
	         <label for="writer">작성자</label>
	         <input type="text" name="writer" id="writer" value="<%=dto.getWriter() %>"/>
	      </div>
		  <div>
	         <label for="title">제목</label>
	         <input type="text" name="title" id="title" value="<%=dto.getTitle() %>"/>
	      </div>
	      <div>
	         <label for="content">내용</label>
	         <textarea name="content" id="content" ><%=dto.getContent() %></textarea>
	      </div>
	      <button type="submit">수정 확인</button>
	      <button type="reset">취소</button>
		</form>
	</div>
</body>
</html>