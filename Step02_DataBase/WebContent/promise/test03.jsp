<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test03.jsp</title>
</head>
<body>
	<script>
		new Promise(function(resolve){
			console.log("resolve는 function type 이다.")
			console.log(resolve);
			resolove();
		}).then(function(){
			console.log("then 안에 있는 함수가 호출되었습니다.")
		})
	</script>
</body>
</html>