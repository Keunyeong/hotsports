<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	String id=request.getParameter("id");
	/*   
	    DB 에 저장된 내용과 비교해서 맞는 정보인지 확인한다.
	    유효한 정보이면 로그인 처리를 한다.
	    로그인 처리라는 것은 로그인된 아이디를 session 영역에 담으면 된다.
	    session 영역에 담는다는 것은 HttpSession 객체의 .setAttribute() 메소드를 이용해서 담는것이다.
	    그렇다면 HttpSession 객체의 참조값은 어떻게 얻어올까?
	    HttpSession 객체의 참조값은 HttpServletRequest 객체의 .getSession() 메소드를 이용해서
	    얻어오면 된다.
	*/
	
	// 세션 객체의 참조값을 얻어와서
	
	// "id" 라는 키값으로 String type(로그인된 아이디) 을 담는다.
	session.setAttribute("id",id);
	// 응답하기
	response.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과 페이</title>
</head>
<body>
	<p><%=id %> 님이 로그인 되었습니다.</p>
	<a href='../index.jsp'>인덱스로 가기</a>
</body>
</html>