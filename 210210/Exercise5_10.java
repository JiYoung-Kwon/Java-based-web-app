/*
출제일 : 20210210
내용 : 알파벳과 숫자를 주어진 암호표로 암호화하는 프로그램
제출자 : 권지영
*/

package ch05;

public class Exercise5_10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		char[] abcCode = { '`', '~', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '+', '=', '|', '[',
				']', '{', '}', ';', ':', ',', '.', '/' };
		// 0 1 2 3 4 5 6 7 8 9
		char[] numCode = { 'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p' };
		String src = "abc123";
		String result = "";

		// 문자열 src의 문자를 charAt()으로 하나씩 읽어서 변환 후 result에 저장
		for (int i = 0; i < src.length(); i++) {
			char ch = src.charAt(i);
			if (ch >= '0' &&  ch <= '9')
				result += numCode[ch-'0'];
			else
				result += abcCode[ch-'a'];
		}
		System.out.println("src:" + src);
		System.out.println("result:" + result);
	}

}
