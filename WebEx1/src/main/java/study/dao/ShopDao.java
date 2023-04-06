package study.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import db.DbConnect;
import study.dto.ShopDto;

public class ShopDao {
	DbConnect db=new DbConnect();
	
	//1. insert 메서드
	public void insertShop(ShopDto dto)
	{
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		String sql="insert into shop values (null,?,?,?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(sql);
			//1.바인딩
			pstmt.setString(1, dto.getSangpum());
			pstmt.setString(2, dto.getColor());
			pstmt.setString(3, dto.getPhoto());
			pstmt.setInt(4, dto.getSu());
			pstmt.setInt(5, dto.getDan());
			pstmt.setString(6, dto.getIpgoday());
			
			//2. 실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//2. 출력 및 검색 매서드
	public List<ShopDto> getSangpumList(String search)
	{
		List<ShopDto> list=new Vector<ShopDto>();
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from shop where sangpum like ? order by num desc";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, "%"+search+"%");
			
			//실행
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ShopDto dto= new ShopDto();
				dto.setNum(rs.getInt("num"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setColor(rs.getString("color"));
				dto.setPhoto(rs.getString("photo"));
				dto.setSu(rs.getInt("su"));
				dto.setDan(rs.getInt("dan"));
				dto.setIpgoday(rs.getString("ipgoday"));
				
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
	
	//데이터 1개만 불러오는 방법
		public ShopDto getSangpum(int num)
		{
			ShopDto dto=new ShopDto();
			Connection conn=db.getMysqlConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="select *from shop where num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				//바인딩
				pstmt.setInt(1, num);
				
				//실행
				rs=pstmt.executeQuery();
				if(rs.next())
				{
					dto.setNum(rs.getInt("num"));
					dto.setSangpum(rs.getString("sangpum"));
					dto.setColor(rs.getString("Color"));
					dto.setPhoto(rs.getString("Photo"));
					dto.setSu(rs.getInt("su"));
					dto.setDan(rs.getInt("dan"));
					dto.setIpgoday(rs.getString("ipgoday"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return dto;
		}
		
		//수정하는 매서드
		public void updateShop(ShopDto dto)
		{
			Connection conn=db.getMysqlConnection();
			PreparedStatement pstmt=null;
			String sql="update shop set sangpum=?, su=?, dan=?, ipgoday=?, photo=? where num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				//바인딩
				pstmt.setString(1, dto.getSangpum());
				pstmt.setInt(2, dto.getSu());
				pstmt.setInt(3, dto.getDan());
				pstmt.setString(4, dto.getColor());
				pstmt.setString(5, dto.getIpgoday());		
				pstmt.setString(6, dto.getPhoto());
				pstmt.setInt(7, dto.getNum());
				
				//실행
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			
		}
		
		//삭제하는 메서드
		public void deleteShop(int num)
		{
			Connection conn=db.getMysqlConnection();
			PreparedStatement pstmt=null;
			String sql="delete from shop where num=?";
					
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
		
}