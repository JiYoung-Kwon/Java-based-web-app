/*
������ : 20210210
���� : 210205���� �� 4���� ������ ���� ����
	- ���� ���� �迭�� �����ϰ�, �������� ���õ� ���� �� ������ŭ �����Ͽ� ���α׷��� �ϼ�
������ : ������
*/

package exam;

import java.util.Scanner;

public class Exam210210_1_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		boolean IsGame = true;
		
		int totalTrap = 0;
		totalTrap = (int)(Math.random()*3) + 1; //���� ���� ���� ����
		
		int[] trap = new int[totalTrap]; //���� ���� ������ �迭
		
		for(int i=0; i<totalTrap; i++) { //���� �� ���� ����
			trap[i] = (int)(Math.random() * 100) + 1;
		}
		
		int input  = 0;
		int answer = 0;
		
		answer = (int)(Math.random() * 100) + 1;
		
		for(int i=0; i<trap.length; i++) //��� ���� ���� �ߺ��ϴ� ���� ����
		{
			if(answer == trap[i]) {
				answer = (int)(Math.random() * 100) + 1;
			}
		}
		
		Scanner scanner = new Scanner(System.in);

		do {
			System.out.print("1�� 100������ ������ �Է��ϼ���.>");

			String tmp = scanner.nextLine();
			input = Integer.parseInt(tmp);
			
			for(int i=0; i<trap.length; i++) { //�Է� ���� ���� ���� ���Ե� ���
				if(input == trap[i]) {
					System.out.println("������ �����̽��ϴ�");
					System.out.println("����Ͻðڽ��ϱ�? (y/n)");
					
					String yesOrNo = scanner.nextLine();
					
					switch(yesOrNo) { //������� ���� boolean ����
					case "y":
						IsGame=true;
						break;
					case "n":
						IsGame=false;
						break;
					}
				}
			}
				
			if(!IsGame)
				break;
			
			if(input > answer) {
				System.out.println("�� ���� ���� �ٽ� �õ��غ�����.");	
			} else if(input < answer) {
				System.out.println("�� ū ���� �ٽ� �õ��غ�����.");			
			}
		} while(input!=answer);
		
		if(input == answer)
			System.out.println("�����Դϴ�.");
	}
}
