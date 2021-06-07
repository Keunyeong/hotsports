<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test07.jsp</title>
</head>
<body>
	<script>
		console.log("Promise 시작");
	    
	    new Promise(function(resolve, reject){
	    	console.log("1단계 수행함");
	        let isGo=confirm("다음단계로 넘어갈까요?");
	        if(isGo){
	        	resolve();
	        }else{
	        	reject();
	        }
	    }).then(function(a){
	    	console.log("2단계 수행함");
	    	return new Promise(function(resolve,reject){
	    		let isGo=confirm("다음단계로 넘어갈까요?");
		        if(isGo){
		        	resolve();
		        }else{
		        	reject();
		        }	
	    	})
	    }).then(function(a){
	    	console.log("3단계 수행함")	
	    }).catch(function(){
	       //3. reject 함수를 호출하면 실행순서가 여기로 들어온다. 
	       console.log("작업이 종료 되었습니다.");
	    });
	    console.log("Promise 시작후 다른 작업을 합니다.");
	</script>
</body>
</html>