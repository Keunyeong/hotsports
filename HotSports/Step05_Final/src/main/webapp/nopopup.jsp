<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String isPopup=request.getParameter("isPopup");

	if(isPopup!=null){
		//팝업을 일정시간 띄우지 않겠다.
		Cookie cook = new Cookie("isPopup", isPopup);
		cook.setMaxAge(60);//초단위
		//응답할때 쿠키도 같이 응답한다.
		response.addCookie(cook);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nopopup.jsp</title>
</head>
<body>
<script>
	self.close();
</script>
</body>
</html>