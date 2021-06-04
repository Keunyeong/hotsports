<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	boolean isValid = false;
	
	if(id.equals("gura")&&pwd.equals("1234")){
		isValid = true;
	}


%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/login.jsp</title>
</head>
<body>
<div class="container pt-5">

   <%if(isValid){ %>
      <div class="alert alert-success">
         <strong><%=id %></strong>님 로그인 되었습니다.
         <a href="<%=request.getContextPath()%>/" class="alert-link">확인</a>
      </div>
   <%}else{ %>
      <div class="alert alert-danger">
         아이디 혹은 비밀번호가 틀려요!
         <a href="<%=request.getContextPath()%>/users/loginform.jsp" class="alert-link">다시 시도</a>
      </div>
   <%} %>
</div>


</body>
</html>