/*
출제일 : 20210216
내용 : 예제 5-19 ArrayEx19.java를 6행 5열로 만들어 각 행의 4열은 학생 총점, 5열은 평균을 저장, 마지막 6행의 1~3열은 각 과목의 총점을 구하는 프로그램을 구현
제출자 : 권지영
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

		for (int i = 0; i < score.length-1; i++) { //5행까지 반복

			//6행의 1~3열에 학생 총점 저장
			score[5][0] += score[i][0];
			score[5][1] += score[i][1];
			score[5][2] += score[i][2];

			for (int j = 0; j < score[i].length-2; j++) { //3열까지 반복
				score[i][3] += score[i][j]; // 4열에 학생 총점 저장
			}

			score[i][4] = (int) (score[i][3] / (float)(score[i].length-2)); // 5열에 평균 저장
		}
		
		 //5행까지 해당 열 출력
		for (int i = 0; i < score.length; i++)
			System.out.println(Arrays.toString(score[i]));
	}
}
