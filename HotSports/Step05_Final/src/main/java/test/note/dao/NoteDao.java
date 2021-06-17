package test.note.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import test.note.dto.NoteDto;
import test.util.DbcpBean;

public class NoteDao {
	private static NoteDao dao;
	   private NoteDao() {}
	   public static NoteDao getInstance() {
	      if(dao==null) {
	         dao=new NoteDao();
	      }
	      return dao;
	   }
	
	public boolean insert(NoteDto dto) {
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    int flag = 0;
	    try {
	         conn = new DbcpBean().getConn();
	         //실행할 insert, update, delete 문 구성
	         String sql = "INSERT INTO note"
	               + " (num,writer,categorize,title,content,viewCount,regdate)"
	               + " VALUES(board_Note_seq.NEXTVAL,?,?,?,?,0,SYSDATE)";
	         pstmt = conn.prepareStatement(sql);
	         //? 에 바인딩할 내용이 있으면 바인딩한다.
	         pstmt.setString(1, dto.getWriter());
	         pstmt.setString(2, dto.getCategorize());
	         pstmt.setString(3, dto.getTitle());
	         pstmt.setString(4, dto.getContent());
	         flag = pstmt.executeUpdate(); //sql 문 실행하고 변화된 row 갯수 리턴 받기
	    } catch (Exception e) {
	         e.printStackTrace();
	    } finally {
	         try {
	            if (pstmt != null)
	               pstmt.close();
	            if (conn != null)
	               conn.close();
	         } catch (Exception e) {
	         }
	    }
	      if (flag > 0) {
	         return true;
	      } else {
	         return false;
	      }
	}
	public List<NoteDto> getList(NoteDto dto){
		//글목록을 담을 ArrayList 객체 생성
	      List<NoteDto> list=new ArrayList<NoteDto>();
	      
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = new DbcpBean().getConn();
	         //select 문 작성
	         String sql = "SELECT *" + 
	               "      FROM" + 
	               "          (SELECT result1.*, ROWNUM AS rnum" + 
	               "          FROM" + 
	               "              (SELECT num,writer,categorize,title,viewCount,regdate" + 
	               "              FROM note" + 
	               "              ORDER BY num DESC) result1)" + 
	               "      WHERE rnum BETWEEN ? AND ?";
	         pstmt = conn.prepareStatement(sql);
	         // ? 에 바인딩 할게 있으면 여기서 바인딩한다.
	         pstmt.setInt(1, dto.getStartRowNum());
	         pstmt.setInt(2, dto.getEndRowNum());
	         //select 문 수행하고 ResultSet 받아오기
	         rs = pstmt.executeQuery();
	         //while문 혹은 if문에서 ResultSet 으로 부터 data 추출
	         while (rs.next()) {
	            NoteDto dto2=new NoteDto();
	            dto2.setNum(rs.getInt("num"));
	            dto2.setWriter(rs.getString("writer"));
	            dto2.setCategorize(rs.getString("categorize"));
	            dto2.setTitle(rs.getString("title"));
	            dto2.setViewCount(rs.getInt("viewCount"));
	            dto2.setRegdate(rs.getString("regdate"));
	            list.add(dto2);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            if (rs != null)
	               rs.close();
	            if (pstmt != null)
	               pstmt.close();
	            if (conn != null)
	               conn.close();
	         } catch (Exception e) {
	         }
	      }
	      return list;
	}
	public int getCount() {
	      //글의 갯수를 담을 지역변수 
	      int count=0;
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = new DbcpBean().getConn();
	         //select 문 작성
	         String sql = "SELECT NVL(MAX(ROWNUM), 0) AS num "
	               + " FROM note";
	         pstmt = conn.prepareStatement(sql);
	         // ? 에 바인딩 할게 있으면 여기서 바인딩한다.

	         //select 문 수행하고 ResultSet 받아오기
	         rs = pstmt.executeQuery();
	         //while문 혹은 if문에서 ResultSet 으로 부터 data 추출
	         if (rs.next()) {
	            count=rs.getInt("num");
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            if (rs != null)
	               rs.close();
	            if (pstmt != null)
	               pstmt.close();
	            if (conn != null)
	               conn.close();
	         } catch (Exception e) {
	         }
	      }
	      return count;
	   }
}
