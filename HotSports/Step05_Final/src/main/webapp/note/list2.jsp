<%@page import="java.util.List"%>
<%@page import="test.note.dao.NoteDao"%>
<%@page import="test.note.dto.NoteDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/note/list.jsp</title>
<script id="one" type="text/template">
      <tr>
            <td>\${tmp.num}</td>
            <td>\${tmp.writer}</td>
            <td>\${tmp.categorize}</td>
            <td><a href="detail.jsp?num=\${tmp.num}">\${tmp.title}</a></td>
            <td>\${tmp.ViewCount}</td>
            <td>\${tmp.regdate}</td>
      </tr>
      
</script>
</head>
<body>
   <div class="container">
   <a href="private/insertform.jsp">새글 작성</a>
   <h1>개발자 노트 입니다.</h1>
   <table>
      <thead>
         <tr>
            <th>글번호</th>
            <th>작성자</th>
            <th>
              <select class="form-select" id="two" name="condition" aria-label="Default select example">
				  <option selected>카테고리</option>
				  <option value="Java">Java</option>
				  <option value="Javascript">Javascript</option>
				  <option value="Html">Html</option>
				  <option value="Css">Css</option>
			  </select>
			</th>
            <th>제목</th>
            <th>조회수</th>
            <th>등록일</th>
         </tr>
      </thead>
      <tbody>
      
      </tbody>
   </table>
   <div class="page-ui clearfix">
      <ul >
         
      </ul>
   </div>
    <form action="ajax_list.jsp" method="get">
	  <label for="condition">검색조건</label>
	  <select name="condition" id="condition" >
	     <option value="title_content">제목+내용</option>
	     <option value="title" >제목</option>
	     <option value="writer" >작성자</option>
	  </select>
	  <input type="text" name="keyword" placeholder="검색어..." />
	  <button id="btnId" type="submit">검색</button>
	  <button id="reset" type="reset">전체보기</button>
	</form>
</div>
<script src="../js/gura_util.js"></script>
   <script>
      //현재 페이지 번호를 저장할 변수 만들고 초기값 부여 
      let currentPage=1;
   
      //페이지 로딩시에 1페이지가 나오도록 한다. 
      pageUpdate(currentPage);
      //현재 페이지는 1페이지라고 history 의 상태를 바꿔준다.
      history.replaceState(currentPage, "", "?pageNum="+currentPage);
      
      document.querySelector("#btnId").addEventListener("click",function(){
    	  movePage(currentPage);
      });
      
      document.querySelector("#two").addEventListener("change",function(){
    	  movePage(currentPage);
      });
      
      
      function pageUpdate(pageNum){
         //현재 페이지 번호 수정
         currentPage=pageNum;
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
            return response.json();
         })
         .then(function(data){
            //data 는 {pageNum:x, startPageNum:x, endPageNum, totalPageCount:x}
            let lis='';
            /*
            `
               <li class="page-item  ">
                  <a class="page-link" href="javascript:movePage(\${})"> </a>
               </li>
            `
            */
            if(data.startPageNum != 1){
               lis += `
                  <li class="page-item  ">
                     <a class="page-link" href="javascript:movePage(\${data.startPageNum-1})">&laquo;</a>
                  </li>
               `;
            }
            for(let i=data.startPageNum; i<=data.endPageNum ; i++){
               if(data.pageNum == i){
                  lis += `
                     <li class="page-item active">
                        <a class="page-link" href="javascript:movePage(\${i})">\${i}</a>
                     </li>
                  `;
               }else{
                  lis += `
                     <li class="page-item">
                        <a class="page-link" href="javascript:movePage(\${i})">\${i}</a>
                     </li>
                  `;
               }
            }
            if(data.endPageNum < data.totalPageCount){
               lis += `
                  <li class="page-item">
                     <a class="page-link" href="javascript:movePage(\${data.endPageNum+1})">&raquo;</a>
                  </li>
               `;
            }
            document.querySelector(".pagination").innerHTML=lis;
         });
      }
   
      
      //페이지 이동 버튼을 눌렀을때 호출되는 함수 
      function movePage(pageNum){
         //history 객체에 page 번호 상태를 추가한다. (새로운 히스토리를 쌓는다)
         history.pushState(pageNum, "", "?pageNum="+pageNum);
         pageUpdate(pageNum);
      }
      
      //뒤로가기 혹은 앞으로가기 버튼을 눌렀을때 호출되는 함수 등록 
      window.onpopstate=function(event){
         console.log("popstate!");
         // event.state 는  history.pushState(데이터 , x , x); 에서 담았던 데이터 이다.
         console.log(event.state);
         // 페이지 번호로 활용하면 된다. 
         pageUpdate(event.state);
      };
      
      
   </script>
</body>
</html>