/*
������ : 20210208
���� : ���� 4. ����ڷκ��� ���� �Է¹޾� �� �ڸ��� ���� ���ϴ� ����
������ : ������
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
		System.out.printf("�� �ڸ� �� �� = %d", sum);
	}

}
