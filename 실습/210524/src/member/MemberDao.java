package member;

import java.io.File;
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
	
	public int getTotList(String findStr) {
		int totList = 0;
		String sql = "select count(mid) totList from member "
				   + "where mid = ? "
				   + "or irum like ? "
				   + "or phone like ? "
				   + "or address like ? ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, findStr);
			ps.setString(2, "%" + findStr + "%");
			ps.setString(3, "%" + findStr + "%");
			ps.setString(4, "%" + findStr + "%");
			
			rs = ps.executeQuery();
			if(rs.next()) {
				totList = rs.getInt("totList");
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return totList;
	}
	
	
	public List<MemberVo> select(Page page){
		String findStr = page.getFindStr();
		page.setTotList(getTotList(findStr));
		page.compute();
		
		System.out.println("startNO" + page.getStartNo());
		System.out.println("endNO" + page.getEndNo());
		
		List<MemberVo> list = new ArrayList<MemberVo>();
		String sql = "select * from ("
				   + "		select rownum rno, m.* from ("
				   + "             select * from member "
				   + "			   where mid = ? "
				   + "             or irum like ? "
				   + "			   or phone like ? "
				   + "			   or address like ? "
				   + "             order by irum asc "
				   + "		)m "
				   + ") "
				   + " where rno between ? and ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, findStr);
			ps.setString(2, "%" + findStr + "%");
			ps.setString(3, "%" + findStr + "%");
			ps.setString(4, "%" + findStr + "%");
			ps.setInt(5,  page.getStartNo());
			ps.setInt(6, page.getEndNo());			
			
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberVo vo = new MemberVo();
				vo.setRno(rs.getInt("rno"));
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
			conn.setAutoCommit(false);
			
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
	
	public MemberVo view(String mid) {
		MemberVo vo = new MemberVo();
		String sql = "select * from member where mid = ? ";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mid);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				vo.setMid(rs.getString("mid"));
				vo.setIrum(rs.getString("irum"));
				vo.setPhone(rs.getString("phone"));
				vo.setPost(rs.getString("post"));
				vo.setAddress(rs.getString("address"));
				vo.setAddress2(rs.getString("address2"));
				vo.setAccount(rs.getString("account"));
				vo.setHost(rs.getString("host"));
				vo.setPhoto(rs.getString("photo"));
			}
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return vo;
	}
	
	// 1) 삭제하기 전에 첨부파일 정보를 가져옴.
	// 2) 데이터 삭제
	// 3) 파일 삭제
	public void delete(MemberVo vo) {
		int r =0;
		String sql = "";
		String delPath = FileUpload.saveDir;
		
		try {
			conn.setAutoCommit(false);
			//첨부파일 정보 가져오기
			sql = "select photo from member where mid =? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMid());
			rs = ps.executeQuery();
			
			if(rs.next()) {
				delPath += rs.getString("photo");
			}
			
			//데이터 삭제
			sql = "delete from member where mid = ? and pwd = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMid());
			ps.setString(2, vo.getPwd());
			
			r= ps.executeUpdate();
			if(r>0) {
				conn.commit();

				//파일 삭제
				File file = new File(delPath);
				if(file.exists()) file.delete();
			}else {
				conn.rollback();
			}
			rs.close();
			ps.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	// 1) 기존 이미지 파일명을 가져옴
	// 2) 내용을 업데이트
	// 3) 기존 이미지 삭제
	public int update(MemberVo vo) {
		int r = 0;
		String sql = "";
		String delPath = FileUpload.saveDir;
		String photo = "";
		try {
			conn.setAutoCommit(false);
			
			// 기존 이미지 파일명 가져오기
			sql = "select photo from member where mid = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1,	vo.getMid());
			
			rs=ps.executeQuery();
			if(rs.next()) {
				photo = rs.getString("photo");
			}
			
			//내용 업데이트
			sql = " update member "
				+ " set irum = ?, phone = ?, post = ?, address = ?,"
				+ "		address2 = ?, account = ?, host = ? ";
			
			if(!(vo.getPhoto() == null || vo.getPhoto().equals(""))) {
				sql += " , photo = '" + vo.getPhoto() + "' ";
			} 
			
			sql += " where mid = ? and pwd =? ";
			
	
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getIrum());
			ps.setString(2, vo.getPhone());
			ps.setString(3, vo.getPost());
			ps.setString(4, vo.getAddress());
			ps.setString(5, vo.getAddress2());
			ps.setString(6, vo.getAccount());
			ps.setString(7, vo.getHost());
			ps.setString(8, vo.getMid());
			ps.setString(9, vo.getPwd());
			
			r= ps.executeUpdate();
			if(r>0) {
				File file = new File(delPath + photo);
				if(file.exists()) file.delete();
				conn.commit();
			}else {
				File file = new File(delPath + vo.getPhoto());
				if(file.exists()) file.delete();
				conn.rollback();
			}
					
			rs.close();
			ps.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return r;
	}
}
