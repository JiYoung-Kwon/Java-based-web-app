/*
출제일 : 20210215
내용 : 임의의 수를 입력하고, 그 수의 약수를 배열에 저장한 후 출력하는 프로그램
제출자 : 권지영
*/

package exam;

import java.util.*;

public class Exam210215_1_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		int i = 1, j = 0;
		int[] arr = new int[1000];
		System.out.print("임의의 수 입력 : ");
		String tmp = scanner.nextLine();

		int num = Integer.parseInt(tmp);

		// 약수 구하기
		while (true) {
			if (i > num)
				break;
			if (num % i == 0) {
				arr[j] = i;
				j++;
			}
			i++;
		}
		for (int k = 0; k < j; k++)
			System.out.printf("%d, ",arr[k]);
	}

}
