package aop.step2;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Tizen implements DB{
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E) hh:mm:ss:SS");
	
	public Tizen() {
		System.out.println("Tizen database가 생성됨");
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		System.out.println("log : " + sdf.format(new Date()));
		System.out.println("Tizen에서 회원정보가 삭제됨");
	}

}
