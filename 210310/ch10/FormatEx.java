package ch10;

import java.text.DecimalFormat;

public class FormatEx {
	public FormatEx() {
		String s1 = String.format("%d는 %c 학점입니다.\n", 100,'A');
		String temp = 100 + "는 " +'A'+" 학점입니다.\n";
		System.out.println(s1);
		System.out.println(temp);
		
		String s2 = String.format("%10.2f",123121.123456789);
		System.out.println("["+ s2+"]");
		
		String name = "권지영";
		String nicName = "찌요미";
		//'권지영'의 별명은 '찌요미'입니다.
		String fmt = "'%s'의 별명은 '%s'입니다.\n";
		String rst = String.format(fmt,name,nicName);
		System.out.println(rst);
		System.out.printf(fmt, "일지매","의적");
		
		//format 문자열을 사용하여 구구단 출력
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
