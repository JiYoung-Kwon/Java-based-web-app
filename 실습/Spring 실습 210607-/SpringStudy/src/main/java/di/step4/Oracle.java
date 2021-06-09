package di.step4;

public class Oracle implements DB{
	public Oracle() {
		System.out.println("Oracle database가 생성됨");
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		System.out.println("Oracle에서 회원정보가 검색됨");
	}

}
