/*
������ : 20210210
���� : P196 ArrayEx5.java�� ������ ���� ����
- �ټ� ���� ������ �Է� �޾� ���հ� ����� ���Ͻÿ�.
������ : ������
*/

package exam;

import java.util.*;

public class Exam210210_4_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int sum =0;
		float average =0f;
		int[] score = new int[5];
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("5���� ������ �Է��ϼ��� :");
		for(int i=0; i<score.length; i++) {
			score[i]= scanner.nextInt();
		}
		
		for(int i=0; i<score.length; i++) {
			sum+= score[i];
		}
		average = sum /(float)score.length;
		
		System.out.println("���� :"+sum);
		System.out.println("��� :"+average);
	}

}
