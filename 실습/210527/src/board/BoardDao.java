package board;

import java.io.Console;
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
	
	public static void main(String[] args) {
		new BoardDao();
	}
}
