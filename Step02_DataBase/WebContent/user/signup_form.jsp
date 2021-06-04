<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/signup_form.jsp</title>
<style>
	form{
		padding-top:10px;
	}
</style>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../include/navbar.jsp"></jsp:include>
	<div class="container">
		<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
		    <ol class="breadcrumb my-2">
		       <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>">Home</a></li>
		       <li class="breadcrumb-item active" aria-current="page">회원가입</li>
		    </ol>
		</nav>
		
		  <form action="signup.jsp" method="post">
			  <div class="input-group input-group-sm mb-3">
				  <span class="input-group-text" id="inputGroup-sizing-sm">닉네임</span>
				  <input type="text" name="nick" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
			  </div>
		      <span class="input-group-text my-2">이메일 수신 여부</span> 
		      <label>
		         <input type="radio" name="email" value="yes" checked/> 네
		      </label>
		      <label class="mx-2">
		         <input type="radio" name="email" value="no" /> 아니요
		      </label>
		      <br/>
		      <span class="input-group-text my-2">관심사</span> 
		      <select class="form-select" aria-label="Default select example" name="concern">
		         <option selected>선택</option>
		         <option value="game">게임</option>
		         <option value="movie">영화</option>
		         <option value="etc">기타</option>
		      </select>
		      <span class="input-group-text my-2">배우고 싶은 언어 체크</span>
		      <span>
			      <label>
			         <input type="checkbox" name="language" value="Java" class="form-check-input"/> 자바
			      </label>
		      </span>
		      <span>
			      <label>
			         <input type="checkbox" name="language" value="Python" class="form-check-input"/> 파이선
			      </label>
		      </span>
		      <span>
			      <label>
			         <input type="checkbox" name="language" value="C++" class="form-check-input"/> C++
			      </label>
		      </span>
		      
		      <div class="mb-3">
		      
			      <label for="exampleFormControlTextarea1" class="form-label my-2"><span class="input-group-text">남기고 싶은 말</span> </label><br />
			      <textarea class="form-control" id="exampleFormControlTextarea1" name="comment" cols="30" rows="10"></textarea>
		      </div>
		      <button type="submit" class="btn btn-dark">가입</button>
	   	 </form>
   	  </div>
</body>
</html>