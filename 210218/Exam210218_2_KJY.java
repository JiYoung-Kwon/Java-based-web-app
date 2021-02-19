/*
출제일 : 20210218
내용 :int [] arr1, int [] arr2 는 모두 크기 10인 배열.
	 두 배열 모두 0~9 범위에서 임의의 수를 저장한 후, 정렬한다.
	 0 값을 제외한 두 배열의 모든 수만큼의 크기를 가진 int [] arr3 에 0을 제외한 두 배열의 정렬된 수를 저장하는 프로그램을 구현하시오.
제출자 : 권지영
*/

package exam;

import java.util.Arrays;

public class Exam210218_2_KJY {

	public static void main(String[] args) {

		// 크기 10 배열 생성
		int[] arr1 = new int[10];
		int[] arr2 = new int[10];
		int totalLength = 0;
		int index = 0;

		// 임의의 수 저장
		for (int i = 0; i < 10; i++) {
			arr1[i] = (int) (Math.random() * 10);
			arr2[i] = (int) (Math.random() * 10);
		}

		// arr1, arr2 정렬하기
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

		// arr3 크기 구하기
		for (int i = 0; i < 10; i++) {
			if (arr1[i] != 0)
				totalLength++;
			if (arr2[i] != 0)
				totalLength++;
		}
		
		// arr3 배열 생성
		int[] arr3 = new int[totalLength];

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

		// arr3 정렬
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
		// 값 확인
		System.out.println("arr1= " + Arrays.toString(arr1));
		System.out.println("arr2= " + Arrays.toString(arr2));
		System.out.println("arr3= " + Arrays.toString(arr3));
	}

}
