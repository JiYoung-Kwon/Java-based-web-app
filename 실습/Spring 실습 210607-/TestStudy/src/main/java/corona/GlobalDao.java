package corona;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.MybaFactory;

public class GlobalDao {
	SqlSession sqlSession;

	public GlobalDao() {
		sqlSession = MybaFactory.getFactory().openSession();
	}

	// 데이터 삽입
	public String insert(GlobalVo vo) {
		String msg = "ok";
		try {
			sqlSession.insert("corona.insertG",vo);
		} catch (Exception ex) {
			msg=ex.toString();
			ex.printStackTrace();
			sqlSession.rollback();
		}
		return msg;
	}

	// 데이터 조회
	public List<GlobalVo> select() {
		List<GlobalVo> voList = null;
		try {
			voList = sqlSession.selectList("corona.searchG");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return voList;
	}
}
