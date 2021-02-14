/*
������ : 20210210
���� : 210205���� �� 5 ���� ������ ���� �����Ͻÿ�. (�˰��� �ʼ�)
	- ���ӿ� �����ڴ� ���� 3��(user, com1, com2) ���� �����Ǿ� �ִ�.
	- ������(player)�� �迭�� �����Ͽ� ���� ����� �����ϴ� ���α׷��� �����Ͻÿ�.
	����)
	- user �� player[0], com1 �� player[1], com2 �� player[2] �� �ȴ�.
	- ���ӿ� �� com1 �Ǵ� com2�� �迭���� ���� ��Ų �� ��� �����ڸ� ������������ �Ѵ�.
������ : ������
*/

package exam;

import java.util.Scanner;

public class Exam210210_2_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] player = new int[3]; // ������ �迭
		Scanner scanner = new Scanner(System.in);
		boolean com1Win = false, com2Win = false;
		// ����������
		Loop1: while (true) {
			if (com1Win && com2Win) {
				System.out.println("�����¸�");
				break Loop1;
			}
			System.out.print("����(1),����(2), ��(3) �� �ϳ��� �Է��ϼ���.>");

			String tmp = scanner.nextLine(); // ȭ���� ���� �Է¹��� ������ tmp�� ����
			player[0] = Integer.parseInt(tmp); // ����� - �Է¹��� ���ڿ�(tmp)�� ���ڷ� ��ȯ

			// ���� ����������
			if (!com1Win && !com2Win) {
				Loop2: while (true) {
					for (int i = 1; i < player.length; i++) {
						player[i] = (int) (Math.random() * 3) + 1; // 1,2,3�� �ϳ��� com1�� �����
					}

					System.out.println("����� " + player[0] + "�Դϴ�.");
					System.out.println("��1��  " + player[1] + "�Դϴ�.");
					System.out.println("��2��  " + player[2] + "�Դϴ�.");

					// ���� ��� �� �� ��
					if ((player[0] == player[1] && player[0] == player[2] && player[1] == player[2])
							|| (player[0] != player[1] && player[0] != player[2] && player[1] != player[2])) {
						System.out.println("�����ϴ�.");
						continue Loop1;
					}

					// com1�� ����������
					switch (player[0] - player[1]) {
					case 2:
					case -1: // ��
						System.out.println("�й�. ������ ����ϰڽ��ϱ�? (y/n)");
						String answer = scanner.nextLine();
						switch (answer) {
						case "y":
							continue Loop1; // ���� ���������� �ٽ�
						case "n":
							break Loop1; // ���� ����
						}
					case 1:
					case -2: // �̱�
						com1Win = true;
						break;
					case 0: // ���
						// break;
					}

					// com2�� ����������
					switch (player[0] - player[2]) {
					case 2:
					case -1: // ��
						System.out.println("�й�. ������ ����ϰڽ��ϱ�? (y/n)");
						String answer = scanner.nextLine();
						switch (answer) {
						case "y":
							continue Loop1; // ���� ���������� �ٽ�
						case "n":
							break Loop1; // ���� ����
						}
					case 1:
					case -2: // �̱�
						com2Win = true;
						break;
					case 0: // ���
					}
					break;
				}
			}
			// ���� ����������
			else {
				Loop3: while (true) {

					int index = 1;
					if (com1Win) //com1�� �̰�ٸ�
						index = 2;
					else if (com2Win)
						index = 1;
					
					player[index] = (int) (Math.random() * 3) + 1;
					
					System.out.println("����� " + player[0] + "�Դϴ�.");
					System.out.println("��"+index+ "��" + player[index] + "�Դϴ�.");
					
					switch (player[0] - player[index]) {
					case 2:
					case -1: // ��
						System.out.println("2���� �й�. ������ ����ϰڽ��ϱ�? (y/n)");
						String answer = scanner.nextLine();
						switch (answer) {
						case "y":
							continue Loop1; // ���� ���������� �ٽ�
						case "n":
							break Loop1; // ���� ����
						}
						break;
					case 1:
					case -2: // �̱�
						com1Win = true;
						com2Win = true;
						break;
					case 0: // ���
						// break; // ������ �����̹Ƿ� break�� ����� �ʿ䰡 ����.
					}
					break Loop3;
				}
			}
		}
	}
}
