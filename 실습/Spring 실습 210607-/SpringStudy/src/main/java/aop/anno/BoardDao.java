package aop.anno;

import java.util.List;

public class BoardDao implements Dao{

	@Override
	public int insert(Object o) {
		// TODO Auto-generated method stub
		System.out.println("게시물을 추가함");
		return 0;
	}

	@Override
	public List<Object> select(Object o) {
		// TODO Auto-generated method stub
		System.out.println("게시물을 조회함");
		return null;
	}

	@Override
	public int update(Object o) {
		// TODO Auto-generated method stub
		System.out.println("게시물을 수정함");
		return 0;
	}

	@Override
	public int delete(Object o) {
		// TODO Auto-generated method stub
		System.out.println("게시물을 삭제함");
		return 0;
	}

}
