<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/ajax/test03.jsp</title>
</head>
<body>
	<input type="text" id="inputName" placeholder="이름입력..."/>
	<input type="text" id="inputAddr" placeholder="주소입력..."/>
	<button id="sendBtn">전송</button>
	<script>
		/*
			1.전송버튼을 누르면 입력한 이름과 주소를 읽어와서
         	2.add.jsp 페이지에 ajax 전송하고
         	3.add.jsp 페이지에서는 전송된 내용을 콘솔에 출력하고
         	4.added! 라는 문자열을 add.jsp 페이지에서 응답하는 프로그래밍을 해보세요! 
		*/
		
		document.querySelector("#sendBtn").addEventListener("click",function(){
			let name=document.querySelector("#inputName").value;
			let addr=document.querySelector("#inputAddr").value;
			
			fetch("add.jsp?name="+name+"&addr="+addr)
			.then(function(response){
				return response.text();
			})
			.then(function(data){
				let p=document.createElement("p");
				p.innerText=data;
				document.querySelector("body").append(p);
			});
		});
	</script>
</body>
</html>