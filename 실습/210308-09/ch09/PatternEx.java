package ch09;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PatternEx {

	public void numCheck(String data) {
		String reg = "[0-9]*";
		Pattern p = Pattern.compile(reg);
		Matcher m = p.matcher(data);
		if (m.matches()) {
			System.out.println(data + "는" + reg + "에 합당함.");
		} else {
			System.out.println(data + "는 부적절한 데이터임");
		}
	}

	// 매개변수로 전달된 data가 영문자인지 판별하여 출력 (대소문자 구분 없음)
	public void alphaCheck(String data) {
		String reg = "[a-zA-Z]*";
		Pattern p = Pattern.compile(reg);
		Matcher m = p.matcher(data);
		if (m.matches()) {
			System.out.println(data + "는" + reg + "에 합당함.");
		} else {
			System.out.println(data + "는 부적절한 데이터임");
		}
	}

	public void idCheck(String id, String pwd) {
		String regId = "[a-zA-Z0-9]{8}";
		String regPwd = "[0-9]{6}";
		Pattern p = Pattern.compile(regId);
		Matcher m = p.matcher(id);
		if (m.matches()) {
			System.out.println("아이디 pass");
		} else {
			System.out.println("부적절한 아이디입니다.");
		}
		p = Pattern.compile(regPwd);
		m = p.matcher(pwd);
		if (m.matches()) {
			System.out.println("비밀번호 pass");
		} else {
			System.out.println("부적절한 비밀번호입니다.");
		}
	}

	public boolean phoneCheck(String phone) {
		boolean b = false;
		// 지역번호 : 2자리 or 3자리
		// 가운데 자리 : 3자리 ~ 4자리
		// 마지막 자리 : 4자리
		String reg = "0[\\d]{1,2}-\\d{3,4}-\\d{4}";
		Pattern p = Pattern.compile(reg);
		Matcher m = p.matcher(phone);
		b = m.matches();
		return b;
	}

	public boolean emailCheck(String email) {
		boolean b = false;
		String reg = "^[a-zA-Z]+[\\w]+@[a-zA-Z]+(\\.[a-zA-Z_]+){1,3}$";
		//영어로 시작해야되고(하나 이상) + 숫자 영어 다 가능(하나 이상) + @ + 영어(하나 이상) + . + 영어 하나 이상 + 끝
		Pattern p = Pattern.compile(reg);
		Matcher m = p.matcher(email);
		b = m.matches();
		return b;
	}
}
