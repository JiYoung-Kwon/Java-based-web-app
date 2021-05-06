/*
������ : 20210217
���� : ����5-21 MutiArrEx2.java �� ������ ���� �����Ͻÿ�.(�� ���� ���� �̸� ���)
	A.�ߺ����� �ʴ� 1~25 ������ ���� ���� ���� ���� 2�� �����Ѵ�.(5��5��) (userBingo,comBingo)
	B.1~25 ������ ������ ���ڸ� �Է��Ѵ�. (user) -> �̹� ���õ� ���� �Է� �Ұ�
	C.��ǻ�Ͱ� 1~25 ������ ���� ������ �����Ѵ�. (com1) -> �̹� ���õ� ���� �Է� �Ұ�
	D.���� ���� ���� �ش� ���� ���� ���� 0 ���� �����Ѵ�. ex) user : 2, com1 : 4 �̸� userBingo->2,4�� ���� 0����, comBingo->2,4�� ���� 0 ���� 
	E.2���� ���� �ǿ��� �ϳ��� �밢��, ����, �������� ���� ��� 0 �̸� ��� ���� �ǰ� ���� �̰���� ��� �� ���� ����
	F. B�� �ݺ��Ѵ�.
������ : ������
*/

package exam;

import java.util.Scanner;

public class Exam210217_2_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		final int SIZE = 5;
		int x = 0, y = 0;
		int num = 0, comNum = 0;
		int count = 0;

		int[][] userBingo = new int[SIZE][SIZE];
		int[][] comBingo = new int[SIZE][SIZE];
		boolean[] enter = new boolean[26];

		Scanner scanner = new Scanner(System.in);

		// user,com �迭�� ��� ��Ҹ� 1���� SIZE*SIZE������ ���ڷ� �ʱ�ȭ
		for (int i = 0; i < SIZE; i++) {
			for (int j = 0; j < SIZE; j++) {
				userBingo[i][j] = i * SIZE + j + 1;
				comBingo[i][j] = i * SIZE + j + 1;
			}
		}

		// user �迭�� ����� ���� �ڼ��´�.(shuffle)
		for (int i = 0; i < SIZE; i++) {
			for (int j = 0; j < SIZE; j++) {
				x = (int) (Math.random() * SIZE);
				y = (int) (Math.random() * SIZE);

				// bingo[i][j]�� ���Ƿ� ���õ� ��(bingo[x][y])�� �ٲ۴�.
				int tmp = userBingo[i][j];
				userBingo[i][j] = userBingo[x][y];
				userBingo[x][y] = tmp;
			}
		}

		// com �迭�� ����� ���� �ڼ��´�.(shuffle)
		for (int i = 0; i < SIZE; i++) {
			for (int j = 0; j < SIZE; j++) {
				x = (int) (Math.random() * SIZE);
				y = (int) (Math.random() * SIZE);

				// bingo[i][j]�� ���Ƿ� ���õ� ��(bingo[x][y])�� �ٲ۴�.
				int tmp = comBingo[i][j];
				comBingo[i][j] = comBingo[x][y];
				comBingo[x][y] = tmp;
			}
		}

		doBingo: do {
			// ���� ���
			System.out.println("====����� ����====");
			for (int i = 0; i < SIZE; i++) {
				for (int j = 0; j < SIZE; j++)
					System.out.printf("%2d ", userBingo[i][j]);
				System.out.println();
			}
			System.out.println();

			// ����,����,�밢�� ���� Ȯ��
			int[] horizontal = new int[SIZE * 2];
			int[] vertical = new int[SIZE * 2];
			int[] diagonal = new int[2 * 2];

			for (int i = 0; i < SIZE; i++) {
				for (int j = 0; j < SIZE; j++) {
					if (userBingo[i][j] == 0) // user �迭 ���� 0�̸�
					{
						horizontal[i] += 1;
						vertical[j] += 1;
						// �밢��
						if (i == j)
							diagonal[0] += 1;
						if (i + j == 4)
							diagonal[1] += 1;
					}
					if (comBingo[i][j] == 0) // com �迭 ���� 0�̸�
					{
						horizontal[i + 5] += 1;
						vertical[j + 5] += 1;
						// �밢��
						if (i == j)
							diagonal[2] += 1;
						if (i + j == 4)
							diagonal[3] += 1;
					}
				}
			}

			// ����,���� ��������
			for (int i = 0; i < SIZE * 2; i++) {
				if (horizontal[i] == 5 || vertical[i] == 5) {
					// ��ǻ�� ���� ���
					System.out.println("====��ǻ�� ����====");
					for (int a = 0; a < SIZE; a++) {
						for (int b = 0; b < SIZE; b++)
							System.out.printf("%2d ", comBingo[a][b]);
						System.out.println();
					}
					System.out.println();

					System.out.println("��������");
					System.out.println("�Է�Ƚ��: " + count);

					if (i < 5)
						System.out.println("����ڰ� �̰���ϴ�.");
					else
						System.out.println("��ǻ�Ͱ� �̰���ϴ�.");

					break doBingo;
				}
			}

			// �밢�� ��������
			for (int i = 0; i < 2 * 2; i++) {
				if (diagonal[i] == 5) {
					// ��ǻ�� ���� ���
					System.out.println("====��ǻ�� ����====");
					for (int a = 0; a < SIZE; a++) {
						for (int b = 0; b < SIZE; b++)
							System.out.printf("%2d ", comBingo[a][b]);
						System.out.println();
					}
					System.out.println();

					System.out.println("��������");
					System.out.println("�Է�Ƚ��: " + count);

					if (i < 2)
						System.out.println("����ڰ� �̰���ϴ�.");
					else
						System.out.println("��ǻ�Ͱ� �̰���ϴ�.");

					break doBingo;
				}
			}

			// ���� ���� �Է�
			while (true) {
				count++;

				// �����
				System.out.printf("1~%d�� ���ڸ� �Է��ϼ���.(����:0)>", SIZE * SIZE);
				String tmp = scanner.nextLine(); // ȭ�鿡�� �Է¹��� ������ tmp�� ����
				num = Integer.parseInt(tmp); // �Է¹��� ���ڿ�(tmp)�� ���ڷ� ��ȯ

				if (num < 26 || num < 0) {
					// ��ǻ��
					while (true) {
						comNum = (int) (Math.random() * 25 + 1);
						if (enter[comNum] == true || comNum == num) {
						} else
							break;
					}

					if (enter[num] == true || enter[comNum] == true) {
						System.out.println("�̹� ���õ� ���� �Է� �Ұ��Դϴ�.");
						System.out.println();
					} else
						break;
				}
			}
			// ��ǻ�� ��ȣ ���
			if (num != 0) {
				System.out.println("��ǻ�Ͱ� ������ ��ȣ : " + comNum);
			}
			System.out.println();

			// �Է¹��� ���ڿ� ���� ���ڰ� ����� ��Ҹ� ã�Ƽ� 0�� ����
			// �����
			outer: for (int i = 0; i < SIZE; i++) {
				for (int j = 0; j < SIZE; j++) {
					if (userBingo[i][j] == num) {
						userBingo[i][j] = 0;
						enter[num] = true;
						break outer; // 2�� �ݺ����� �����.
					}
				}
			}
			outer: for (int i = 0; i < SIZE; i++) {
				for (int j = 0; j < SIZE; j++) {
					if (userBingo[i][j] == comNum) {
						userBingo[i][j] = 0;
						enter[comNum] = true;
						break outer;
					}
				}
			}

			// ��ǻ��
			outer: for (int i = 0; i < SIZE; i++) {
				for (int j = 0; j < SIZE; j++) {
					if (comBingo[i][j] == num) {
						comBingo[i][j] = 0;
						break outer;
					}
				}
			}

			outer: for (int i = 0; i < SIZE; i++) {
				for (int j = 0; j < SIZE; j++) {
					if (comBingo[i][j] == comNum) {
						comBingo[i][j] = 0;
						break outer;
					}
				}
			}

		} while (num != 0);
	}

}
