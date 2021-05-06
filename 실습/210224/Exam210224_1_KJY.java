/*
출제일 : 20210224
내용 : 교집합, 합집합 구현 프로그램 소스를 밑의 조건으로 수정하시오.
	//size 크기의 배열 생성 메서드 추가
   	arr1= createMethod(int size):return arr

	// 배열에 start~end 범위의 무작위수 입력 메서드로 변경
	randomMethod(int[] arr, int start, int end)
제출자 : 권지영
*/

package exam;

import java.util.Arrays;
import java.util.Scanner;

public class Exam210224_1_KJY {
	public static void main(String[] args) {
		int num1 = 0, num2 = 0;

		// 입력 받기
		num1 = inputMethod();
		num2 = inputMethod();

		// 두 배열 생성
		int[] arr1 = createMethod(num1);
		int[] arr2 = createMethod(num2);
		int hapSize = num1 + num2;

		Scanner scanner = new Scanner(System.in);
		
		System.out.println("시작 범위 입력 >");
		String tmp = scanner.nextLine();
		int start = Integer.parseInt(tmp);
		System.out.println("종료 범위 입력 >");
		tmp = scanner.nextLine();
		int end = Integer.parseInt(tmp);
		
		// 1~10 무작위 저장
		randomMethod(arr1, start, end);
		randomMethod(arr2, start, end);

		// 합집합 크기 구하기
		hapSize = hapSize(arr1, arr2, hapSize);

		// 합집합, 교집합 생성
		int[] hap = new int[hapSize]; // 합집합
		int[] kyo = new int[num1 + num2 - hapSize]; // 교집합

		// 합집합, 교집합 값 저장
		hapKyoMethod(arr1, arr2, hap, kyo);

		// 출력
		printMethod(arr1, arr2, hap, kyo);
	}

	static int inputMethod() {
		int num = 0;
		Scanner scanner = new Scanner(System.in);
		while (true) {
			System.out.println("1~10 범위 정수 입력 후 엔터>");
			String tmp = scanner.nextLine();
			num = Integer.parseInt(tmp);
			if (num < 1 || num > 10) {
				System.out.println("범위를 벗어났습니다. 다시 입력하세요");
			} else
				break;
		}

		return num;
	}

	static void randomMethod(int[] arr, int start, int end) {
		int range = end - start + 1;
		for (int i = 0; i < arr.length; i++) {
			arr[i] = (int) ((Math.random() * range) + start);
			for (int j = 0; j < i; j++) {
				if (arr[i] == arr[j]) { // 중복검사
					arr[i] = (int) ((Math.random() * 10) + 1);
					i--;
				}
			}
		}
	}

	static int hapSize(int[] arr1, int[] arr2, int hapSize) {
		for (int i = 0; i < arr1.length; i++) {
			for (int j = 0; j < arr2.length; j++) {
				if (arr1[i] == arr2[j]) {// 중복이라면
					hapSize--;
				}
			}
		}
		return hapSize;
	}

	static void hapKyoMethod(int[] arr1, int[] arr2, int[] hap, int[] kyo) {
		int i = 0, k = 0;

		for (int x = 0; x < arr1.length; x++) {
			hap[i] = arr1[x];
			i++;
		}

		for (int x = 0; x < arr2.length; x++) {
			boolean isSame = false;
			for (int y = 0; y < arr1.length; y++) {
				if (arr1[y] == arr2[x]) {
					isSame = true;
				}
			}
			if (!isSame) {
				hap[i] = arr2[x];
				i++;
			} else// isSame
			{
				kyo[k] = arr2[x];
				k++;
			}
		}
	}

	static void printMethod(int[] arr1, int[] arr2, int[] hap, int[] kyo) {
		System.out.println("arr1 = " + Arrays.toString(arr1));
		System.out.println("arr2 = " + Arrays.toString(arr2));
		System.out.println("합집합 = " + Arrays.toString(hap));
		System.out.println("교집합 = " + Arrays.toString(kyo));
	}

	static int[] createMethod(int size) {
		int[] arr = new int[size];
		return arr;
	}

}
