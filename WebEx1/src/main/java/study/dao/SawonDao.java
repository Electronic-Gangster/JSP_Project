package study.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import db.DbConnect;
import study.dto.SawonDto;
import study.dto.ShopDto;


public class SawonDao {
DbConnect db=new DbConnect();
	
	public List<SawonDto> getSelectList(int select)
	{
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		
		List<SawonDto> list=new Vector<SawonDto>();
		
		if(select==1)
			sql="select * from sawon order by num asc";
		else if(select==2)
			sql="select * from sawon where gender='남자' order by num asc";
		else if(select==3)
			sql="select * from sawon where gender='여자' order by num asc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				SawonDto dto=new SawonDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setScore(rs.getInt("score"));
				dto.setBuseo(rs.getString("buseo"));
				dto.setGender(rs.getString("gender"));
				
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
		return dto;
	}
	
	//수정하는 매서드
	public void updateShop(ShopDto dto)
	{
		
	}
	
	//삭제하는 메서드
	public void deleteShop(int num)
	{
		
	}
	
}