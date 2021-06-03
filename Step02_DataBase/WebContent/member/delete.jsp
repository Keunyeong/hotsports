<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //1. ?num=x : num 이라는 파라미터명으로 전달되는 문자열을 읽어와서 숫자로 바꾼다.
   int num = Integer.parseInt(request.getParameter("num"));
   //dto 생성
   MemberDto dto = new MemberDto();
   dto.setNum(num);
   System.out.println(num + " 번의 회원의 정보를 삭제합니다.");
   
   MemberDao dao = MemberDao.getInstance();
   boolean isSuccess = dao.delete(dto);
   
   //2. 응답한다.
%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title>/member/delete.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>

<body>
	<div class="container">
	<jsp:include page="../include/navbar.jsp"></jsp:include>
   <%if(isSuccess){%>
        <p>
           <strong><%=num %> 의 정보를 삭제했습니다.</strong>
        </p>
        <script>location.href="list.jsp"</script>
   <%}else{%>
        <p>
           <strong>삭제 실패!</strong>
        </p>
        <script>location.href="list.jsp"</script>
   <%}%>
   		<p>
            <a href="/Step02_DataBase/member/list.jsp">회원목록으로</a>
        </p>
     </div>
</body>

</html>