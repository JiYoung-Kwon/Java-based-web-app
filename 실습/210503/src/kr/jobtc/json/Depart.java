package kr.jobtc.json;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Depart {
	PreparedStatement ps;
	ResultSet rs;
	
	//부서코드를 입력받아 부서이름을 반환하는 메서드
	public String getDepart(String dno) {
		String json = "";
		try {
			Connection conn = new DBConn().getConn();
			String sql = "select * from departments where department_id =?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dno);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				String str = 
						String.format("{'dname' : '%s', 'mid': '%s', 'lid' : '%s'}",
								rs.getString("department_name"),
								rs.getInt("manager_id"),
								rs.getInt("location_id")								
								);
				json = str.replaceAll("'", "\"");
			}
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return json;
	}
}
