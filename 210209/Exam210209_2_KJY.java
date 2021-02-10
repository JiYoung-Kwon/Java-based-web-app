package exam;

import java.util.*;

public class Exam210209_2_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int num = 0;
		int i = 2;
		Scanner scanner = new Scanner(System.in);
		System.out.print("ют╥б : ");
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
