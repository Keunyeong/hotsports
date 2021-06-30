<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>여름 맞이 Big Sale</h1>
	<p>
		<img src="imges/kim1.png" alt="" />
		김구라와의 점심 식사 셋트를 단돈 10,000원에 판매 합니다.
		<a href="#">구매하기</a>
	</p>
	<form action="nopopup.jsp" method="post">
		<label>
			<input type="checkbox" name="isPopup" value="no"/>
				1분 동안 팝업 띄우지 않기
		</label>
		<button type="submit">닫기</button>
	</form>
</body>
</html>