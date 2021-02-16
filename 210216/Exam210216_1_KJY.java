/*
출제일 : 20210216
내용 : 예제 5-19 ArrayEx19.java를 다음과 같이 수정하시오.
	● 행(학생)별 총점 및 평균 (int [] total, double[] avg) 
	● 과목 별 총점 구하기 (int [] sum)
	● 배열값 교재에 있는 형태로 출력하기(칸은 안 맞추어도 상관없음, 비슷하게만 출력)
제출자 : 권지영
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
		
		int[] total = new int[score.length]; //학생 별 총점
		double[] avg = new double[score.length]; //학생 별 평균
		int[] sum = new int[score[0].length]; //과목 별 총점
		
		//총점 저장
		for(int i=0; i<score.length; i++) //행만큼 반복 //5번
		{
			for(int j=0; j<score[i].length; j++) { //열만큼 반복 //3번
				total[i] += score[i][j];
				sum[j] += score[i][j];
			}
			//평균 구하기
			avg[i] = total[i]/score[i].length;
		}

		//출력하기
		System.out.println(" 번호  국어  영어  수학  총점   평균 ");
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
		System.out.print("총점:");
		for(int i=0; i<score[0].length; i++)
			System.out.printf("%5d",sum[i]);		
	}
}
