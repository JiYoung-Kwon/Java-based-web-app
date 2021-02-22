/*
������ : 20210222
���� : (��ɺ���)
	int [] arr1, int [] arr2 �� ��� ũ�� 10�� �迭�̴�. �� �迭 ��� 0~9 �������� ������ ���� ������ ��, �����Ѵ�.
	0 ���� ������ �� �迭�� ��� ����ŭ�� ũ�⸦ ���� int [] arr3 �� 0�� ������ �� �迭�� ���ĵ� ���� �����ϴ� ���α׷��� �����Ͻÿ�.
������ : ������
*/

package exam;

import java.util.Arrays;

public class Exam210222_2_KJY {

	public static void main(String[] args) {
		// ũ�� 10 �迭 ����
		int[] arr1 = new int[10];
		int[] arr2 = new int[10];

		// arr1, arr2 ������ �� ����
		randomMethod(arr1, arr2);

		// arr1, arr2 �����ϱ�
		sortMethod(arr1, arr2);

		// arr3 ũ�� ���ϱ� �� ����
		int[] arr3 = arr3Method(arr1, arr2);

		// arr3 �� ���� (0�� ������)
		initArr3Method(arr1, arr2, arr3);

		// arr3 ����
		sortMethod(arr3);

		// ���
		System.out.println("arr1= " + Arrays.toString(arr1));
		System.out.println("arr2= " + Arrays.toString(arr2));
		System.out.println("arr3= " + Arrays.toString(arr3));

	}

	static void randomMethod(int[] arr1, int[] arr2) {
		for (int i = 0; i < 10; i++) {
			arr1[i] = (int) (Math.random() * 10);
			arr2[i] = (int) (Math.random() * 10);
		}
		// ���� ��� �� ���� �˻�
		// System.out.println("arr1= " + Arrays.toString(arr1));
		// System.out.println("arr2= " + Arrays.toString(arr2));
	}

	static void sortMethod(int[] arr1, int[] arr2) {
		for (int i = 0; i < 10; i++) {
			boolean changed = false; // �ڸ��ٲ� üũ

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

		// ���� ��� �� ���� �˻�
		// System.out.println("arr1= " + Arrays.toString(arr1));
		// System.out.println("arr2= " + Arrays.toString(arr2));
	}

	static int[] arr3Method(int[] arr1, int[] arr2) {
		int totalLength = 0;
		// arr3 ũ�� ���ϱ�
		for (int i = 0; i < 10; i++) {
			if (arr1[i] != 0)
				totalLength++;
			if (arr2[i] != 0)
				totalLength++;
		}

		// arr3 �迭 ����
		int[] arr3 = new int[totalLength];

		// �迭 ���� Ȯ��
		// System.out.println("arr3= " + Arrays.toString(arr3));
		return arr3;
	}

	static void initArr3Method(int[] arr1, int[] arr2, int[] arr3) {
		int index = 0;
		
		// arr1 -> arr3 �迭 ����		
		for (int i = 0; i < 10; i++) {
			if (arr1[i] != 0) {
				arr3[index] = arr1[i];
				index++;
			}
		}

		// arr2 -> arr3 �迭 ����
		for (int i = 0; i < 10; i++) {
			if (arr2[i] != 0) {
				arr3[index] = arr2[i];
				index++;
			}
		}

		// ���� ��� �� ���� �˻�
		// System.out.println("arr3= " + Arrays.toString(arr3));
	}

	static void sortMethod(int[] arr3) {
		for (int i = 0; i < arr3.length; i++) {
			boolean changed = false; // �ڸ��ٲ� üũ

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

		// ���� ��� �� ���� �˻�
		// System.out.println("arr3= " + Arrays.toString(arr3));
	}
}