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
		String[] data = { "123", "123.5", "abc", "abc123", "123abc", "ȫ�浿", "ȫ�浿abc", "ȫ�浿abc123", "AAB", "abA",
				"abA12", "AAA12" };
		PatternEx pe = new PatternEx();

		// for(String d : data)
		// pe.numCheck(d);
		// pe.alphaCheck(d);

		String id = "abcdef";
		String pwd = "1234";
		// pe.idCheck(id, pwd); // ���̵� ������ 8�ڸ��̸� pass, ��ȣ�� ���� 6�ڸ��̸� pass

		String phone = "02-1234-3491";
		// boolean b = pe.phoneCheck(phone);
		// if(b) System.out.println(phone+"�� �������� ����ó�Դϴ�.");
		// else System.out.println(phone+"�� ���������� ����ó�Դϴ�.");

		String email = "a1@naver.go.ac.kr";
		boolean b = pe.emailCheck(email);
		if (b)
			System.out.println(email + "�� �������� �̸����Դϴ�.");
		else
			System.out.println(email + "�� ���������� �̸����Դϴ�.");
	}
}
