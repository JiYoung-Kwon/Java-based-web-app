package aop.step3;


public class Mysql implements DB{

	
	public Mysql() {
		System.out.println("Mysql database가 생성됨");
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		System.out.println("Mysql에서 회원정보를 추가함");
	}
}
