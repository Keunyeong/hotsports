<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_updateform.jsp</title>
<style>
   .invalid-feedback{
      display: none;
   }
</style>
</head>
<body>
<div class="container">
	<h1>비밀번호 수정 폼 입니다</h1>
	<form action="pwd_update.jsp" method="post" id="myForm">
		<div>
			<label for="pwd">기존 비밀번호</label>
			<input type="text" name="pwd" id="pwd" />
		</div>
		<div>
			<label for="newPwd">새 비밀번호</label>
			<input type="text" name="newPwd" id="newPwd" />
			<small>문자 또는 숫자를 사용해 5~10 문자로 만들어 주세요.</small>
			<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
		</div>
		<div>
			<label for="newPwd2">새 비밀번호 확인</label>
			<input type="text" id="newPwd2" />
		</div>
		<button type="submit">수정하기</button>
		<button type="reset">리셋</button>
	</form>
</div>
<script>
	
	function checkPwd(){
	    const pwd=document.querySelector("#newPwd").value;
	    const pwd2=document.querySelector("#newPwd2").value;
	    
	    // 최소5글자 최대 10글자인지를 검증할 정규표현식
	    const reg_pwd=/^.{5,10}$/;
	    if(!reg_pwd.test(pwd)){
	       isPwdValid=false;
	       return; //함수를 여기서 종료
	    }
	    
	    if(pwd != pwd2){//비밀번호와 비밀번호 확인란이 다르면
	       //비밀번호를 잘못 입력한것이다.
	       document.querySelector(".invalid-feedback").style.display="block";
	       isPwdValid=false;
	    }else{
	       document.querySelector(".invalid-feedback").style.display="none";
	       isPwdValid=true;
	    }
	 }
	   document.querySelector("#newPwd").addEventListener("input", checkPwd);
	   document.querySelector("#newPwd2").addEventListener("input", checkPwd);
</script>
</body>
</html>