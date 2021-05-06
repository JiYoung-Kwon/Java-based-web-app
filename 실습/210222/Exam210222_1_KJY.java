package exam;

import java.util.Arrays;

public class Exam210222_1_KJY {

	public static void main(String[] args) {
		forMethod();
	}

	static void forMethod() { // 2~20 for문
		for (int num = 2; num <= 20; num++) {
			int[] arr = whileMethod(num);

			// 연산 결과 및 오류 검사
			// System.out.println(num + " " + Arrays.toString(arr));

			printMethod(num, arr);
		}
	}

	static int[] whileMethod(int num) { // 소인수분해
		int[] arr = new int[5];
		int i = 2, j = 0;

		while (true) {
			if (num % i == 0) {
				arr[j] = i;
				num = num / i;

				if (num == 1)
					break;
				else
					j++;
			} else
				i++;
		}
		// 연산 결과 및 오류 검사
		// System.out.println(Arrays.toString(arr));

		return arr;

	}

	static void printMethod(int num, int[] arr) { // 출력 메소드

		// 연산 결과 및 오류 검사
		// System.out.println(num + " " + Arrays.toString(arr));
		
		System.out.print(num + "=");
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] != 0) {
				System.out.printf("%d", arr[i]);
				if (arr[i + 1] != 0)
					System.out.print("x");
			}
		}
		System.out.println();
	}
}
