package corona;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.MybaFactory;

public class GenderAgeDao {
	SqlSession sqlSession;

	public GenderAgeDao() {
		sqlSession = MybaFactory.getFactory().openSession();
	}

	// 데이터 삽입
	public String insert(GenderAgeVo vo) {
		String msg = "ok";
		try {
			sqlSession.insert("corona.insertGA",vo);
		} catch (Exception ex) {
			msg=ex.toString();
			ex.printStackTrace();
			sqlSession.rollback();
		}
		return msg;
	}

	// 데이터 조회
	public List<GenderAgeVo> select() {
		List<GenderAgeVo> voList = null;
		try {
			voList = sqlSession.selectList("corona.searchGA");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return voList;
	}
}
