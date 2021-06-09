package di.exam1;

import java.util.List;

public class RegisterMember implements Member{

	@Override
	public int insert(Object o) {
		// TODO Auto-generated method stub
		System.out.println("회원 정보를 추가함");
		return 0;
	}

	@Override
	public List<Object> select(Object o) {
		// TODO Auto-generated method stub
		System.out.println("회원 정보를 조회함");
		return null;
	}

	@Override
	public int update(Object o) {
		// TODO Auto-generated method stub
		System.out.println("회원 정보를 수정함");
		return 0;
	}

	@Override
	public int delete(Object o) {
		// TODO Auto-generated method stub
		System.out.println("회원 정보를 삭제함");
		return 0;
	}


}
