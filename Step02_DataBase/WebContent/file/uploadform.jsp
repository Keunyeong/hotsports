<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/uploadform.jsp</title>
</head>
<body>
	<h1>파일 업로드 테스트</h1>
   <form action="upload.jsp" method="post" enctype="multipart/form-data">
      <input type="text" name="comment" placeholder="설명..." />
      <br />
      <input type="file" name="myFile" />
      <br />
      <button type="submit">업로드</button>
   </form>
   	<h1>이미지 업로드 테스트</h1>
   <form action="upload_image.jsp" method="post" enctype="multipart/form-data">
      <input type="text" name="comment" placeholder="설명..." />
      <br />
      <label for="image"> 이미지 선택 </label>
      <input type="file" name="image" accept=".jpg,.JPG,.JPEG,.png,.gif" />
      <br />
      <button type="submit">업로드</button>
   </form>
   <h1>ajax 파일 업로드 테스트</h1>
   <form action="ajax_upload.jsp" id="myForm" method="post" enctype="multipart/form-data">
      <input type="text" name="comment" placeholder="설명..." />
      <br />
      <input type="file" id="myFile" name="myFile" />
      <br />
      <button type="submit">업로드</button>
   </form>
   <script>
   		document.qeurySelector("#myForm").addEventListener("submit",function(){
   			//기본적인 폼의 전송 막
   			e.preventDefault();
   			//입력한 comment 읽어오
   			let comment=document.querySelector("#comment").value;
   			//선택한 파일 객체 얻어오
   			let myFile=document.querySelector("#myFile").files[0];
   			//전송할 FormData 구성하기
   			let data = new FormData();
   			data.append("comment", comment);
   			data.append("myFile",file);
   			
   			fetch("ajax_upload.jsp",{
   				method:"post",
   				body:data
   			})
   			.then(function(response){
   				
   			})
   			.then(function(data){
   				
   			})
   		})
   </script>
</body>
</html>