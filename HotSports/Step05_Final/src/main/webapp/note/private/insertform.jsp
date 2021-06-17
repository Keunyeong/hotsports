<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/note/private/insertform.jsp</title>
</head>
<body>
	<div class="container">
   <h1>새글 작성 폼</h1>
   <form action="insert.jsp" method="post">
      
      <select class="form-select" name="categorize" aria-label="Default select example">
		  <option selected>프로그래밍 언어</option>
		  <option value="Java">Java</option>
		  <option value="Javascript">Javascript</option>
		  <option value="Html">Html</option>
		  <option value="Css">Css</option>
	  </select>
	  <div>
         <label for="title">제목</label>
         <input type="text" name="title" id="title"/>
      </div>
      <div>
         <label for="content">내용</label>
         <textarea name="content" id="content"></textarea>
      </div>
      <button type="submit">저장</button>
   </form>
</div>
</body>
</html>