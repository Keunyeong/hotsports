<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test05.jsp</title>
</head>
<body>
	<script>
		console.log("Promise 시작");
	    
	    new Promise(function(resolve, reject){
	       let obj={num:1,name:"김구라"};
	       //2. 작업이 실패이거나 작업을 중지하고자 한다면 두번째 인자로 전달된 함수를 호출하면 된다.
	       resolve(obj);
	       
	    }).then(function(a){
	       console.log("then 안에 있는 함수가 호출되었습니다.");
	       console.log(a);
	    }).catch(function(){
	       //3. reject 함수를 호출하면 실행순서가 여기로 들어온다. 
	       console.log("catch 안에 있는 함수가 호출되었습니다.");
	    });
	    console.log("Promise 시작후 다른 작업을 합니다.");
	</script>
</body>
</html>