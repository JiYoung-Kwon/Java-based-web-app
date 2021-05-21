package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MemberDao {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public MemberDao(Connection conn) {
		this.conn = conn;
	}
	
	public List<MemberVo> select(Page page){
		List<MemberVo> list = new ArrayList<MemberVo>();
		String sql = "select * from member";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberVo vo = new MemberVo();
				vo.setMid(rs.getString("mid"));
				vo.setIrum(rs.getString("irum"));
				vo.setPhone(rs.getString("phone"));
				vo.setAccount(rs.getString("account"));
				vo.setHost(rs.getString("host"));
				list.add(vo);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
	
	public int insert(MemberVo vo) {
		int r =0;
		String sql = "insert into member(mid, irum, pwd, phone, post, address, address2, account, host, photo)"
				   + " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMid());
			ps.setString(2, vo.getIrum());
			ps.setString(3, vo.getPwd());
			ps.setString(4, vo.getPhone());
			ps.setString(5, vo.getPost());
			ps.setString(6, vo.getAddress());
			ps.setString(7, vo.getAddress2());
			ps.setString(8, vo.getAccount());
			ps.setString(9, vo.getHost());
			ps.setString(10, vo.getPhoto());
			
			r= ps.executeUpdate();
			
			if(r>0) {
				conn.commit();
			}else {
				conn.rollback();
			}
			ps.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return r;
	}
}
