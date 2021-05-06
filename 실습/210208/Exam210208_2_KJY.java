/*
출제일 : 20210208
내용 : 임의의 5자리 수 입력받아 친화수 인지를 판별하는 프로그램
제출자 : 권지영
*/

package exam;

import java.util.*;

public class Exam210208_2_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		boolean isYes = true;
		int num1;
		int num2 = 10000;

		Scanner scanner = new Scanner(System.in);

		System.out.print("임의의 수를 입력하세요 >");
		num1 = scanner.nextInt();

		for (int i = 1; i <= 5; i++) {
			if ((num1 / num2) % i == 0) {
				num2 = num2 / 10;
			} else {
				isYes = false;
				break;
			}
		}

		if (isYes)
			System.out.println("친화수입니다.");
		else
			System.out.println("친화수가 아닙니다.");
	}

}
