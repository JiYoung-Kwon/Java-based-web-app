package exam;

import java.util.Scanner;

public class Exam210208_3_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for (int i = 1; i <= 999; i++) {
			int sum = 0;
			int num = i;

			for (int j = 1; j < num; j++) {
				if (num % j == 0)
					sum += j;
			}
			if (num == sum)
				System.out.println(num);
		}
	}
}
