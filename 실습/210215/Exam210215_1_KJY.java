/*
������ : 20210215
���� : ������ ���� �Է��ϰ�, �� ���� ����� �迭�� ������ �� ����ϴ� ���α׷�
������ : ������
*/

package exam;

import java.util.*;

public class Exam210215_1_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		int i = 1, j = 0;
		int[] arr = new int[1000];
		System.out.print("������ �� �Է� : ");
		String tmp = scanner.nextLine();

		int num = Integer.parseInt(tmp);

		// ��� ���ϱ�
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
