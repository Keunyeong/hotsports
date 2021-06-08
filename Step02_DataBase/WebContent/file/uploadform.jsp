<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/uploadform.jsp</title>
</head>
<body>
   <form action="upload.jsp" method="post" enctype="multipart/form-data">
      <input type="text" name="comment" placeholder="설명..." />
      <br />
      <input type="file" name="myFile" />
      <br />
      <button type="submit">업로드</button>
   </form>
</body>
</html>