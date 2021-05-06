package ch09;

import java.util.List;

public class Start {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// StringEx s = new StringEx();
		// StringSpeed ss = new StringSpeed();
		// ss.speedTest();
		// WrapperEx we = new WrapperEx();
		// List a = we.getList();
		// System.out.println(a);
		String[] data = { "123", "123.5", "abc", "abc123", "123abc", "홍길동", "홍길동abc", "홍길동abc123", "AAB", "abA",
				"abA12", "AAA12" };
		PatternEx pe = new PatternEx();

		// for(String d : data)
		// pe.numCheck(d);
		// pe.alphaCheck(d);

		String id = "abcdef";
		String pwd = "1234";
		// pe.idCheck(id, pwd); // 아이디가 영숫자 8자리이면 pass, 암호는 숫자 6자리이면 pass

		String phone = "02-1234-3491";
		// boolean b = pe.phoneCheck(phone);
		// if(b) System.out.println(phone+"은 정상적인 연락처입니다.");
		// else System.out.println(phone+"은 비정상적인 연락처입니다.");

		String email = "a1@naver.go.ac.kr";
		boolean b = pe.emailCheck(email);
		if (b)
			System.out.println(email + "은 정상적인 이메일입니다.");
		else
			System.out.println(email + "은 비정상적인 이메일입니다.");
	}
}
