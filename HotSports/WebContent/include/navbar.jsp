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
    	<img src="<%=request.getContextPath()%>/images2/fire.png" alt="" width="34" height="34" > HotSports
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
      
      	<a class="nav-link <%=thisPage.equals("News")?"active":"" %>" href="<%=request.getContextPath()%>/News.jsp">News</a>
        <a class="nav-link <%=thisPage.equals("VOD")?"active":"" %>" href="<%=request.getContextPath()%>/VOD.jsp">VOD</a>
        <a class="nav-link <%=thisPage.equals("OnlineStore")?"active":"" %>" href="<%=request.getContextPath()%>/OnlineStore.jsp">OnlineStore</a>
        <a class="nav-link <%=thisPage.equals("OfflineStore")?"active":"" %>" href="<%=request.getContextPath()%>/OfflineStore.jsp">OfflineStore</a>
        <a class="nav-link <%=thisPage.equals("Team")?"active":"" %>" href="<%=request.getContextPath()%>/member/list.jsp">Team</a>
      	
      </div>
    </div>
  </div>
</nav>
