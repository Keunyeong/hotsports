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
	               + " VALUES(note_seq.NEXTVAL,?,?,?,?,0,SYSDATE)";
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
   public List<NoteDto> getList(){
	      //회원목록을 담을 객체 생성
	      List<NoteDto> list=new ArrayList<>();
	      
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         //Connection 객체의 참조값 얻어오기 
	         conn = new DbcpBean().getConn();
	         //실행할 sql 문 작성
	         String sql = "SELECT num,name,addr"
	               + " FROM Note"
	               + " ORDER BY num ASC";
	         //PreparedStatement 객체의 참조값 얻어오기
	         pstmt = conn.prepareStatement(sql);
	         //? 에 바인딩할 내용이 있으면 여기서 바인딩

	         //select 문 수행하고 결과를 ResultSet 으로 받아오기
	         rs = pstmt.executeQuery();
	         //반복문 돌면서 ResultSet 객체에 있는 내용을 추출해서 원하는 Data type 으로 포장하기
	         while (rs.next()) {
	            //NoteDto 객체를 생성해서 
	            NoteDto dto=new NoteDto();
	            //현재 커서가 위치한 곳의  num 칼럼, name 칼럼, addr 칼럼에 있는 데이터를 읽어와서 담기
	            dto.setNum(rs.getInt("num"));
	            dto.setWriter(rs.getString("writer"));
	            dto.setCategorize(rs.getString("categorize"));
	            dto.setTitle(rs.getString("title"));
	            dto.setViewCount(rs.getInt("viewCount"));
	            dto.setRegdate(rs.getString("regdate"));
	            //회원 한명의 정보가 담긴 NoteDto 객체의 참조값을 List 에 누적 시키기
	            list.add(dto);
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
	               conn.close(); // close() 하면 자동으로 Connection Pool 에 반납된다.
	         } catch (Exception e) {
	         }
	      }
	      //회원 목록 리턴해주기 
	      return list;
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
	public List<NoteDto> getListW(NoteDto dto){
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
	               "		  	  WHERE writer like '%'|| ? ||'%'" + 
	               "              FROM note" + 
	               "              ORDER BY num DESC) result1)" + 
	               "      WHERE rnum BETWEEN ? AND ?";
	         pstmt = conn.prepareStatement(sql);
	         // ? 에 바인딩 할게 있으면 여기서 바인딩한다.
	         pstmt.setString(1, dto.getWriter());
	         pstmt.setInt(2, dto.getStartRowNum());
	         pstmt.setInt(3, dto.getEndRowNum());
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
	public List<NoteDto> getListT(NoteDto dto){
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
	               "		  	  WHERE title like '%'|| ? ||'%'" + 
	               "              FROM note" + 
	               "              ORDER BY num DESC) result1)" + 
	               "      WHERE rnum BETWEEN ? AND ?";
	         pstmt = conn.prepareStatement(sql);
	         // ? 에 바인딩 할게 있으면 여기서 바인딩한다.
	         pstmt.setString(1, dto.getTitle());
	         pstmt.setInt(2, dto.getStartRowNum());
	         pstmt.setInt(3, dto.getEndRowNum());
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
	public List<NoteDto> getListCG(NoteDto dto){
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
	               "		  	  WHERE categorize like '%'|| ? ||'%'" + 
	               "              FROM note" + 
	               "              ORDER BY num DESC) result1)" + 
	               "      WHERE rnum BETWEEN ? AND ?";
	         pstmt = conn.prepareStatement(sql);
	         // ? 에 바인딩 할게 있으면 여기서 바인딩한다.
	         pstmt.setString(1, dto.getCategorize());
	         pstmt.setInt(2, dto.getStartRowNum());
	         pstmt.setInt(3, dto.getEndRowNum());
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
	public List<NoteDto> getListTC(NoteDto dto){
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
	               "		  	  WHERE title like '%'|| ? ||'%' or content like '%'|| ? ||'%'" + 
	               "              FROM note" + 
	               "              ORDER BY num DESC) result1)" + 
	               "      WHERE rnum BETWEEN ? AND ?";
	         pstmt = conn.prepareStatement(sql);
	         // ? 에 바인딩 할게 있으면 여기서 바인딩한다.
	         pstmt.setString(1, dto.getWriter());
	         pstmt.setString(2, dto.getContent());
	         pstmt.setInt(3, dto.getStartRowNum());
	         pstmt.setInt(4, dto.getEndRowNum());
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
	public int getCountW(NoteDto dto) {
	      //글의 갯수를 담을 지역변수 
	      int count=0;
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = new DbcpBean().getConn();
	         //select 문 작성
	         String sql = "SELECT NVL(MAX(ROWNUM), 0) AS num "
	               + " FROM note"
	         	   + " WHERE writer like '%'|| ? ||'%' ";
	         pstmt = conn.prepareStatement(sql);
	         // ? 에 바인딩 할게 있으면 여기서 바인딩한다.
	         pstmt.setString(1,dto.getWriter());
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
	public int getCountT(NoteDto dto) {
	      //글의 갯수를 담을 지역변수 
	      int count=0;
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = new DbcpBean().getConn();
	         //select 문 작성
	         String sql = "SELECT NVL(MAX(ROWNUM), 0) AS num "
	               + " FROM note"
	         	   + " WHERE title like '%'|| ? ||'%' ";
	         pstmt = conn.prepareStatement(sql);
	         // ? 에 바인딩 할게 있으면 여기서 바인딩한다.
	         pstmt.setString(1,dto.getTitle());
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
	public int getCountCG(NoteDto dto) {
	      //글의 갯수를 담을 지역변수 
	      int count=0;
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = new DbcpBean().getConn();
	         //select 문 작성
	         String sql = "SELECT NVL(MAX(ROWNUM), 0) AS num "
	               + " FROM note"
	         	   + " WHERE categorize like '%'|| ? ||'%' ";
	         pstmt = conn.prepareStatement(sql);
	         // ? 에 바인딩 할게 있으면 여기서 바인딩한다.
	         pstmt.setString(1,dto.getCategorize());
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
	public int getCountTC(NoteDto dto) {
	      //글의 갯수를 담을 지역변수 
	      int count=0;
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = new DbcpBean().getConn();
	         //select 문 작성
	         String sql = "SELECT NVL(MAX(ROWNUM), 0) AS num "
	               + " FROM note"
	         	   + " WHERE title like '%'|| ? ||'%' or content like '%'|| ? ||'%' ";
	         pstmt = conn.prepareStatement(sql);
	         // ? 에 바인딩 할게 있으면 여기서 바인딩한다.
	         pstmt.setString(1,dto.getTitle());
	         pstmt.setString(2, dto.getContent());
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
	public NoteDto getData(int num) {
		NoteDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT writer,categorize,title,content,viewCount,regdate"
					+ " FROM note" 
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new NoteDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setCategorize(rs.getString("categorize"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setRegdate(rs.getString("regdate"));
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
		return dto;
	}
	public boolean delete(int num) {
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   int flag = 0;
	   try {
	      conn = new DbcpBean().getConn();
	   //실행할 sql문 작성
	   String sql = "delete From note"
	      + " Where num=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setInt(1, num);

	   flag = pstmt.executeUpdate();
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
	public boolean update(NoteDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update note"
					+ " set categorize?,title= ?,content = ?,regdate = sysdate"
					+ " where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCategorize());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getNum());
			flag = pstmt.executeUpdate();
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
}
