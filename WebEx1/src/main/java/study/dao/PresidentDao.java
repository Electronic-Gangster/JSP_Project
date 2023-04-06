package study.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.List;
import java.util.Vector;

import db.DbConnect;
import study.dto.PresidentDto;

public class PresidentDao {
	DbConnect db=new DbConnect();
	
	//insert
	public void insertPresident(PresidentDto dto) {
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		String sql="insert into presidentboard (writer, subject, content, photo) vlaues (?, ?, ?, ?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPhoto());
			
			//실행
			pstmt.execute();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//all select
	public List<PresidentDto> getAllDatas()
	{
		List<PresidentDto> list=new Vector<>();
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from president order by num desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				int num=rs.getInt("num");
				String writer=rs.getString("writer");
				String subject=rs.getString("subject");
				String content=rs.getString("content");
				String photo=rs.getString("photo");
				int readcount=rs.getInt("readcount");
				Timestamp writeday=rs.getTimestamp("writeday");
				
				PresidentDto dto=new PresidentDto(num, writer,subject, content, photo, readcount, writeday);
				
				//list 추가
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		return list;
	}
	
	//readcount 증가
	public void updateReadCount(int num) 
	{
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		String sql="update president set readcount=readcount+1 where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setInt(1, num);
			
			//실행
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//detail view
	public PresidentDto getData(int num)
	{
		PresidentDto dto=null;
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;;
		String sql="select * from president where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setInt(1, num);
			
			//실행
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				String writer=rs.getString("writer");
				String subject=rs.getString("subject");
				String content=rs.getString("content");
				String photo=rs.getString("photo");
				int readcount=rs.getInt("readcount");
				Timestamp writeday=rs.getTimestamp("writeday");
				
				dto=new PresidentDto(num, writer, subject, content, photo, readcount, writeday);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	//delete
	public void deletePresident(int num)
	{
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		String sql="delete from President where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setInt(1, num);
			
			//실행
			pstmt.execute();
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//update
	public void updatePresident(PresidentDto dto)
	{
		Connection conn=db.getMysqlConnection();
		Statement stmt=null;
		
		String sql="update president set writer='"+dto.getWriter()+"',subject='"
				+dto.getSubject()+"',content='"+dto.getContent()+"',photo='"+dto.getPhoto()
				+"'where num="+dto.getNum();
		
		String sql2="update president set writer='"+dto.getWriter()+"',subject='"
				+dto.getSubject()+"',content='"+dto.getContent()+"'where num="+dto.getNum();
		
		try {
		stmt=conn.createStatement();
			if(dto.getPhoto()==null)
				stmt.execute(sql2);
			else
				stmt.execute(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}catch(SQLException e) {}
		}
	}
}