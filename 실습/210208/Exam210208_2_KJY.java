/*
������ : 20210208
���� : ������ 5�ڸ� �� �Է¹޾� ģȭ�� ������ �Ǻ��ϴ� ���α׷�
������ : ������
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

		System.out.print("������ ���� �Է��ϼ��� >");
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
			System.out.println("ģȭ���Դϴ�.");
		else
			System.out.println("ģȭ���� �ƴմϴ�.");
	}

}
