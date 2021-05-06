/*
	������ : 20210217
	���� : 210217 ���� ������ ������ ���� �۾��Ͻÿ�.
			- ��ɺ��� - >�޼��� �����ϱ� -> ���Ϸ� ����� 210224�� �����ϱ�(���� �ڷ� ����) 
			- ����
	������ : ������
*/

package exam;

import java.util.Scanner;

public class Exam210224_2_KJY {
	final static int SIZE = 5;

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int x = 0, y = 0;
		int num = 0;
		int count = 0;
		int[][] bingo = new int[SIZE][SIZE];
		boolean[] enter = new boolean[26];

		

		// �迭�� ��� ��Ҹ� 1���� SIZE*SIZE������ ���ڷ� �ʱ�ȭ
		initMethod(bingo);
		
		// �迭�� ����� ���� �ڼ��´�.(shuffle)
		shuffleMethod(x,y,bingo);

		do {
			// ���� ���
			printBingo(bingo);

			// ����,����,�밢�� ���� Ȯ��
			int[] horizontal = new int[SIZE];
			int[] vertical = new int[SIZE];
			int[] diagonal = new int[2];
			
			checkMethod(bingo,horizontal,vertical,diagonal);
			
			// ����,���� ��������
			gameOver(horizontal, count);
			gameOver(vertical, count);
			gameOver(diagonal, count);

		
			count++;
			// ���� ���� �Է�
			num = inputMethod(enter);

			// �Է¹��� ���ڿ� ���� ���ڰ� ����� ��Ҹ� ã�Ƽ� 0�� ����
			zeroMethod(num, bingo, enter);
			
		}while(num!=0);

}

	static void initMethod(int[][] bingo) {
		for (int i = 0; i < SIZE; i++) {
			for (int j = 0; j < SIZE; j++) {
				bingo[i][j] = i * SIZE + j + 1;
			}
		}
	}

	static void shuffleMethod(int x, int y, int[][] bingo) {
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
	}

	static void printBingo(int[][] bingo) {
		for (int i = 0; i < SIZE; i++) {
			for (int j = 0; j < SIZE; j++)
				System.out.printf("%2d ", bingo[i][j]);
			System.out.println();
		}
		System.out.println();
	}

	static int inputMethod(boolean[] enter) {
		int num = 0;
		Scanner scanner = new Scanner(System.in);
		while (true) {
			System.out.printf("1~%d�� ���ڸ� �Է��ϼ���.(����:0)>", SIZE * SIZE);
			String tmp = scanner.nextLine(); // ȭ�鿡�� �Է¹��� ������ tmp�� ����
			num = Integer.parseInt(tmp); // �Է¹��� ���ڿ�(tmp)�� ���ڷ� ��ȯ
			System.out.println();
			if (num < 26) {
				if (enter[num] == true) {
					System.out.println("�̹� ���õ� ���� �Է� �Ұ��Դϴ�.");
					System.out.println();
				} else
					break;
			}
		}
		return num;
	}

	static void checkMethod(int[][] bingo, int[] horizontal, int[] vertical, int[] diagonal) {
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
	}
	
	static void gameOver(int[] arr, int count) {
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] == 5) {
				System.out.println("��������");
				System.out.println("�Է�Ƚ��: " + count);
				System.exit(0);;
			}
		}
	}
	
	static void zeroMethod(int num, int[][] bingo, boolean[] enter) {
		outer: for (int i = 0; i < SIZE; i++) {
			for (int j = 0; j < SIZE; j++) {
				if (bingo[i][j] == num) {
					bingo[i][j] = 0;
					enter[num] = true;
					break outer; // 2�� �ݺ����� �����.
				}
			}
		}
	}
}
