package chap10;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.jobtc.json.DBConn;

public class StudentDao {
	Connection conn;
	public StudentDao() {
		this.conn = new DBConn().getConn();
	}
	
	public StudentVo login(String mid, String pwd) {
		StudentVo vo = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from student where mid=? and pwd=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mid);
			ps.setString(2, pwd);
			
			rs = ps.executeQuery();		
			if(rs.next()) {
				vo = new StudentVo();
				vo.setMid(rs.getString("mid"));
				vo.setIrum(rs.getString("irum"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setPwd(rs.getString("pwd"));
				vo.setGrade(rs.getInt("grade"));
			}
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return vo;
	}
}
