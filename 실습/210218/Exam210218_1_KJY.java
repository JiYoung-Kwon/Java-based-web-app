/*
������ : 20210218
���� : 2->20 ���� ���μ� ���ظ� �Ѵ�. �ش� ���μ��� �迭�� �����Ѵ�. ���μ��� ����� �迭�� ������ ���� ����Ѵ�.
	2=2
	3=3
	4=2x2
	5=5
	6=2x3
	...
	20=2x2x5
������ : ������
*/

package exam;

import java.util.Arrays;
import java.util.Scanner;

public class Exam210218_1_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		for (int x = 2; x <= 20; x++) { // 2~20
			int[] arr = new int[5];
			int num = x;
			int i = 2, j = 0;
			System.out.print(x + "=");
			while (true) {
				if (num % i == 0) {
					arr[j] = i;
					System.out.printf("%d", arr[j]);
					num = num / i;

					if (num == 1)
						break;
					else {
						System.out.print("x");
						j++;
					}
				} else
					i++;
			}
			System.out.println();
		}
	}
}
