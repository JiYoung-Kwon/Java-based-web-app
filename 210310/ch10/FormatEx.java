package ch10;

import java.text.DecimalFormat;

public class FormatEx {
	public FormatEx() {
		String s1 = String.format("%d�� %c �����Դϴ�.\n", 100,'A');
		String temp = 100 + "�� " +'A'+" �����Դϴ�.\n";
		System.out.println(s1);
		System.out.println(temp);
		
		String s2 = String.format("%10.2f",123121.123456789);
		System.out.println("["+ s2+"]");
		
		String name = "������";
		String nicName = "����";
		//'������'�� ������ '����'�Դϴ�.
		String fmt = "'%s'�� ������ '%s'�Դϴ�.\n";
		String rst = String.format(fmt,name,nicName);
		System.out.println(rst);
		System.out.printf(fmt, "������","����");
		
		//format ���ڿ��� ����Ͽ� ������ ���
		int dan = 2;
		String fmt2 = "%d x %d = %d";
		for(int i=1; i<10; i++) {
			rst = String.format(fmt2,dan,i,dan*i);
			System.out.println(rst);
		}
		
		double value = 1234567.899923;
		String pattern = "0,000,000,000,000.000";
		DecimalFormat df = new DecimalFormat(pattern);
		String fm3 = df.format(value);
		System.out.println(fm3);
	}
	
	public static void main(String args[]) {
		new FormatEx();
	}
}
