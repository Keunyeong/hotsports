<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 세션 영역에 id 라는 키값으로 저장된 문자열 읽어오기 (null 이 아니면 로그인 된것이다.)
	String id=(String)request.getSession().getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<div class="container">
	<h1>인덱스 페이지 입니다.</h1>
		<%if(id!=null){ %>
		<p>
			<a href="users/private/info.jsp"><%=id %></a>님이 로그인 중...
			<a href="users/logout.jsp">로그아웃</a>
			<!--session 영역에 있는 로그인 정보를 삭제  -->
		</p>
		<%}else{ %>
		<ul>
			<li>
				<a href="<%=request.getContextPath()%>/users/signup_form.jsp">회원가입</a>
			</li>
			<li>
				<a href="<%=request.getContextPath()%>/users/loginform.jsp">로그인</a>
			</li>
		</ul>
		<%} %>
		<ul>
			<li>
				<a href="<%=request.getContextPath()%>/cafe/list.jsp">카페 글 목록 보기</a>
			</li>
						<li>
				<a href="<%=request.getContextPath()%>/note/list.jsp">개발자 노 글 목록 보기</a>
			</li>
		</ul>
		
	</div>
</body>
</html>