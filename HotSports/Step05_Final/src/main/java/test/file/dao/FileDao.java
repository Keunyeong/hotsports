package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
   private static FileDao dao;
   private FileDao() {}
   public static FileDao getInstance() {
      if(dao==null) {
         dao=new FileDao();
      }
      return dao;
   }
   //업로드된 파일의 정보를 DB 에 저장하는 메소드 
   public boolean insert(FileDto dto) {
      Connection conn = null;
      PreparedStatement pstmt = null;
      int flag = 0;
      try {
         conn = new DbcpBean().getConn();
         //실행할 sql 문 작성
         String sql = "INSERT INTO board_file"
               + " (num, writer, title, orgFileName, saveFileName, fileSize, regdate)"
               + " VALUES(board_file_seq.NEXTVAL,?,?,?,?,?,SYSDATE)";
         pstmt = conn.prepareStatement(sql);
         //? 에 바인딩할 내용이 있으면 여기서 바인딩
         pstmt.setString(1, dto.getWriter());
         pstmt.setString(2, dto.getTitle());
         pstmt.setString(3, dto.getOrgFileName());
         pstmt.setString(4, dto.getSaveFileName());
         pstmt.setLong(5, dto.getFileSize());
         //insert or update or delete 문 수행하고 변화된 row 의 갯수 리턴 받기
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
   
   public boolean delete(int num) {
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   int flag = 0;
	   try {
	      conn = new DbcpBean().getConn();
	   //실행할 sql문 작성
	   String sql = "delete From board_file"
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
   
   public List<FileDto> getList(FileDto dto){
	 //글목록을 담을 ArrayList 객체 생성
	      List<FileDto> list=new ArrayList<FileDto>();
	      
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
	               "              (SELECT num, writer, title, orgFileName, saveFileName, fileSize, regdate" + 
	               "              FROM board_file" + 
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
	            FileDto dto2=new FileDto();
	            dto2.setNum(rs.getInt("num"));
	            dto2.setWriter(rs.getString("writer"));
	            dto2.setTitle(rs.getString("title"));
	            dto2.setOrgFileName(rs.getString("orgFileName"));
	            dto2.setSaveFileName(rs.getString("saveFileName"));
	            dto2.setFileSize(rs.getLong("fileSize"));
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
   
   public FileDto getData(int num) {
	      FileDto dto2=null;
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         //Connection 객체의 참조값 얻어오기 
	         conn = new DbcpBean().getConn();
	         //실행할 sql 문 작성
	         String sql = "SELECT *" + 
	               " FROM" + 
	               "   (SELECT num, writer, title, orgFileName, saveFileName, fileSize, regdate," + 
	               "   LAG(num, 1, 0) OVER(ORDER BY num DESC) AS prevNum," + 
	               "   LEAD(num, 1, 0) OVER(ORDER BY num DESC) nextNum" + 
	               "   FROM board_file" + 
	               "   ORDER BY num DESC)" + 
	               " WHERE num=?";
	         
	         //PreparedStatement 객체의 참조값 얻어오기
	         pstmt = conn.prepareStatement(sql);
	         //? 에 바인딩할 내용이 있으면 여기서 바인딩
	         pstmt.setInt(1, num);
	         //select 문 수행하고 결과를 ResultSet 으로 받아오기
	         rs = pstmt.executeQuery();
	         //ResultSet 객체에 있는 내용을 추출해서 원하는 Data type 으로 포장하기
	         if(rs.next()) {
	            dto2=new FileDto();
	            dto2.setNum(rs.getInt("num"));
	            dto2.setWriter(rs.getString("writer"));
	            dto2.setTitle(rs.getString("title"));
	            dto2.setOrgFileName(rs.getString("orgFileName"));
	            dto2.setSaveFileName(rs.getString("saveFileName"));
	            dto2.setFileSize(rs.getLong("fileSize"));
	            dto2.setRegdate(rs.getString("regdate"));
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
	      return dto2;
	   }
   
   public List<FileDto> getListW(FileDto dto){
	 //글목록을 담을 ArrayList 객체 생성
	      List<FileDto> list=new ArrayList<FileDto>();
	      
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
	               "              (SELECT num, writer, title, orgFileName, saveFileName, fileSize, regdate" + 
	               "              FROM board_file" + 
	               "              WHERE writer LIKE '%' || ? || '%' " +
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
	            FileDto dto2=new FileDto();
	            dto2.setNum(rs.getInt("num"));
	            dto2.setWriter(rs.getString("writer"));
	            dto2.setTitle(rs.getString("title"));
	            dto2.setOrgFileName(rs.getString("orgFileName"));
	            dto2.setSaveFileName(rs.getString("saveFileName"));
	            dto2.setFileSize(rs.getLong("fileSize"));
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
   /*
    *  Writer 검색일때 실행할 메소드
    *  FileDto 의 writer 이라는 필드에 검색 키워드가 들어 있다.
    */
   public List<FileDto> getListT(FileDto dto){
	   List<FileDto> list=new ArrayList<FileDto>();
	      
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
	               "              (SELECT num, writer, title, orgFileName, saveFileName, fileSize, regdate" + 
	               "              FROM board_file" + 
	               "              WHERE title LIKE '%' || ? || '%' " +
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
	            FileDto dto2=new FileDto();
	            dto2.setNum(rs.getInt("num"));
	            dto2.setWriter(rs.getString("writer"));
	            dto2.setTitle(rs.getString("title"));
	            dto2.setOrgFileName(rs.getString("orgFileName"));
	            dto2.setSaveFileName(rs.getString("saveFileName"));
	            dto2.setFileSize(rs.getLong("fileSize"));
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
   
   public List<FileDto> getListTS(FileDto dto){
	   List<FileDto> list=new ArrayList<FileDto>();
	      
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
	               "              (SELECT num, writer, title, orgFileName, saveFileName, fileSize, regdate" + 
	               "              FROM board_File" + 
	               "              WHERE title LIKE '%' || ? || '%' or saveFileName LIKE '%' || ? || '%' " +
	               "              ORDER BY num DESC) result1)" + 
	               "      WHERE rnum BETWEEN ? AND ?";
	         pstmt = conn.prepareStatement(sql);
	         // ? 에 바인딩 할게 있으면 여기서 바인딩한다.
	         pstmt.setString(1, dto.getTitle());
	         pstmt.setString(2, dto.getSaveFileName());
	         pstmt.setInt(3, dto.getStartRowNum());
	         pstmt.setInt(4, dto.getEndRowNum());
	         //select 문 수행하고 ResultSet 받아오기
	         rs = pstmt.executeQuery();
	         //while문 혹은 if문에서 ResultSet 으로 부터 data 추출
	         while (rs.next()) {
	            FileDto dto2=new FileDto();
	            dto2.setNum(rs.getInt("num"));
	            dto2.setWriter(rs.getString("writer"));
	            dto2.setTitle(rs.getString("title"));
	            dto2.setOrgFileName(rs.getString("orgFileName"));
	            dto2.setSaveFileName(rs.getString("saveFileName"));
	            dto2.setFileSize(rs.getLong("fileSize"));
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
   public FileDto getDataTS(FileDto dto) {
	      FileDto dto2=null;
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         //Connection 객체의 참조값 얻어오기 
	         conn = new DbcpBean().getConn();
	         //실행할 sql 문 작성
	         String sql = "SELECT *" + 
	               " FROM" + 
	               "   (SELECT num, writer, title, orgFileName, saveFileName, fileSize, regdate," + 
	               "   LAG(num, 1, 0) OVER(ORDER BY num DESC) AS prevNum," + 
	               "   LEAD(num, 1, 0) OVER(ORDER BY num DESC) nextNum" +
	               "   WHERE title LIKE '%'||?||'%' or saveFileName LIKE '%'||?||'%'" + 
	               "   FROM board_file" +
	               "   ORDER BY num DESC)" +
	               " WHERE num=?";
	         
	         //PreparedStatement 객체의 참조값 얻어오기
	         pstmt = conn.prepareStatement(sql);
	         //? 에 바인딩할 내용이 있으면 여기서 바인딩
	         pstmt.setString(1, dto.getTitle());
	         pstmt.setString(2, dto.getSaveFileName());
	         pstmt.setInt(3, dto.getNum());
	         //select 문 수행하고 결과를 ResultSet 으로 받아오기
	         rs = pstmt.executeQuery();
	         //ResultSet 객체에 있는 내용을 추출해서 원하는 Data type 으로 포장하기
	         if(rs.next()) {
	            dto2=new FileDto();
	            dto2.setNum(rs.getInt("num"));
	            dto2.setWriter(rs.getString("writer"));
	            dto2.setTitle(rs.getString("title"));
	            dto2.setOrgFileName(rs.getString("orgFileName"));
	            dto2.setSaveFileName(rs.getString("saveFileName"));
	            dto2.setFileSize(rs.getLong("fileSize"));
	            dto2.setRegdate(rs.getString("regdate"));
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
	      return dto2;
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
	               + " FROM board_File";
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
   public int getCountW(FileDto dto) {
	      //글의 갯수를 담을 지역변수 
	      int count=0;
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = new DbcpBean().getConn();
	         //select 문 작성
	         String sql = "SELECT NVL(MAX(ROWNUM), 0) AS num "
	               + " FROM board_file"
	               + " WHERE writer LIKE '%'||?||'%'";
	         pstmt = conn.prepareStatement(sql);
	         // ? 에 바인딩 할게 있으면 여기서 바인딩한다.
	         pstmt.setString(1, dto.getWriter());
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
public int getCountT(FileDto dto) {
	      //글의 갯수를 담을 지역변수 
	      int count=0;
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = new DbcpBean().getConn();
	         //select 문 작성
	         String sql = "SELECT NVL(MAX(ROWNUM), 0) AS num "
	               + " FROM board_file"
	               + " WHERE title LIKE '%'||?||'%'";
	         pstmt = conn.prepareStatement(sql);
	         // ? 에 바인딩 할게 있으면 여기서 바인딩한다.
	         pstmt.setString(1, dto.getTitle());
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
public int getCountTS(FileDto dto) {
    //글의 갯수를 담을 지역변수 
    int count=0;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
       conn = new DbcpBean().getConn();
       //select 문 작성
       String sql = "SELECT NVL(MAX(ROWNUM), 0) AS num "
             + " FROM board_file"
             + " WHERE title LIKE '%'||?||'%' or saveFileName LIKE '%'||?||'%'";
       pstmt = conn.prepareStatement(sql);
       // ? 에 바인딩 할게 있으면 여기서 바인딩한다.
       pstmt.setString(1, dto.getTitle());
       pstmt.setString(1, dto.getSaveFileName());
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





