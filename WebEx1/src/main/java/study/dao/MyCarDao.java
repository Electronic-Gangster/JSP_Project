package study.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import db.DbConnect;
import study.dto.MyCarDto;


public class MyCarDao {
	DbConnect db=new DbConnect();
	
	//1. insert 매서드
	public void insertMycar(MyCarDto dto)
	{
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		String sql="insert into mycar values (null, ?, ?, ?, ?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getCarname());
			pstmt.setInt(2, dto.getCarprice());
			pstmt.setString(3, dto.getCarphoto());
			pstmt.setString(4, dto.getGuipday());
			
			//실행
			pstmt.execute();
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	// 2. delete 메서드
		public void deleteMycar(int num)
		{
			Connection conn=db.getMysqlConnection();
			PreparedStatement pstmt=null;
			String sql="delete from mycar where num="+num;
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
		
		// 5. db에서 데이터를 list에 담아서 리턴하는 메서드
	 	public List<MyCarDto> getAllCars()
		{
			List<MyCarDto> list=new Vector<>();
			Connection conn=db.getMysqlConnection();		
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from mycar order by num asc";
			
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next())
				{
					MyCarDto dto=new MyCarDto();
						//dto에 데이터를 넣는다
						dto.setNum(rs.getInt("num"));
						dto.setCarname(rs.getString("carname"));
						dto.setCarprice(rs.getInt("carprice"));
						dto.setCarphoto(rs.getString("carphoto"));
						dto.setGuipday(rs.getString("guipday"));
						
						//dto를 list에 추가한다.
						list.add(dto);
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);				
			}
			
			return list;
		}
	 	
	 	
	}