/*
출제일 : 20210208
내용 : 문제 4. 사용자로부터 숫자 입력받아 각 자리의 합을 구하는 예제
제출자 : 권지영
*/

package ch04;

import java.util.*;

public class FlowEx25 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int num = 0, sum = 0;
		Scanner scanner = new Scanner(System.in);

		num = scanner.nextInt();

		while (num != 0) {
			sum += num % 10;
			System.out.printf("num = %d, sum = %d\n", num, sum);
			num = num / 10;
		}
		System.out.printf("각 자리 수 합 = %d", sum);
	}

}
