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
import study.dto.DesignDto;

public class DesignDao {
	DbConnect db=new DbConnect();
	
	//1. insert
	public void insertDesign(DesignDto dto)
	{
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		String sql="insert into design (writer, subject, content, photo) values (?, ?, ?, ?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPhoto());
			
			//실행
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}

	
	//2. all select
	public List<DesignDto> getAllDatas()
	{
		List<DesignDto> list=new Vector<>();
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from design order by num desc";
		
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
				
				DesignDto dto=new DesignDto(num, writer, subject, content, photo, readcount, writeday);
				
				//list 추가
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	
	//readcount 증가
	public void updateReadCount(int num)
	{
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		String sql="update design set readcount=readcount+1 where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setInt(1, num);
			
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}

	
	//detail view
	public DesignDto getData(int num)
	{
		DesignDto dto=null;
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from design where num=?";
		
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
					
					dto=new DesignDto(num, writer, subject, content, photo, readcount, writeday);
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
	public void deleteDesign(int num)
	{
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		String sql="delete from design where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setInt(1, num);
			
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}

	//update
	public void updateDesign(DesignDto dto)
	{
		Connection conn=db.getMysqlConnection();
		Statement stmt=null;
		
		String sql="update design set writer='"+dto.getWriter()+"',subject='"
				+dto.getSubject()+"',content='"+dto.getContent()+"',photo='"+dto.getPhoto()
				+"' where num="+dto.getNum();
		
		String sql2="update design set writer='"+dto.getWriter()+"',subject='"
				+dto.getSubject()+"',content='"+dto.getContent()
				+"' where num="+dto.getNum();

		
		try {
			stmt=conn.createStatement();
				if(dto.getPhoto()==null)
					stmt.execute(sql2);			//photo 수정하지 않음.
				else
					stmt.execute(sql);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			}catch(SQLException e) {}
			
		}
	}

}



