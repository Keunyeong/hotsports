<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_vue/hello.jsp</title>
</head>
<body>
	<div id="one">
		<input type="text" id="inputMsg" placeholder="메세지 입력..." />
		<p id="result"></p>
	</div>
	<div id="two">
		<input v-model="msg" type="text" placeholder="메세지 입력..." />
		<p >{{msg}}</p>
		<button v-on:click="reverseMessage">뒤집기</button>
		<ul>
			<li v-for="tmp in friends">
				{{tmp}}
			</li>
		</ul>
	</div>
	<div id="app-3">
	  <p v-if="seen">이제 나를 볼 수 있어요</p>
	</div>
	
	<div id="app-2">
	  <span v-bind:title="message">
	    내 위에 잠시 마우스를 올리면 동적으로 바인딩 된 title을 볼 수 있습니다!
	  </span>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script>
	document.querySelector("#inputMsg").addEventListener("input",function(){
		let msg = this.value;
		document.querySelector("#result").innerText = msg;
	});
	
	let app = new Vue({
		el:"#two",
		data:{
			msg:"",
			friends:["김구라","해골","원숭이"]
		},
		methods:{
			reverseMessage:function(){
				this.msg = this.msg.split('').reverse().join('')
			}
		}
	});
	var app3 = new Vue({
		  el: '#app-3',
		  data: {
		    seen: true
		  }
		})
	var app2 = new Vue({
		  el: '#app-2',
		  data: {
		    message: '이 페이지는 ' + new Date() + ' 에 로드 되었습니다'
		  }
		})
</script>
</body>
</html>