/*
출제일 : 20210218
내용 : 예제 5-23(p227) 안에 있는 for 문을 forMethod(), 그 for 문 안에 있는 if~else 문을 ifElseMethod() 로 분할하여 구현
제출자 : 권지영
*/

package exam;

import java.util.*;

public class Exam210218_5_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String[][] words = {
				{"chair","의자"},
				{"computer","컴퓨터"},
				{"integer","정수"}
		};
		
		Scanner scanner = new Scanner(System.in);
		
		forMethod(words, scanner);
	}
	static void forMethod(String[][] words, Scanner scanner) {
		for(int i=0; i<words.length; i++) {
			System.out.printf("Q%d. %s의 뜻은?", i+1, words[i][0]);
			
			String tmp = scanner.nextLine();
			
			ifElseMethod(tmp,words,i);
		}
	}
	static void ifElseMethod(String tmp, String[][] words, int i) {
		if(tmp.equals(words[i][1])) {
			System.out.printf("정답입니다. %n%n");
		}
		else {
			System.out.printf("틀렸습니다. 정답은 %s입니다. %n%n",words[i][1]);
		}
	}
}
