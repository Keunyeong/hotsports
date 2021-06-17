package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.cafe.dto.CafeDto;
import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class CafeDao {
   
   private static CafeDao dao;
   private CafeDao() {}
   public static CafeDao getInstance() {
      if(dao==null) {
         dao=new CafeDao();
      }
      return dao;
   }
   //새글 저장하는 메소드 
   public boolean insert(CafeDto dto) {
      Connection conn = null;
      PreparedStatement pstmt = null;
      int flag = 0;
      try {
         conn = new DbcpBean().getConn();
         //실행할 insert, update, delete 문 구성
         String sql = "INSERT INTO board_cafe"
               + " (num,writer,title,content,viewCount,regdate)"
               + " VALUES(board_cafe_seq.NEXTVAL,?,?,?,0,SYSDATE)";
         pstmt = conn.prepareStatement(sql);
         //? 에 바인딩할 내용이 있으면 바인딩한다.
         pstmt.setString(1, dto.getWriter());
         pstmt.setString(2, dto.getTitle());
         pstmt.setString(3, dto.getContent());
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
   //글 목록을 리턴하는 메소드 
   public List<CafeDto> getList(CafeDto dto){
      //글목록을 담을 ArrayList 객체 생성
      List<CafeDto> list=new ArrayList<CafeDto>();
      
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
               "              (SELECT num,writer,title,viewCount,regdate" + 
               "              FROM board_cafe" + 
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
            CafeDto dto2=new CafeDto();
            dto2.setNum(rs.getInt("num"));
            dto2.setWriter(rs.getString("writer"));
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
   //전체 글의 갯수를 리턴하는 메소드
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
               + " FROM board_cafe";
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
   public CafeDto getData(int num) {
	   CafeDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT writer,title,content,viewCount,regdate"
					+ " FROM board_cafe" 
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new CafeDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
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
	   String sql = "delete From board_cafe"
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
    public boolean update(CafeDto dto) {
    	Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update board_cafe"
					+ " set title= ?,content = ?,regdate = sysdate"
					+ " where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
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
    public boolean addViewCount(int num) {
    	Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update board_cafe"
					+ " set viewCount=viewCount+1"
					+ " where num = ?";
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
}

