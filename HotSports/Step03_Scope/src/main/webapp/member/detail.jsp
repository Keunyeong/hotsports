<%@page import="test.servlet.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	MemberDto dto = (MemberDto)request.getAttribute("dto");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/detail.jsp</title>
</head>
<body>
	<h1>member/detail</h1>
	<table>
      <thead>
         <tr>
            <th>번호</th>
            <th>이름</th>
            <th>주소</th>
         </tr>
      </thead>
      <tbody>
         <tr>
            <td><%=dto.getNum() %></td>
            <td><%=dto.getName() %></td>
            <td><%=dto.getAddr() %></td>
         </tr>
      </tbody>
   </table>
</body>
</html>