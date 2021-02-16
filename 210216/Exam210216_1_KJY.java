/*
������ : 20210216
���� : ���� 5-19 ArrayEx19.java�� ������ ���� �����Ͻÿ�.
	�� ��(�л�)�� ���� �� ��� (int [] total, double[] avg) 
	�� ���� �� ���� ���ϱ� (int [] sum)
	�� �迭�� ���翡 �ִ� ���·� ����ϱ�(ĭ�� �� ���߾ �������, ����ϰԸ� ���)
������ : ������
*/

package exam;

import java.util.Arrays;

public class Exam210216_1_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[][] score = { 
				{ 100, 100, 100 }, 
				{ 20, 20, 20 }, 
				{ 30, 30, 30 }, 
				{ 40, 40, 40 }, 
				{ 50, 50, 50 } 
				};
		
		int[] total = new int[score.length]; //�л� �� ����
		double[] avg = new double[score.length]; //�л� �� ���
		int[] sum = new int[score[0].length]; //���� �� ����
		
		//���� ����
		for(int i=0; i<score.length; i++) //�ุŭ �ݺ� //5��
		{
			for(int j=0; j<score[i].length; j++) { //����ŭ �ݺ� //3��
				total[i] += score[i][j];
				sum[j] += score[i][j];
			}
			//��� ���ϱ�
			avg[i] = total[i]/score[i].length;
		}

		//����ϱ�
		System.out.println(" ��ȣ  ����  ����  ����  ����   ��� ");
		System.out.println("==============================");
		for(int i=0; i<score.length; i++)
		{
			System.out.printf("%3d",i+1);
			for(int j=0; j<score[i].length; j++)
				System.out.printf("%5d",score[i][j]);
			System.out.printf("%5d",total[i]);
			System.out.printf(" %5.1f",avg[i]);
			System.out.println();
		}
		System.out.println("==============================");
		System.out.print("����:");
		for(int i=0; i<score[0].length; i++)
			System.out.printf("%5d",sum[i]);		
	}
}
