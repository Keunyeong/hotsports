
<%@page import="java.net.URLEncoder"%>
<%@page import="org.json.JSONObject"%>
<%@page import="test.note.dto.NoteDto"%>
<%@page import="test.note.dao.NoteDao"%>
<%@page import="java.util.List"%>
<%--

	 json 문자열을 응답할때는 contentType 을 application/json 으로 설정하고
	상단의 공백을 제거하고 싶으면 trimDirectiveWhitespaces 를 true 로 설정한다.
	
--%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
 //한 페이지에 몇개씩 표시할 것인지
   final int PAGE_ROW_COUNT=5;
   //하단 페이지를 몇개씩 표시할 것인지
   final int PAGE_DISPLAY_COUNT=10;
   
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
 
   /*
   [ 검색 키워드에 관련된 처리 ]
   -검색 키워드가 파라미터로 넘어올수도 있고 안넘어 올수도 있다.      
*/
String keyword=request.getParameter("keyword");
String condition=request.getParameter("condition");
//만일 키워드가 넘어오지 않는다면 
if(keyword==null){
   //키워드와 검색 조건에 빈 문자열을 넣어준다. 
   //클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서  
   keyword="";
   condition=""; 
}

//특수기호를 인코딩한 키워드를 미리 준비한다. 
String encodedK=URLEncoder.encode(keyword);
   
//CafeDto 객체에 startRowNum 과 endRowNum 을 담는다.
NoteDto dto=new NoteDto();
dto.setStartRowNum(startRowNum);
dto.setEndRowNum(endRowNum);

//ArrayList 객체의 참조값을 담을 지역변수를 미리 만든다.
List<NoteDto> list=null;
//전체 row 의 갯수를 담을 지역변수를 미리 만든다.
int totalRow=0;
//만일 검색 키워드가 넘어온다면 
if(!keyword.equals("")){
   //검색 조건이 무엇이냐에 따라 분기 하기
   if(condition.equals("title_content")){//제목 + 내용 검색인 경우
      //검색 키워드를 NoteDto 에 담아서 전달한다.
      dto.setTitle(keyword);
      dto.setContent(keyword);
      //제목+내용 검색일때 호출하는 메소드를 이용해서 목록 얻어오기 
      list=NoteDao.getInstance().getListTC(dto);
      //제목+내용 검색일때 호출하는 메소드를 이용해서 row  의 갯수 얻어오기
      totalRow=NoteDao.getInstance().getCountTC(dto);
   }else if(condition.equals("title")){ //제목 검색인 경우
      dto.setTitle(keyword);
      list=NoteDao.getInstance().getListT(dto);
      totalRow=NoteDao.getInstance().getCountT(dto);
   }else if(condition.equals("writer")){ //작성자 검색인 경우
      dto.setWriter(keyword);
      list=NoteDao.getInstance().getListW(dto);
      totalRow=NoteDao.getInstance().getCountW(dto);
   } // 다른 검색 조건을 추가 하고 싶다면 아래에 else if() 를 계속 추가 하면 된다.
}else if(condition.equals("java")){ //작성자 검색인 경우
    dto.setWriter(condition);
    list=NoteDao.getInstance().getListCG(dto);
    totalRow=NoteDao.getInstance().getCountCG(dto);
}else if(condition.equals("javascript")){ //작성자 검색인 경우
    dto.setWriter(condition);
    list=NoteDao.getInstance().getListCG(dto);
    totalRow=NoteDao.getInstance().getCountCG(dto);
}else if(condition.equals("html")){ //작성자 검색인 경우
    dto.setWriter(condition);
    list=NoteDao.getInstance().getListCG(dto);
    totalRow=NoteDao.getInstance().getCountCG(dto);
}else if(condition.equals("css")){ //작성자 검색인 경우
    dto.setWriter(condition);
    list=NoteDao.getInstance().getListCG(dto);
    totalRow=NoteDao.getInstance().getCountCG(dto);
}else{//검색 키워드가 넘어오지 않는다면
   //키워드가 없을때 호출하는 메소드를 이용해서 파일 목록을 얻어온다. 
   list=NoteDao.getInstance().getList(dto);
   //키워드가 없을때 호출하는 메소드를 이용해서 전제 row 의 갯수를 얻어온다.
   totalRow=NoteDao.getInstance().getCount();
}

//하단 시작 페이지 번호 
int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
//하단 끝 페이지 번호
int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
//전체 페이지의 갯수
int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
//끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이다.
if(endPageNum > totalPageCount){
   endPageNum=totalPageCount; //보정해 준다.
}
   
   //JSONObject 의 static 메소드를 이용해서 List 에 있는 내용을 JSON 문자열로 변환하기 
   String result=JSONObject.valueToString(list);
%>
<%=result %>