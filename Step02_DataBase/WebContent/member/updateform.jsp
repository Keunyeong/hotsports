<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 1. 요청 파라미터로 전달되는 수정할 회원의 번호를 읽어 온다.
	int num = Integer.parseInt(request.getParameter("num"));
// 2. 번호에 해당하는 회원의 정보를 얻어온다.( MemberDto )
	MemberDto dto = new MemberDto();
	MemberDao dao = MemberDao.getInstance();
	dto = dao.getData(num);
// 3. 수정할 양식(form) 을 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/ubdateform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../include/navbar.jsp"></jsp:include>
	<div class="container">
		<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
			    <ol class="breadcrumb">
			       <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>">Home</a></li>
			       <li class="breadcrumb-item "><a href="<%=request.getContextPath()%>/member/list.jsp">Member List</a></li>
			       <li class="breadcrumb-item active" aria-current="page">Member Update</li>
			    </ol>
		</nav>
		<div >
			<form action="update.jsp">
			<!-- 수정할때 -->
			<input type="hidden" name = "num" value="<%=dto.getNum() %>" />
				<div class="mb-3">
					<label for="num" class="form-label">번호</label>
					<%--input 요소에 disabled 속성을 추가하면 --%>
					<input type="text" class="form-control" name="num" id = "num" value = "<%=dto.getNum() %>" disabled />
				</div>
				<div class="mb-3">
					<label for="name" class="form-label">이름</label>
					<input type="text" class="form-control" name="name" id = "name" value = "<%=dto.getName() %>" />
				</div>
				<div class="mb-3">
					<label for="addr" class="form-label">주소</label>
					<input type="text" class="form-control" name="addr" id = "addr" value ="<%=dto.getAddr() %>" />
				</div>
				<button class="btn btn-primary" type = "submit">수정</button>
				<button class="btn btn-primary" type = "reset">취소</button>
			</form>
		</div>
	</div>
</body>
</html>