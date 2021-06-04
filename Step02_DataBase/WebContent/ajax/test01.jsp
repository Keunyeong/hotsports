<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/ajax/test01.jsp</title>
</head>
<body>
<button id="requestBtn">요청하기</button>
	<script>
	document.querySelector("#requestBtn").addEventListener("click",function(){
		fetch("../index.jsp")
		.then(function(response){
			return response.text();
		})
		.then(function(data){
			console.log(data);
		});
	});
	
	</script>
	
</body>
</html>