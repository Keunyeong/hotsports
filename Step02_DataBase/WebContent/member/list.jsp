<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=5;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=5;
	
	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	int pageNum=1;
	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum=request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어 온다면
	if(strPageNum != null){
	   //숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
	   pageNum=Integer.parseInt(strPageNum);
	}
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	MemberDto dto=new MemberDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
   //하단 시작 페이지 번호 
   int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
   //하단 끝 페이지 번호
   int endPageNum =startPageNum+PAGE_DISPLAY_COUNT-1;
	
   //MemberDao 객체의 참조값 얻어와서 
   MemberDao dao=MemberDao.getInstance();
   //회원목록 얻어오기 
   List<MemberDto> list=dao.getList(dto);
   
   //전체 row 의 갯수
   int totalRow=dao.getCount();
   //전체 페이지의 갯수
   int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
   
   if(endPageNum > totalPageCount){
	   endPageNum = totalPageCount;
   }
   
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--
	include 되는 jsp 페이지에 파라미터를 전달할 수 있다.
	"thisPage" 라는 파라미터 명으로 "member" 라는 문자열을 navbar.jsp 에 요청 파라미터로 전달
	navbar.jsp?thisPage=member
	가 요청되는 효과와 비슷하다.
 --%>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	.page-ui a{
		text-decoration:none;
		color: #000;
		align:center;
	}
	.page-ui a.hover{
		text-decoration:underline;
	}
	.page-ui a.active{
		color:red;
		font-weight:bold;
		font-size:1.5rem;
	}
	#navb{
		align-items:center;
	}
</style>
</head>
<body>
	<jsp:include page="../include/navbar.jsp">
		<jsp:param value="member" name="thisPage"/>
	</jsp:include>
	<div class= "container">
		<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
		    <ol class="breadcrumb">
		       <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>">Home</a></li>
		       <li class="breadcrumb-item active" aria-current="page">Member List</li>
		    </ol>
		</nav>
		<%-- 
		<a href="insertform.jsp">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
			    <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
			    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
			</svg>
		</a>
		--%>
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
		    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
			    <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
			    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
			</svg>
		</button>
		
		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">회원정보 추가하기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form action="insert.jsp" method="post">
					<div class="mb-3">
						<label for="name" class="form-label">이름</label>
						<input type="text" class="form-control" name="name" id="name" />
					</div>
					<div class="mb-3">
						<label for="addr" class="form-label">주소</label>
						<input type="text" class="form-control" name="addr" id="addr" />
					</div>
					<button class="btn btn-primary" type="submit">추가</button>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%for(int i=0; i<list.size();i++){ 
					MemberDto tmp=list.get(i);
					int num = tmp.getNum();
					String name = tmp.getName();
					String addr = tmp.getAddr();
					%>
					<tr>
						<td><%=num %></td>
						<td><%=name %></td>
						<td><%=addr %></td>
						<td>
							<button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#<%=name %>">
							    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
									<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
								</svg>
							</button>
							
							<!-- Modal -->
							<div class="modal fade" id="<%=name %>"  data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="staticBackdropLabel">회원정보 수정하기</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							      	
							        <form action="update.jsp">
							  		<!-- 수정할때 -->
										<input type="hidden" name = "num" value="<%=num %>" />
										<div class="mb-3">
											<label for="num" class="form-label">번호</label>
											<%--input 요소에 disabled 속성을 추가하면 --%>
											<input type="text" class="form-control" name="num" id = "num" value = "<%=num %>" disabled />
										</div>
										<div class="mb-3">
											<label for="name" class="form-label">이름</label>
											<input type="text" class="form-control" name="name" id = "name" value = "<%=name %>" />
										</div>
										<div class="mb-3">
											<label for="addr" class="form-label">주소</label>
											<input type="text" class="form-control" name="addr" id = "addr" value ="<%=addr %>" />
										</div>
										<button class="btn btn-primary" type = "submit">수정</button>
										<button class="btn btn-primary" type = "reset">취소</button>
									</form>
							      </div>
							    </div>
							  </div>
						   </div>
						</td>
						<td>
							<a href="delete.jsp?num=<%=num %>">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
								    <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
								</svg>
							</a>
						</td>
					</tr>
				<%} %>
			</tbody>
		</table>
		<div class="d-flex justify-content-center align-items-center">
		<nav  aria-label="Page navigation example" >
		  <ul class="pagination">
		  	<%if(startPageNum != 1){ %>
		    	<li class="page-item"><a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1 %>">Previous</a></li>
		    <%} %>
		    <%for(int i=startPageNum; i<=endPageNum ; i++){ %>
		    	<%if(pageNum == i){ %>
		    	<li class="page-item"><a class="page-link" href="list.jsp?pageNum=<%=i %>""><%=i %></a></li>
		    	<%}else{ %>
		   		<li class="page-item"><a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a></li>
		   		<%} %>
		   	<%} %>
		   	<%if(endPageNum!=totalPageCount){%>
		   	 <li class="page-item"><a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1 %>">Next</a></li>
		    <%} %>
		  </ul>
		</nav>
		</div>
	</div>
</body>
</html>


