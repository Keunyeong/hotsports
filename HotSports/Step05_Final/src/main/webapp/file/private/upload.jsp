<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //파일을 업로드할 절대 경로를 메소드를 통해서 얻어오기 (WebContent 하위의 upload 폴더)
   String path=request.getServletContext().getRealPath("/upload");
   //경로 확인!   
   System.out.println(path);
   //만일 폴더가 만들어져 있지 않다면 폴더를 만든다.
   File file=new File(path);
   if(!file.exists()){
      file.mkdir();
   }
   // cos.jar 에서 제공해주는 MultiPartRequest 객체 생성하기
   MultipartRequest mr=new MultipartRequest(request, //HttpServletRequest
         path, //파일을 저장할 경로 
         1024*1024*100, //최대 업로드 사이즈 제한
         "utf-8", //한글 파일명 깨지지 않도록 인코딩 설정 
         new DefaultFileRenamePolicy()); //동일한 파일명이 있으면 자동으로 파일명 바꿔서 저장하도록
         
   //MultipartRequest 객체가 성공적으로 생성되면 파일 업로드가 성공된 것이다.
   //전송된 문자열과 파일의 정보는 mr 객체의 메소드를 통해서 얻어낼수 있다. 
   
   // <input type="text" name="comment" /> 에 입력한 문자열 얻어오기
   String title=mr.getParameter("title");
   // <input type="file" name="myFile" /> 을 통해서 업로드된 파일을 access 할수 있는 File 객체
   File myFile=mr.getFile("myFile");
   //파일의 크기 (byte)
   long fileSize=myFile.length();   
   //원본 파일명 
   String orgFileName=mr.getOriginalFileName("myFile");
   /*
      파일 시스템에 저장된 파일명
      - upload 폴더안에 동일한 이름의 파일이 없으면 원본 파일명과 동일하게 저장된다.
      - upload 폴더안에 동일한 이름의 파일이 있으면 파일명 뒤에 1, 2, 3 ... 숫자를 자동으로 부여해서 저장한다.
        ex)  image.jpg  image1.jpg  image2.jpg ...
   */
   String saveFileName=mr.getFilesystemName("myFile");
        
  FileDto dto = new FileDto();
  dto.setWriter((String)session.getAttribute("id"));
  dto.setTitle(title);
  dto.setOrgFileName(orgFileName);
  dto.setSaveFileName(saveFileName);
  dto.setFileSize(fileSize);
  
  boolean isSuccess = FileDao.getInstance().insert(dto);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/upload.jsp</title>
</head>
<body>
<%if(isSuccess){ %>
   <p>업로드 되었습니다.</p>
   <p> title : <strong><%=title %></strong></p>
   <p> fileSize : <strong><%=fileSize %></strong></p>
   <p> orgFileName : <strong><%=orgFileName %></strong></p>
   <p> saveFileName : <strong><%=saveFileName %></strong></p>
   <p> 서버의 파일시스템에서 저장된 실제 경로 : <strong><%=path %></strong></p>
   <a href="../list.jsp">목록보기</a>
   <%}else{ %>
   <p>업로드에 실패하였습니다.</p>
   <a href="../list.jsp">돌아가기</a>
   <%} %>
</body>
</html>
