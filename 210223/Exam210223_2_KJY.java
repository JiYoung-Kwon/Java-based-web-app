package exam;

import java.util.Arrays;
import java.util.Scanner;

public class Exam210223_2_KJY {

	public static void main(String[] args) {
		int num1 = 0, num2 = 0;

		// �Է� �ޱ�
		num1 = inputMethod();
		num2 = inputMethod();

		// �� �迭 ����
		int[] arr1 = new int[num1];
		int[] arr2 = new int[num2];
		int hapSize = num1 + num2;

		// 1~10 ������ ����
		randomMethod(arr1);
		randomMethod(arr2);

		// ������ ũ�� ���ϱ�
		hapSize = hapSize(arr1, arr2, hapSize);

		// ������, ������ ����
		int[] hap = new int[hapSize]; // ������
		int[] kyo = new int[num1 + num2 - hapSize]; // ������

		// ������, ������ �� ����
		hapKyoMethod(arr1, arr2, hap, kyo);

		// ���
		printMethod(arr1, arr2, hap, kyo);
	}

	static int inputMethod() {
		int num = 0;
		Scanner scanner = new Scanner(System.in);
		while (true) {
			System.out.println("1~10 ���� ���� �Է� �� ����>");
			String tmp = scanner.nextLine();
			num = Integer.parseInt(tmp);
			if (num < 1 || num > 10) {
				System.out.println("������ ������ϴ�. �ٽ� �Է��ϼ���");
			} else
				break;
		}
		return num;
	}

	static void randomMethod(int[] arr) {
		for (int i = 0; i < arr.length; i++) {
			arr[i] = (int) ((Math.random() * 10) + 1);
			for (int j = 0; j < i; j++) {
				if (arr[i] == arr[j]) { // �ߺ��˻�
					arr[i] = (int) ((Math.random() * 10) + 1);
					i--;
				}
			}
		}
	}

	static int hapSize(int[] arr1, int[] arr2, int hapSize) {
		for (int i = 0; i < arr1.length; i++) {
			for (int j = 0; j < arr2.length; j++) {
				if (arr1[i] == arr2[j]) {// �ߺ��̶��
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
		System.out.println("������ = " + Arrays.toString(hap));
		System.out.println("������ = " + Arrays.toString(kyo));
	}
}
