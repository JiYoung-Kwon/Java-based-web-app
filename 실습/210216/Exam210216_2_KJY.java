/*
������ : 20210216
���� : ���� 5-19 ArrayEx19.java�� 6�� 5���� ����� �� ���� 4���� �л� ����, 5���� ����� ����, ������ 6���� 1~3���� �� ������ ������ ���ϴ� ���α׷��� ����
������ : ������
*/

package exam;

import java.util.Arrays;

public class Exam210216_2_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[][] score = { 
				{ 100, 100, 100, 0, 0 }, 
				{ 20, 20, 20, 0, 0}, 
				{ 30, 30, 30, 0, 0},
				{ 40, 40, 40, 0, 0}, 
				{ 50, 50, 50, 0, 0}, 
				{ 0, 0, 0, 0, 0}
				};

		for (int i = 0; i < score.length-1; i++) { //5����� �ݺ�

			//6���� 1~3���� �л� ���� ����
			score[5][0] += score[i][0];
			score[5][1] += score[i][1];
			score[5][2] += score[i][2];

			for (int j = 0; j < score[i].length-2; j++) { //3������ �ݺ�
				score[i][3] += score[i][j]; // 4���� �л� ���� ����
			}

			score[i][4] = (int) (score[i][3] / (float)(score[i].length-2)); // 5���� ��� ����
		}
		
		 //5����� �ش� �� ���
		for (int i = 0; i < score.length; i++)
			System.out.println(Arrays.toString(score[i]));
	}
}
