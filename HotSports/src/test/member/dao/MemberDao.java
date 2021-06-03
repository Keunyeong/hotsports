package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
   private static MemberDao dao;
   //외부에서 객체 생성하지 못하도록
   private MemberDao() {}
   //자신의 참조값을 리턴해주는 공개 메소드
   public static MemberDao getInstance() {
      if(dao==null) {
         dao=new MemberDao();
      }
      return dao;
   }
   // 회원 한명의 정보를 리턴하는 메소드
   public MemberDto  getData(int num) {
	    MemberDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT name,addr" + " FROM member" + " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new MemberDto();
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
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
   //수정하기
   public boolean update(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update member"
					+ " set name = ?,addr =?"
					+ " where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
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
   //delete 문
   public boolean delete(MemberDto dto) {
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   int flag = 0;
	   try {
	      conn = new DbcpBean().getConn();
	   //실행할 sql문 작성
	   String sql = "delete From Member"
	      + " Where num=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setInt(1, dto.getNum());

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
   //회원 정보를 DB 에 저장하는 메소드
   public boolean insert(MemberDto dto) {
      Connection conn = null;
      PreparedStatement pstmt = null;
      int flag = 0;
      try {
         conn = new DbcpBean().getConn();
         //실행할 sql 문 작성
         String sql = "INSERT INTO member"
               + " (num, name, addr)"
               + " VALUES(?, ?, ?)";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, dto.getNum());
         pstmt.setString(2, dto.getName());
         pstmt.setString(3, dto.getAddr());
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
   
   
   //회원 목록을 리턴하는 메소드
   public List<MemberDto> getList(){
      //회원목록을 담을 객체 생성
      List<MemberDto> list=new ArrayList<>();
      
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         //Connection 객체의 참조값 얻어오기 
         conn = new DbcpBean().getConn();
         //실행할 sql 문 작성
         String sql = "SELECT num,name,addr"
               + " FROM member"
               + " ORDER BY num ASC";
         //PreparedStatement 객체의 참조값 얻어오기
         pstmt = conn.prepareStatement(sql);
         //? 에 바인딩할 내용이 있으면 여기서 바인딩

         //select 문 수행하고 결과를 ResultSet 으로 받아오기
         rs = pstmt.executeQuery();
         //반복문 돌면서 ResultSet 객체에 있는 내용을 추출해서 원하는 Data type 으로 포장하기
         while (rs.next()) {
            //MemberDto 객체를 생성해서 
            MemberDto dto=new MemberDto();
            //현재 커서가 위치한 곳의  num 칼럼, name 칼럼, addr 칼럼에 있는 데이터를 읽어와서 담기
            dto.setNum(rs.getInt("num"));
            dto.setName(rs.getString("name"));
            dto.setAddr(rs.getString("addr"));
            //회원 한명의 정보가 담긴 MemberDto 객체의 참조값을 List 에 누적 시키기
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
}


