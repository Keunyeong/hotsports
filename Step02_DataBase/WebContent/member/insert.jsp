<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //1. 폼 전송되는 회원의 이름과 주소를 읽어와서
   request.setCharacterEncoding("utf-8");
   String name=request.getParameter("name");
   String addr=request.getParameter("addr");
   //이름과 주소를 MemberDto 객체에 담는다.
   MemberDto dto=new MemberDto();
   dto.setName(name);
   dto.setAddr(addr);
   //2. DB 에 저장하고
   MemberDao dao=MemberDao.getInstance();
   //작업의 성공여부를 리턴 받는다.
   // dao.insert(dto);
   boolean isSuccess=dao.insert(dto);
   //3. 응답한다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insert.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="container">
   <%if(isSuccess){ %>
      <p>
         <strong><%=name %></strong> 의 정보를 추가 했습니다.
      </p>
      <script>location.href="list.jsp"</script>
   <%}else{ %>
      <p>
         회원정보 추가 실패!
      </p>
      <script>location.href="list.jsp"</script>
   <%} %>
</div>
</body>
</html>
