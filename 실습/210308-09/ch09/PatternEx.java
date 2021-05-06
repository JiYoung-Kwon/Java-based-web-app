package ch09;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PatternEx {

	public void numCheck(String data) {
		String reg = "[0-9]*";
		Pattern p = Pattern.compile(reg);
		Matcher m = p.matcher(data);
		if (m.matches()) {
			System.out.println(data + "��" + reg + "�� �մ���.");
		} else {
			System.out.println(data + "�� �������� ��������");
		}
	}

	// �Ű������� ���޵� data�� ���������� �Ǻ��Ͽ� ��� (��ҹ��� ���� ����)
	public void alphaCheck(String data) {
		String reg = "[a-zA-Z]*";
		Pattern p = Pattern.compile(reg);
		Matcher m = p.matcher(data);
		if (m.matches()) {
			System.out.println(data + "��" + reg + "�� �մ���.");
		} else {
			System.out.println(data + "�� �������� ��������");
		}
	}

	public void idCheck(String id, String pwd) {
		String regId = "[a-zA-Z0-9]{8}";
		String regPwd = "[0-9]{6}";
		Pattern p = Pattern.compile(regId);
		Matcher m = p.matcher(id);
		if (m.matches()) {
			System.out.println("���̵� pass");
		} else {
			System.out.println("�������� ���̵��Դϴ�.");
		}
		p = Pattern.compile(regPwd);
		m = p.matcher(pwd);
		if (m.matches()) {
			System.out.println("��й�ȣ pass");
		} else {
			System.out.println("�������� ��й�ȣ�Դϴ�.");
		}
	}

	public boolean phoneCheck(String phone) {
		boolean b = false;
		// ������ȣ : 2�ڸ� or 3�ڸ�
		// ��� �ڸ� : 3�ڸ� ~ 4�ڸ�
		// ������ �ڸ� : 4�ڸ�
		String reg = "0[\\d]{1,2}-\\d{3,4}-\\d{4}";
		Pattern p = Pattern.compile(reg);
		Matcher m = p.matcher(phone);
		b = m.matches();
		return b;
	}

	public boolean emailCheck(String email) {
		boolean b = false;
		String reg = "^[a-zA-Z]+[\\w]+@[a-zA-Z]+(\\.[a-zA-Z_]+){1,3}$";
		//����� �����ؾߵǰ�(�ϳ� �̻�) + ���� ���� �� ����(�ϳ� �̻�) + @ + ����(�ϳ� �̻�) + . + ���� �ϳ� �̻� + ��
		Pattern p = Pattern.compile(reg);
		Matcher m = p.matcher(email);
		b = m.matches();
		return b;
	}
}
