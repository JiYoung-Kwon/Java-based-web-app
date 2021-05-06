/*
������ : 20210210
���� : 210210�� 2�� ������ ������ ���� �����Ͻÿ�. 
	- ������ ���� �Է� �޾� user, �������� com���� �����Ͽ� ����������
������ : ������
*/

package exam;

import java.util.Scanner;

public class Exam210210_3_KJY {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		Loop1: while (true) {
			// ������ �� �Է� �ް� �迭 ����
			System.out.print("������ �� �Է� : ");
			String tmp = scanner.nextLine();
			int num = Integer.parseInt(tmp);
			int[] player = new int[num]; // ������ �迭

			boolean[] win = new boolean[num]; // �¸� ���� �οﰪ

			Loop2: while (true) {
				boolean allWin = true;
				// ���� �¸� ����
				for (int i = 1; i < win.length; i++) {
					if (!win[i])
						allWin = false;
				}
				if (allWin) {
					System.out.println("�����¸�. ������ ����ϰڽ��ϱ�? (y/n)");
					String answer = scanner.nextLine();
					switch (answer) {
					case "y":
						for (int i = 1; i < player.length; i++)
							win[i] = false;
						continue Loop1; // ���������� �ٽ�
					case "n":
						break Loop1; // ���� ����
					}
				}
				int same = 0;
				boolean r = false, s = false, p = false;
				// user �Է� �ޱ�
				System.out.print("����(1),����(2), ��(3) �� �ϳ��� �Է��ϼ���.>");
				tmp = scanner.nextLine();
				player[0] = Integer.parseInt(tmp);

				// ��ǻ�� ���������� ���� �� �ο�
				for (int i = 1; i < player.length; i++) {
					if (!win[i]) {
						player[i] = (int) (Math.random() * 3) + 1; // 1,2,3�� �ϳ��� com1�� �����
						System.out.printf("com%d�� %d ", i, player[i]);
					}
				}
				System.out.println();

				// ���� ��� : ��� ���� �� / ��� �ٸ� ��

				for (int i = 0; i < player.length; i++) {
					// ����,����,�� ���� ����
					if (!win[i]) {
						if (player[i] == 1)
							r = true;
						else if (player[i] == 2)
							s = true;
						else if (player[i] == 3)
							p = true;

						// ���� �� �´��� ����
						for (int j = 0; j < player.length; j++) {
							if (player[i] == player[j])
								same++;
						}
					}
				}

				if ((same == player.length * player.length) || (r && s && p)) {
					System.out.println("�����ϴ�.");
					continue Loop2; // ���������� �ٽ�
				}

				// user�� player[i] ����������
				for (int i = 1; i < player.length; i++) {
					if (!win[i]) {
						switch (player[0] - player[i]) {
						case 2:
						case -1: // ��
							System.out.println("�й�. ������ ����ϰڽ��ϱ�? (y/n)");
							String answer = scanner.nextLine();
							switch (answer) {
							case "y":
								for (int j = 1; j < player.length; j++)
									win[j] = false;
								continue Loop1; // ���������� �ٽ�
							case "n":
								break Loop1; // ���� ����
							}
						case 1:
						case -2: // �̱�
							win[i] = true;
							break;
						case 0: // ���
							// break;
						}
					}
				}
			}
		}
	}
}
