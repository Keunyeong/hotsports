<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
       String id=(String)request.getSession().getAttribute("id");
       // thisPage 라는 파라미터명으로 전달되는 문자열을 얻어와 본다. 
       // null or "member" or "todo"
       String thisPage=request.getParameter("thisPage");
       // thisPage 가 null 이면 index.jsp 페이지에 포함된 것이다. 
       //System.out.println(thisPage);
       //만일 null 이면 
       if(thisPage==null){
          //빈 문자열을 대입한다. (NullPointerException 방지용)
          thisPage="";
       }
    %>
   <nav class="navbar navbar-light bg-light navbar-expand-lg">
      <div class="container-fluid">
          <a class="navbar-brand" href="<%=request.getContextPath() %>/">
               <img src="https://getbootstrap.com/docs/5.0/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="d-inline-block align-text-top">
               MonkeyStrap
          </a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
             data-bs-target="#navbarNav">
               <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
               <ul class="navbar-nav flex-glow-1">
                 <li class="nav-item">
                      <a class="nav-link <%=thisPage.equals("cafe") ? "active" : "" %>" href="<%=request.getContextPath()%>/cafe/list.jsp">cafe</a>
                 </li>
                 <li class="nav-item">
                      
                      <a class="nav-link <%=thisPage.equals("file") ? "active" : "" %>" href="<%=request.getContextPath()%>/file/list.jsp">file</a>
                 </li>
                 <li class="nav-item">
                      <a class="nav-link <%=thisPage.equals("note") ? "active" : "" %>" href="<%=request.getContextPath()%>/note/list.jsp">note</a>
                 </li>
               </ul>
               <%if(id!=null){ %>
               <div class="w-100 clearfix">
                <a class="btn btn-danger btn-sm float-end" href="<%=request.getContextPath() %>/users/logout.jsp">로그아웃</a>
               	<a class="btn btn-success btn-sm float-end ms-1" href="<%=request.getContextPath() %>/users/private/info.jsp"><%=id %>님이 로그인 중...</a>
				
               </div>
               <%}else{ %>
               <div class="w-100 clearfix">
                  <a class="btn btn-danger btn-sm float-end ms-1" href="<%=request.getContextPath() %>/users/signup_form.jsp">회원가입</a>
                  <a class="btn btn-success btn-sm float-end" href="<%=request.getContextPath() %>/users/loginform.jsp">로그인</a>
               </div>
               <%} %>
          </div>
      </div>
   </nav>
