<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //자세히 보여줄 글번호를 읽어온다. 
   int num=Integer.parseInt(request.getParameter("num"));
   //글하나의 정보를 DB 에서 불러온다. 
   CafeDto dto = new CafeDto();
   CafeDao.getInstance().addViewCount(num);
   dto = CafeDao.getInstance().getData(num);
   //글정보를 응답한다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
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
