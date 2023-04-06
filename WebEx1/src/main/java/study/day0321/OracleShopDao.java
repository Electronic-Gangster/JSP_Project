package study.day0321;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import db.DbConnect;

public class OracleShopDao {
	DbConnect db=new DbConnect();
	
	//1. db에서 데이터를 list에 담아서 리턴하는 메서드
	public List<OracleShopDto> getAllSangpums()
	{
		List<OracleShopDto> list=new Vector<>();
		Connection conn=db.getOracleConnection();		//연결
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from shop order by num asc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				OracleShopDto dto=new OracleShopDto();
					//dto에 데이터를 넣는다
					dto.setNum(rs.getInt("num"));
					dto.setSangpum(rs.getString("sangpum"));
					dto.setColor(rs.getString("color"));
					dto.setSu(rs.getInt("su"));
					dto.setDan(rs.getInt("dan"));
					dto.setToday(rs.getTimestamp("today"));
					
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
