/*
출제일 : 20210209
내용 : 임의의 수를 입력 받아 소인수분해를 하는 프로그램
제출자 : 권지영
*/

package exam;

import java.util.*;

public class Exam210209_2_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int num = 0;
		int i = 2;
		Scanner scanner = new Scanner(System.in);
		System.out.print("입력 : ");
		num = scanner.nextInt();

		while (true) {
			if (num % i == 0) {
				System.out.printf("%d", i);
				num = num / i;

				if (num == 1)
					break;
				else
					System.out.print("x");
			} else
				i++;
		}
	}
}
