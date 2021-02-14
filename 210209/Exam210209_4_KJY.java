/*
출제일 : 20210209
내용 : 2개의 정수를 입력 받는다. 입력 받은 2개의 수 중, 큰 수의 자릿수 값을 작은 수의 자릿수 값으로 치환하는 프로그램
제출자 : 권지영
*/

package exam;

import java.util.*;

public class Exam210209_4_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int num1 = 0, num2 = 0;
		int max = 0, min = 0;
		int cnt = 0;

		Scanner scanner = new Scanner(System.in);
		num1 = scanner.nextInt();
		num2 = scanner.nextInt();
		
		if (num1 > num2) {
			max = num1;
			min = num2;
		} else {
			max = num2;
			min = num1;
		}

		int tmp = min;

		while (true) {
			cnt++;
			if (tmp / 10 == 0)
				break;
			else
				tmp = tmp / 10;
		}
		int operand = 1;

		for (int i = 0; i < cnt; i++) {
			operand = operand * 10;
		}

		max = max - (max % operand);
		max = max + min;
		System.out.println("치환된 값 : " + max);
	}

}
