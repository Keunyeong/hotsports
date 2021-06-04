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
<button id="requestBtn2">요청하기2</button>
<button id="requestBtn3">요청하기3</button>
<button id="requestBtn4">요청하기4</button>
<button id="requestBtn5">요청하기5</button>
<div id="result">
	

</div>

<script>
   document.querySelector("#requestBtn").addEventListener("click", function(){
      fetch("get_data.jsp")
      .then(function(response){
         //response 는 응답객체이다 
         console.log(response);
         //응답객체의 text() 함수를 호출해서 리턴되는 Promise 객체를 리턴해준다.
         return response.text();
      })
      .then(function(data){
         //data 는 서버가 응답한 문자열이다. 
         console.log(data);
      });
   });
   document.querySelector("#requestBtn2").addEventListener("click", function(){
      fetch("get_data2.jsp")
      .then(function(response){
         //response 는 응답객체이다 
         console.log(response);
         //응답객체의 text() 함수를 호출해서 리턴되는 Promise 객체를 리턴해준다.
         return response.text();
      })
      .then(function(data){
         //data 는 서버가 응답한 문자열이다. 
         console.log(data);
         document.querySelector("#result").innerHTML=data;
      });
   });
   
   document.querySelector("#requestBtn3").addEventListener("click", function(){
	      fetch("get_data3.jsp")
	      .then(function(response){
	         //response 는 응답객체이다 
	         console.log(response);
	         //응답객체의 text() 함수를 호출해서 리턴되는 Promise 객체를 리턴해준다.
	         return response.text();
	      })
	      .then(function(data){
	         //data 는 서버가 응답한 문자열이다. 
	         console.log(data);
	         let obj=JSON.parse(data);
	         let p1=document.createElement("p");
	         p1.innerText="번호:"+obj.num+" 이름:"+obj.name+" 남자여부:"+obj.isMan;
	         document.querySelector("#result").append(p1);
	      });
   });
   document.querySelector("#requestBtn4").addEventListener("click", function(){
	      fetch("get_data3.jsp")
	      .then(function(response){
	         //response 는 응답객체이다 
	         console.log(response);
	         //응답객체의 text() 함수를 호출해서 리턴되는 Promise 객체를 리턴해준다.
	         return response.json();
	      })
	      .then(function(data){
	         //data 는 object 이다. 
	         console.log(data);
	         let p1=document.createElement("p");
	         p1.innerText="번호:"+data.num+" 이름:"+data.name+" 남자여부:"+data.isMan;
	         document.querySelector("#result").append(p1);
	      });
	});
   document.querySelector("#requestBtn5").addEventListener("click", function(){
	      fetch("animals.jsp")
	      .then(function(response){
	         //response 는 응답객체이다 
	         console.log(response);
	         //응답객체의 text() 함수를 호출해서 리턴되는 Promise 객체를 리턴해준다.
	         return response.json();
	      })
	      .then(function(data){
	         //data 는 array 이다. 
	         console.log(data);
	         let ul = document.createElement("ul");
	         ul.setAttribute("id","ul");
		     document.querySelector("#result").append(ul);
	         for (let i=0;i<data.length;i++){ 
	        	 let li = document.createElement("li");
	        	 li.innerText= data[i];
	        	 document.querySelector("#ul").append(li);
	        	};
	      });
	});
   
</script>   
</body>
</html>