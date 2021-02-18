/*
������ : 20210217
���� : ����5-21 MutiArrEx2.java �� ������ ���� �����Ͻÿ�.(���� �� ����� ���� �ϼ� �Ŀ� �� ��)
	A.�ߺ����� �ʴ� 1~25 ������ ���� ���� ���� ���� �����Ѵ�.(5��5��) (bingo)
	B.1~25 ������ ������ ���ڸ� �Է��Ѵ�. (user) -> �̹� ���õ� ���� �Է� �Ұ�(�˰���)
	C.���� ���� ���� �ش� ���� ���� ���� 0 ���� �����Ѵ�.
	D.�ϳ��� �밢��, ����, �������� ���� ��� 0�̸� �Էµ� Ƚ��(count)�� ���� ���� ��� �� ���� ����(�˰���)
	E.B�� �ݺ��Ѵ�.
������ : ������
*/

package exam;

import java.util.*;

public class Exam210217_1_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		final int SIZE = 5;
		int x = 0, y = 0;
		int num = 0;
		int count = 0;
		int[][] bingo = new int[SIZE][SIZE];
		boolean[] enter = new boolean[26];

		Scanner scanner = new Scanner(System.in);

		// �迭�� ��� ��Ҹ� 1���� SIZE*SIZE������ ���ڷ� �ʱ�ȭ
		for (int i = 0; i < SIZE; i++) {
			for (int j = 0; j < SIZE; j++) {
				bingo[i][j] = i * SIZE + j + 1;
			}
		}

		// �迭�� ����� ���� �ڼ��´�.(shuffle)
		for (int i = 0; i < SIZE; i++) {
			for (int j = 0; j < SIZE; j++) {
				x = (int) (Math.random() * SIZE);
				y = (int) (Math.random() * SIZE);

				// bingo[i][j]�� ���Ƿ� ���õ� ��(bingo[x][y])�� �ٲ۴�.
				int tmp = bingo[i][j];
				bingo[i][j] = bingo[x][y];
				bingo[x][y] = tmp;
			}
		}

		doBingo: do {
			// ���� ���
			for (int i = 0; i < SIZE; i++) {
				for (int j = 0; j < SIZE; j++)
					System.out.printf("%2d ", bingo[i][j]);
				System.out.println();
			}
			System.out.println();

			// ����,����,�밢�� ���� Ȯ��
			int[] horizontal = new int[SIZE];
			int[] vertical = new int[SIZE];
			int[] diagonal = new int[2];

			for (int i = 0; i < SIZE; i++) {
				for (int j = 0; j < SIZE; j++) {
					if (bingo[i][j] == 0) // ���� 0�̸�
					{
						horizontal[i] += 1;
						vertical[j] += 1;
						// �밢��
						if (i == j)
							diagonal[0] += 1;
						if (i + j == 4)
							diagonal[1] += 1;
					}
				}
			}

			// ����,���� ��������
			for (int i = 0; i < SIZE; i++) {
				if (horizontal[i] == 5 || vertical[i] == 5) {
					System.out.println("��������");
					System.out.println("�Է�Ƚ��: " + count);
					break doBingo;
				}
			}

			// �밢�� ��������
			for (int i = 0; i < 2; i++) {
				if (diagonal[i] == 5) {
					System.out.println("��������");
					System.out.println("�Է�Ƚ��: " + count);
					break doBingo;
				}
			}

			// ���� ���� �Է�
			while (true) {
				count++;
				System.out.printf("1~%d�� ���ڸ� �Է��ϼ���.(����:0)>", SIZE * SIZE);
				String tmp = scanner.nextLine(); // ȭ�鿡�� �Է¹��� ������ tmp�� ����
				num = Integer.parseInt(tmp); // �Է¹��� ���ڿ�(tmp)�� ���ڷ� ��ȯ
				System.out.println();
				if (num < 26 || num < 0) {
					if (enter[num] == true) {
						System.out.println("�̹� ���õ� ���� �Է� �Ұ��Դϴ�.");
						System.out.println();
					} else
						break;
				}
			}

			// �Է¹��� ���ڿ� ���� ���ڰ� ����� ��Ҹ� ã�Ƽ� 0�� ����
			outer: for (int i = 0; i < SIZE; i++) {
				for (int j = 0; j < SIZE; j++) {
					if (bingo[i][j] == num) {
						bingo[i][j] = 0;
						enter[num] = true;
						break outer; // 2�� �ݺ����� �����.
					}
				}
			}
		} while (num != 0);
	}
}
