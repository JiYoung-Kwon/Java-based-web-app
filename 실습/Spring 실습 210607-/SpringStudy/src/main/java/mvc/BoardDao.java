package mvc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.MybaFactory;

public class BoardDao {
	SqlSession sqlSession;
	public BoardDao() {
		sqlSession = MybaFactory.getFactory().openSession();
	}
	
	public String input(BoardVo vo) {
		String msg = "ok";
		System.out.println("BoardDao.input");
		System.out.println("mid : " + vo.getMid());
		System.out.println("phone : " + vo.getPhone());
		
		int totlist = sqlSession.selectOne("board.totList", "");
		System.out.println("totlist : " + totlist);
		return msg;
	}
	
	public List<BoardVo> search(Page page) {
		List<BoardVo> voList = null;
		int totList = sqlSession.selectOne("board.totList", page.getFindStr());
		System.out.println("totList : " + totList);
		page.setTotList(totList);
		page.compute();
		
		System.out.println(page.getStartNo());
		System.out.println(page.getEndNo());
		
		voList = sqlSession.selectList("board.search", page);
		
		System.out.println(voList.size());
		return voList;
	}
}
