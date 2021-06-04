<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/ajax/test04.jsp</title>
</head>
<body>
	<h1>폼 테스트</h1>
	<p>form 에 submit 이벤트가 일어 났을때 폼 전송을 막고 폼에 입력한 문자열을 읽어와서 ajax 전송해보기</p>
	<form action="add.jsp" method="get" id="myForm">
		<input type="text" name="name" placeholder="이름입력..." />
		<input type="text" name="addr" placeholder="주소입력..." />
		<button type="submit"> 전송</button>
	</form>
	<script>
		document.querySelector("#myForm").addEventListener("submit",function(e){
			e.preventDefult(this);
			//this 는 이벤트가 일어난 바로 그 요소
			// 폼에 입력한 내용을 query string 형식으로 얻어내기
			const formData=new FormData(this);
			const queryString = new URLSearchParams(formData).toString();
			console.log(queryString);
		});
	
	</script>
</body>
</html>
