/*
������ : 20210210
���� : ���ĺ��� ���ڸ� �־��� ��ȣǥ�� ��ȣȭ�ϴ� ���α׷�
������ : ������
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

		// ���ڿ� src�� ���ڸ� charAt()���� �ϳ��� �о ��ȯ �� result�� ����
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