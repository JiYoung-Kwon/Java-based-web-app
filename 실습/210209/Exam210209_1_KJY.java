/*
������ : 20210209
���� : ������ ���� �Է� �޾� ������ �Ǵ��ϴ� ���α׷�
������ : ������
*/

package exam;

import java.util.*;

public class Exam210209_1_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int year=0;
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("�⵵ �Է� : ");
		year = scanner.nextInt();
		
		if((year%4 ==0)&&(year%100 != 0)||(year%400 == 0))
				System.out.println("����");
		else
			System.out.println("���� �ƴ�");
	}

}
