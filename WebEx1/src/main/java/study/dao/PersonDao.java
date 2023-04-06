package study.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import db.DbConnect;
import study.dto.PersonDto;

public class PersonDao {
	DbConnect db=new DbConnect();
	
	// 1. insert 메서드
	public void insertPerson(PersonDto dto)
	{
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		String sql="insert into person values (null, ?, ?, ?, ?, ?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getBirthyear());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getJob());
			pstmt.setString(5, dto.getPhoto());
			
			//실행
			pstmt.execute();
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	// 2. delete 메서드
	public void deletePerson(int num)
	{
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		String sql="delete from person where num="+num;
		try {
			pstmt=conn.prepareStatement(sql);
			//실행
			pstmt.execute();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	// 3. get data 메서드
	public PersonDto getData(int num)
	{
		PersonDto dto=new PersonDto();
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from person where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setInt(1, num);
			//실행
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setBirthyear(rs.getInt("birthyear"));
				dto.setAddress(rs.getString("address"));
				dto.setJob(rs.getString("job"));
				dto.setPhoto(rs.getString("photo"));
			}
		}catch(SQLException e) {
			
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	// 4. update 메서드
	public void updatePerson(PersonDto dto)
	{
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		String sql="update person set name=?,birthyear=?,address=?,photo=?,job=? where num=?";
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getBirthyear());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getPhoto());
			pstmt.setString(5, dto.getJob());
			pstmt.setInt(6, dto.getNum());
			
			//실행
			pstmt.execute();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////

	
	// 5. db에서 데이터를 list에 담아서 리턴하는 메서드
 	public List<PersonDto> getAllPersons()
	{
		List<PersonDto> list=new Vector<>();
		Connection conn=db.getMysqlConnection();		//연결
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from person order by num asc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				PersonDto dto=new PersonDto();
					//dto에 데이터를 넣는다
					dto.setNum(rs.getInt("num"));
					dto.setName(rs.getString("name"));
					dto.setBirthyear(rs.getInt("birthyear"));
					dto.setAddress(rs.getString("address"));
					dto.setJob(rs.getString("job"));
					dto.setPhoto(rs.getString("photo"));
					
					//dto를 list에 추가한다.
					list.add(dto);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);				//닫기
		}
		
		return list;
	}
 	
 	public List<PersonDto> getSearchNamePersons(String sword)
	{
		List<PersonDto> list=new Vector<>();
		Connection conn=db.getMysqlConnection();		//연결
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from person where name like ? order by num asc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, "%"+sword+"%");
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				PersonDto dto=new PersonDto();
					//dto에 데이터를 넣는다
					dto.setNum(rs.getInt("num"));
					dto.setName(rs.getString("name"));
					dto.setBirthyear(rs.getInt("birthyear"));
					dto.setAddress(rs.getString("address"));
					dto.setJob(rs.getString("job"));
					dto.setPhoto(rs.getString("photo"));
					
					//dto를 list에 추가한다.
					list.add(dto);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);				//닫기
		}
		
		return list;
	}
}
