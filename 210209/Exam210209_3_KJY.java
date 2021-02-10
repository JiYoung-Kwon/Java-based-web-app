package exam;

import java.util.*;

public class Exam210209_3_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int num = 0, max = 0, min = 0;
		int operand = 1;
		Scanner scanner = new Scanner(System.in);

		while (true) {
			System.out.print("6자리 정수 : ");
			num = scanner.nextInt();
			if (num >= 100000 && num < 1000000)
				break;
			else
				System.out.println("6자리 정수가 아닙니다. 다시 입력하세요");
		}

		System.out.print("추출할 최대, 최소 자릿수 : ");
		max = scanner.nextInt();
		min = scanner.nextInt();

		for (int i = 0; i < max; i++)
			operand = operand * 10;

		num = num % operand;
		operand = 1;

		for (int i = 0; i < min - 1; i++)
			operand = operand * 10;

		num = num / operand;

		System.out.println(num);
	}

}
