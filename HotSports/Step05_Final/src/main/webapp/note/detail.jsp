<%@page import="test.note.dao.NoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="test.note.dto.NoteDto"></jsp:useBean>
<%
   int num=Integer.parseInt(request.getParameter("num"));

   dto = NoteDao.getInstance().getData(num);
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/note/detail.jsp</title>
</head>
<body>
<div class="container">
   <table>
      <tr>
         <th>글번호</th>
         <td><%=num %></td>
      </tr>
      <tr>
         <th>작성자</th>
         <td><%=dto.getWriter() %></td>
      </tr>
      <tr>
         <th>카테고리</th>
         <td><%=dto.getCategorize() %></td>
      </tr>
      <tr>
         <th>제목</th>
         <td><%=dto.getTitle() %></td>
      </tr>
      <tr>
         <th>조회수</th>
         <td><%=dto.getViewCount() %></td>
      </tr>
      <tr>
         <th>등록일</th>
         <td><%=dto.getRegdate() %></td>
      </tr>
      <tr>
         <td colspan="2"><textarea><%=dto.getContent() %></textarea></td>
      </tr>
   </table>
   <ul>
		<li><a href="list.jsp">목록보기</a></li>
		<%if(((String)session.getAttribute("id")).equals(dto.getWriter())){ %>
		<li><a href="private/updateform.jsp?num=<%=dto.getNum()%>">수정</a></li>
		<li><a href="private/delete.jsp?num=<%=dto.getNum()%>">삭제</a></li>
		<%} %>
   </ul>
</div>
</body>
</html>