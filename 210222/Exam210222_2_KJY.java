/*
출제일 : 20210222
내용 : (기능분할)
	int [] arr1, int [] arr2 는 모두 크기 10인 배열이다. 두 배열 모두 0~9 범위에서 임의의 수를 저장한 후, 정렬한다.
	0 값을 제외한 두 배열의 모든 수만큼의 크기를 가진 int [] arr3 에 0을 제외한 두 배열의 정렬된 수를 저장하는 프로그램을 구현하시오.
제출자 : 권지영
*/

package exam;

import java.util.Arrays;

public class Exam210222_2_KJY {

	public static void main(String[] args) {
		// 크기 10 배열 생성
		int[] arr1 = new int[10];
		int[] arr2 = new int[10];

		// arr1, arr2 임의의 수 저장
		randomMethod(arr1, arr2);

		// arr1, arr2 정렬하기
		sortMethod(arr1, arr2);

		// arr3 크기 구하기 및 생성
		int[] arr3 = arr3Method(arr1, arr2);

		// arr3 값 저장 (0을 제외한)
		initArr3Method(arr1, arr2, arr3);

		// arr3 정렬
		sortMethod(arr3);

		// 출력
		System.out.println("arr1= " + Arrays.toString(arr1));
		System.out.println("arr2= " + Arrays.toString(arr2));
		System.out.println("arr3= " + Arrays.toString(arr3));

	}

	static void randomMethod(int[] arr1, int[] arr2) {
		for (int i = 0; i < 10; i++) {
			arr1[i] = (int) (Math.random() * 10);
			arr2[i] = (int) (Math.random() * 10);
		}
		// 연산 결과 및 오류 검사
		// System.out.println("arr1= " + Arrays.toString(arr1));
		// System.out.println("arr2= " + Arrays.toString(arr2));
	}

	static void sortMethod(int[] arr1, int[] arr2) {
		for (int i = 0; i < 10; i++) {
			boolean changed = false; // 자리바꿈 체크

			for (int j = 0; j < 9; j++) {
				if (arr1[j] > arr1[j + 1]) {
					int temp = arr1[j];
					arr1[j] = arr1[j + 1];
					arr1[j + 1] = temp;
					changed = true;
				}
				if (arr2[j] > arr2[j + 1]) {
					int temp = arr2[j];
					arr2[j] = arr2[j + 1];
					arr2[j + 1] = temp;
					changed = true;
				}
			}
			if (!changed)
				break;
		}

		// 연산 결과 및 오류 검사
		// System.out.println("arr1= " + Arrays.toString(arr1));
		// System.out.println("arr2= " + Arrays.toString(arr2));
	}

	static int[] arr3Method(int[] arr1, int[] arr2) {
		int totalLength = 0;
		// arr3 크기 구하기
		for (int i = 0; i < 10; i++) {
			if (arr1[i] != 0)
				totalLength++;
			if (arr2[i] != 0)
				totalLength++;
		}

		// arr3 배열 생성
		int[] arr3 = new int[totalLength];

		// 배열 생성 확인
		// System.out.println("arr3= " + Arrays.toString(arr3));
		return arr3;
	}

	static void initArr3Method(int[] arr1, int[] arr2, int[] arr3) {
		int index = 0;
		
		// arr1 -> arr3 배열 저장		
		for (int i = 0; i < 10; i++) {
			if (arr1[i] != 0) {
				arr3[index] = arr1[i];
				index++;
			}
		}

		// arr2 -> arr3 배열 저장
		for (int i = 0; i < 10; i++) {
			if (arr2[i] != 0) {
				arr3[index] = arr2[i];
				index++;
			}
		}

		// 연산 결과 및 오류 검사
		// System.out.println("arr3= " + Arrays.toString(arr3));
	}

	static void sortMethod(int[] arr3) {
		for (int i = 0; i < arr3.length; i++) {
			boolean changed = false; // 자리바꿈 체크

			for (int j = 0; j < arr3.length - 1; j++) {
				if (arr3[j] > arr3[j + 1]) {
					int temp = arr3[j];
					arr3[j] = arr3[j + 1];
					arr3[j + 1] = temp;
					changed = true;
				}
			}
			if (!changed)
				break;
		}

		// 연산 결과 및 오류 검사
		// System.out.println("arr3= " + Arrays.toString(arr3));
	}
}
