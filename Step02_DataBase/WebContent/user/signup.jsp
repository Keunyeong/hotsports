<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   //한글 깨지지 않도록
   request.setCharacterEncoding("utf-8");
   // <input type="text" name="nick" />  에 입력한 문자열 읽어오기
   String nick=request.getParameter("nick");
   /*
      <label>
         <input type="radio" name="email" value="yes" checked/> 네
      </label>
      <label>
         <input type="radio" name="email" value="no" /> 아니요
      </label> 
   */
   String email=request.getParameter("email"); 
   /*
     <select name="concern">
         <option value="">선택</option>
         <option value="game">게임</option>
         <option value="movie">영화</option>
         <option value="etc">기타</option>
      </select>
   */
   String concern=request.getParameter("concern");
   /*
      <label>
         <input type="checkbox" name="language" value="Java"/> 자바
      </label>
      <label>
         <input type="checkbox" name="language" value="Python"/> 파이선
      </label>
      <label>
         <input type="checkbox" name="language" value="C++"/> C++
      </label>
   */
   String[] language=request.getParameterValues("language");
   
   
   /*
      <textarea name="comment" cols="30" rows="10"></textarea>
   */
   String comment=request.getParameter("comment");
   
   String data="";
   if(language != null){
      for(String tmp: language){
         data = data+tmp+"/";
      }   
   }

   
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/signup.jsp</title>
</head>
<body>
	  <div class="container">
      닉네임 <input type="text" name="nick" value="<%=nick %>"/><br/>
      이메일 수신 여부
      <label>
      	 <%if(email.equals("yes")){%>
         <input type="radio" name="email" value="yes" checked/> 네
         <%}else{ %>
         <input type="radio" name="email" value="yes" /> 네
         <%} %>
      </label>
      <label>
         <%if(email.equals("no")){%>
         <input type="radio" name="email" value="no" checked/> 아니오
         <%}else{ %>
         <input type="radio" name="email" value="no" /> 아니오
         <%} %>
      </label>
      <br/>
      관심사 
      <select name="concern">
         <option value="">선택</option>
         <%if(concern.equals("game")){ %>
         <option value="game" selected>게임</option>
         <%}else{ %>
         <option value="game" >게임</option>
         <%} %>
         <%if(concern.equals("movie")){ %>
         <option value="movie" selected>영화</option>
         <%}else{ %>
         <option value="movie">영화</option>
         <%} %>
         <option value="etc" <%if(concern.equals("etc")){%>selected<%} %>>기타</option>
      </select>
      <br/>
      배우고 싶은 언어 체크
      <label>
      <%if(Arrays.asList(language).contains("Java")){ %>
        <input type="checkbox" name="language" value="Java" checked/> 자바
      <%}else{ %>
      	<input type="checkbox" name="language" value="Java" /> 자바
      <%} %>
      </label>
      <label>
      <%if(Arrays.asList(language).contains("Python")){ %>
         <input type="checkbox" name="language" value="Python" checked/> 파이선
      <%}else{ %>
         <input type="checkbox" name="language" value="Python" /> 파이선
      <%} %>
      </label>
      <label>
      <%if(Arrays.asList(language).contains("C++")){ %>
         <input type="checkbox" name="language" value="C++"checked/> C++
      <%}else{ %>
       	 <input type="checkbox" name="language" value="C++"/> C++
      <%} %>
      </label>
      <div class="mb-3">
		      <label for="exampleFormControlTextarea1" class="form-label">남기고 싶은말 </label>
		      <textarea class="form-control" id="exampleFormControlTextarea1" name="comment" cols="30" rows="10"><%=comment %></textarea>
	      </div>
      <p>가입을 축하합니다~!</p>
   </div>
</body>
</html>