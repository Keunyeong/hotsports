<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   //MemberDao 객체의 참조값 얻어와서 
   MemberDao dao=MemberDao.getInstance();
   //회원목록 얻어오기 
   List<MemberDto> list=dao.getList();
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotSports:Team</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	#d1 {
		padding-top:70px;
	}
	#h2 {
		text-align:center;
	}
	 .blinking{
            -webkit-animation:blink .5s ease-in-out infinite alternate;
            -moz-animation:blink .5s ease-in-out infinite alternate;
            animation:blink .5s ease-in-out infinite alternate;
        }
        @-webkit-keyframes blink{
            0% {opacity:0;}
            100% {opacity:1;}
        }
        @-moz-keyframes blink{
            0% {opacity:0;}
            100% {opacity:1;}
        }
        @keyframes blink{
            0% {opacity:0;}
            100% {opacity:1;
        }
        
</style>
</head>
<body>
	<div class="container fixed-top">
		<jsp:include page="../include/navbar.jsp">
			<jsp:param value="Team" name="thisPage"/>
		</jsp:include>
	</div>
	<div id="d1" class= "container">
		<h2 id="h2" class="blinking text-danger">절찬 회원 모집중</h2>
		
		
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
						<label for="num" class="form-label">등 번호</label>
						<input type="text" class="form-control" name="num" id="num" />
					</div>
					<div class="mb-3">
						<label for="name" class="form-label">이름</label>
						<input type="text" class="form-control" name="name" id="name" />
					</div>
					<div class="mb-3">
						<label for="addr" class="form-label">포지션</label>
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
					<th>포지션</th>
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
										
										<div class="mb-3">
											<label for="num" class="form-label">번호</label>
											<%--input 요소에 disabled 속성을 추가하면 --%>
											<input type="text" class="form-control" name="num" id = "num" value = "<%=num %>" />
										</div>
										<div class="mb-3">
											<label for="name" class="form-label">이름</label>
											<input type="text" class="form-control" name="name" id = "name" value = "<%=name %>" />
										</div>
										<div class="mb-3">
											<label for="addr" class="form-label">포지션</label>
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
	</div>
</body>
</html>


