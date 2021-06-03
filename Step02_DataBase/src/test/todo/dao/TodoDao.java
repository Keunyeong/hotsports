package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.todo.dto.TodoDto;
import test.util.DbcpBean;

public class TodoDao {
	private static TodoDao dao;
	
	private TodoDao() {}
	
	public static TodoDao getInstance() {
		if(dao==null) {
			dao = new TodoDao();
		}
		return dao;
	}
	public List<TodoDto> getList(){
		List<TodoDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "select num,content,TO_CHAR(regdate,'YY.MM.DD AM HH:MI') as regdate"
					+ " from todo"
					+ " order by num asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TodoDto dto = new TodoDto();
				dto.setNum(rs.getInt("num"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
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
	               conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}
	public boolean insert(TodoDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "insert into todo"
					+ " (num,content,regdate)"
					+ " values(todo_seq.NEXTVAL,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
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
	public boolean delete(TodoDto dto) {
		   Connection conn = null;
		   PreparedStatement pstmt = null;
		   int flag = 0;
		   try {
		      conn = new DbcpBean().getConn();
		   //실행할 sql문 작성
		   String sql = "delete From todo"
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
	public boolean update(TodoDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update todo"
					+ " set content = ?,regdate = sysdate"
					+ " where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.setInt(2, dto.getNum());
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
	public TodoDto  getData(int num) {
	    TodoDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT content,regdate" + " FROM todo" + " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new TodoDto();
				dto.setNum(num);
				dto.setContent(rs.getString("content"));
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
}
