package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
	private static UsersDao dao;
	private UsersDao() {};
	public static UsersDao getInstance() {
		if(dao==null) {
			dao=new UsersDao();
		}
		return dao;
	}


//회원 정보를 DB 에 저장하는 메소드
	public boolean insert(UsersDto dto) {
		Connection conn = null;
	      PreparedStatement pstmt = null;
	      int flag = 0;
	      try {
	         conn = new DbcpBean().getConn();
	         //실행할 sql 문 작성
	         String sql = "INSERT INTO users"
	               + " (id, pwd, email, regdate)"
	               + " VALUES(?, ?, ?, sysdate)";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, dto.getId());
	         pstmt.setString(2, dto.getPwd());
	         pstmt.setString(3, dto.getEmail());
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
	public boolean isValid(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean isValid=false;
	   try {
	      conn = new DbcpBean().getConn();
	   //실행할 sql문 작성
	   String sql = "SELECT id" 
			   + " FROM users" 
			   + " WHERE id=? and pwd=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, dto.getId());
	   pstmt.setString(2, dto.getPwd());
	   rs = pstmt.executeQuery();
	   if (rs.next()) {
		      isValid = true;
		   } else {
		      isValid = false;
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
	   return isValid;
	}
	
	public boolean isExist(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean isExist=false;
	   try {
	       conn = new DbcpBean().getConn();
		   //실행할 sql문 작성
		   String sql = "SELECT id" 
				   + " FROM users" 
				   + " WHERE id=? ";
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setString(1, id);
		   rs = pstmt.executeQuery();
		   if (rs.next()) {
			      isExist = true;//이미 존재하는 아이디라고 표시
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
	   return isExist;
	}
	public UsersDto  getData(String id) {
	    UsersDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT pwd,email,profile,regdate"
					+ " FROM users" 
					+ " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new UsersDto();
				dto.setId("id");
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				dto.setProfile(rs.getString("profile"));
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
	public boolean updatePwd(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update Users"
					+ " set pwd = ?"
					+ " where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPwd());
			pstmt.setString(2, dto.getId());
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
	public boolean delete(String id) {
		   Connection conn = null;
		   PreparedStatement pstmt = null;
		   int flag = 0;
		   try {
		      conn = new DbcpBean().getConn();
		   //실행할 sql문 작성
		   String sql = "delete From users"
		      + " Where id=?";
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setString(1, id);

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
	public boolean updateProfile(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update Users"
					+ " set profile = ?"
					+ " where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getProfile());
			pstmt.setString(2, dto.getId());
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
	public boolean update(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update Users"
					+ " set email = ?,profile = ?"
					+ " where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getProfile());
			pstmt.setString(3, dto.getId());
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