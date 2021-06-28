package corona;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.MybaFactory;

public class CityDao {
	SqlSession sqlSession;

	public CityDao() {
		sqlSession = MybaFactory.getFactory().openSession();
	}

	// 데이터 삽입
	public String insert(CityVo vo) {
		String msg = "ok";
		try {
			sqlSession.insert("corona.insertC",vo);
		} catch (Exception ex) {
			msg=ex.toString();
			ex.printStackTrace();
			sqlSession.rollback();
		}
		return msg;
	}

	// 데이터 조회
	public List<CityVo> select() {
		List<CityVo> voList = null;

		try {
			voList = sqlSession.selectList("corona.searchC");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return voList;
	}
}
