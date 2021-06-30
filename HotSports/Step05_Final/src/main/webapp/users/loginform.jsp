<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // GET 방식 파라미터 url 이라는 이름으로 전달되는 값이 있는지 읽어와 본다.
   String url=request.getParameter("url");
   //만일 넘어오는 값이 없다면
   if(url==null){
      //로그인 후에 index.jsp 페이지로 갈수 있도록 절대 경로를 구성한다.
      String cPath=request.getContextPath();
      url=cPath+"/index.jsp";
   }
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<style>
	form{
	
	}
</style>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container" >
<jsp:include page="../include/navbar.jsp"></jsp:include>
   <div style="margin:auto; text-align:center; margin-top:100px;">
   <form action="login.jsp" method="post" style="display:inline-block;">
   	  <input type="hidden" name="url" value="<%=url %>" />
	  <div class="row mb-3">
	    <label for="id" class="col-sm-5 col-form-label">ID</label>
	    <div class="col-sm-7">
	      <input type="text" class="form-control" name="id" id="id">
	    </div>
	  </div>
	  
	  <div class="row mb-3">
	    <label for="pwd" class="col-sm-5 col-form-label">Password</label>
	    <div class="col-sm-7">
	      <input type="password" class="form-control" name="pwd" id="pwd">
	    </div>
	  </div>
	  <div style="margin-top:30px;">
	  <button type="submit" class="col-sm-5 me-2 btn btn-primary">LOGIN</button>
	  </div>
	</form> 
	</div>
</div>
</body>
</html>