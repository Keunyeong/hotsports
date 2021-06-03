<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String thisPage = request.getParameter("thisPage");
	if(thisPage==null){
		// 빈 문자열을 대입한다.
		thisPage="";
	}
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">
    	<img src="https://getbootstrap.com/docs/5.0/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24"> Monkeystrap
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
      
      	<a class="nav-link <%=thisPage.equals("member")?"active":"" %>" href="<%=request.getContextPath()%>/member/list.jsp">Member</a>
        <a class="nav-link <%=thisPage.equals("todo")?"active":"" %>" href="<%=request.getContextPath()%>/todo/list.jsp">Todo</a>
      	
<%--        	
		<%if (thisPage.equals("")){ %>
      	<a class="nav-link" href="<%=request.getContextPath()%>/member/list.jsp">Member</a>
        <a class="nav-link" href="<%=request.getContextPath()%>/todo/list.jsp">Todo</a>
      	<%}else if (thisPage.equals("member")){ %>
      	<a class="nav-link active" href="<%=request.getContextPath()%>/member/list.jsp">Member</a>
        <a class="nav-link" href="<%=request.getContextPath()%>/todo/list.jsp">Todo</a>
      	<%}else if(thisPage.equals("todo")){ %>
      	<a class="nav-link" href="<%=request.getContextPath()%>/member/list.jsp">Member</a>
        <a class="nav-link active" href="<%=request.getContextPath()%>/todo/list.jsp">Todo</a>
      	<%} %>
--%>
      </div>
    </div>
  </div>
</nav>
