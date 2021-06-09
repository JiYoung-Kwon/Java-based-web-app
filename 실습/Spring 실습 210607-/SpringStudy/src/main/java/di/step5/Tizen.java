package di.step5;

public class Tizen implements DB{
	public Tizen() {
		System.out.println("Tizen database가 생성됨");
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		System.out.println("Tizen에서 회원정보가 삭제됨");
	}

}
