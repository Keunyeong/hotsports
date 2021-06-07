<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list2.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<script id="one" type="text/template">
   <tr>
      <td>\${tmp.num}</td>
      <td>\${tmp.name}</td>
      <td>\${tmp.addr}</td>
      <td>
         <a href="updateform.jsp?num=\${tmp.num}">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
               <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
               <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
            </svg>
            <span class="visually-hidden">회원 정보 수정</span>
         </a>
      </td>
      <td>
         <a href="delete.jsp?num=\${tmp.num}">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
               <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
               <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
            </svg>
            <span class="visually-hidden">회원 정보 삭제</span>
         </a>
      </td>
   </tr>
</script>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
   <jsp:param value="member2" name="thisPage"/>   
</jsp:include>
   <div class="container">
      <nav aria-label="breadcrumb">
           <ol class="breadcrumb">
             <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/">Home</a></li>
             <li class="breadcrumb-item active">회원목록</li>
           </ol>
      </nav>
      <a href="insertform.jsp">
         <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
             <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
             <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
         </svg>
         <span class="visually-hidden">새 회원 추가</span>
      </a>
      <table class="table table-sm table-striped">
         <thead class="table-dark">
            <tr>
               <th>번호</th>
               <th>이름</th>
               <th>주소</th>
               <th>수정</th>
               <th>삭제</th>
            </tr>
         </thead>
         <tbody>
           <%-- 이곳에 ajax를 활용 코드를 입력하여 이곳만 변경할 수 있게 한다. --%>
         </tbody>
      </table>
      <nav>
         <ul class="pagination pagination-sm">
            
         </ul>
      </nav>
   </div>
   <script src="../js/gura_util.js"></script>
   <script>
      
      //페이지 로딩시에 1페이지가 나오도록 한다. 
      pageUpdate(1);
      
      //현재 페이지는 1페이지라고 history 의 상태를 바꿔준다.
      history.replaceState(1,"","?pageNum=1");
   
      function pageUpdate(pageNum){
         //페이지의 내용을 ajax 로 요청하고 받아오기
         ajaxPromise("ajax_list.jsp", "get", "pageNum="+pageNum)
         .then(function(response){
            //ajax_list.jsp 에서 JSON 문자열을 응답한다.
            
            return response.json();
         })
         .then(function(data){
            //data 는 회원 목록이 들어 있는 배열이다. 
            console.log(data);
            
            // tr 을 누적할 변수 
            let trs="";
            for(let i=0; i<data.length; i++){
               //tmp 는 회원 한명의 정보가 들어 있는 object 이다.
               let tmp=data[i];
               // tr 의 template 문자열을 읽어온다. 
               let template=document.querySelector("#one").innerText;
               // template 문자열에 tmp 의 값을 넣어서 결과 문자열 html 을 얻어낸다.
               let result = eval('`'+template+'`');
               //결과를 trs 에 누적 시킨다 
               trs += result;
            }
            // trs 를 html 로 해석해서 tbody 에 넣어주기 
            document.querySelector("tbody").innerHTML=trs;
         });
         
         ajaxPromise("ajax_pagination.jsp", "get", "pageNum="+pageNum)
         .then(function(response){
            return response.text();
         })
         .then(function(data){
            console.log(data);
            document.querySelector(".pagination").innerHTML=data;
         });
      }
   
      
      //페이지 이동 버튼을 눌렀을때 호출되는 함수 
      function movePage(pageNum){
    	 history.pushState(pageNum,"","?pageNum="+pageNum);
         pageUpdate(pageNum);
      }
      window.onpopstate=function(event){
    	  console.log("popstate!");
    	  //event.state	는 history.pushState(데이터,x,x); 에서 담았던 데이터 이다.
    	  console.log(event.state);
    	  //페이지 번호로 활용하면 된다.
    	  pageUpdate(event.state);
      }
   </script>
</body>
</html>

