package board;

import java.io.Console;
import java.io.File;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.MybaFactory;

public class BoardDao {
	SqlSession sqlSession;
	
	public BoardDao() {
		try {	
			sqlSession = MybaFactory.getFactory().openSession();
			
			if(sqlSession == null) {
				System.out.println("sqlSession 생성 시 오류 발생");
			}else {
				System.out.println("정상적으로 sqlSession이 생성됨.");
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public List<BoardVo> select(Page page){
		List<BoardVo> list = null;
		
		try {
			int totList = sqlSession.selectOne("board.totList", page.getFindStr());
			page.setTotList(totList);
			page.compute();
			
			System.out.println(page.getStartNo());
			System.out.println(page.getEndNo());
			list = sqlSession.selectList("board.search", page);
			sqlSession.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	public String insert(BoardVo vo) {
		String msg = "OK";
		
		try {
			int serial = sqlSession.selectOne("board.brd_getSerial");
			vo.setSerial(serial);
			int r = sqlSession.insert("board.brd_insert",vo);
			if(r>0) { // 정상이면 첨부파일 저장
				int chkCnt = 0; //첨부파일의 수만큼 실행된 쿼리의 수
				for(BoardAttVo v : vo.getAttList()) {
					v.setpSerial(serial);
					chkCnt += sqlSession.insert("board.brdAtt_insert", v);
				}
				
				if(chkCnt == vo.getAttList().size()) {
					sqlSession.commit();
				}else {
					throw new Exception();
				}
			}else {
				throw new Exception();
			}
		}catch(Exception ex) {
			msg = ex.toString();
			ex.printStackTrace();
			sqlSession.rollback();
			
			for(BoardAttVo delVo : vo.getAttList()) {
				File f = new File(BoardFileUpload.saveDir + delVo.getSysAtt());
				if(f.exists()) f.delete();
			}
		}finally {
			sqlSession.close();
		}
		
		return msg;
	}
	
	public String update(BoardVo vo) {
		String msg = "OK";
		
		try {
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return msg;
	}
	
	public String repl(BoardVo vo) {
		String msg = "OK";
		
		try {
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return msg;
	}
	
	public BoardVo view(int serial) {
		BoardVo vo = new BoardVo();
		
		try {
			sqlSession.update("board.brd_hitUp", serial);
			sqlSession.commit();
			
			vo = sqlSession.selectOne("board.brd_view", serial);
			List<BoardAttVo> attList = sqlSession.selectList("board.brdAtt_view",serial);
			
			vo.setAttList(attList);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return vo;
	}
	
	public String delete(int serial) {
		String msg = "OK";
		
		try {
			BoardVo vo = new BoardVo();
			
			vo = sqlSession.selectOne("board.brd_view", serial);
			List<BoardAttVo> attList = sqlSession.selectList("board.brdAtt_view",serial);
			
			vo.setAttList(attList);
		
			//board 테이블 삭제
			int r = sqlSession.delete("board.brd_delete",vo);
			
			if(r>0) { // 정상이면 첨부파일 삭제
				int chkCnt = 0; //첨부파일의 수만큼 실행된 쿼리의 수
				for(BoardAttVo v : vo.getAttList()) {
					//pSerial 설정
					v.setpSerial(serial);
					//pSerial이 동일한 데이터 삭제
					chkCnt += sqlSession.delete("board.brdAtt_delete", serial);
					
					File f = new File(BoardFileUpload.saveDir + v.getSysAtt());
					if(f.exists()) f.delete();				
				}
				
				if(chkCnt == vo.getAttList().size()) {
					sqlSession.commit();
				}else {
					throw new Exception();
				}
			}else {
				throw new Exception();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			sqlSession.rollback();
		}
		
		return msg;
	}
	
	public static void main(String[] args) {
		new BoardDao();
	}
}
