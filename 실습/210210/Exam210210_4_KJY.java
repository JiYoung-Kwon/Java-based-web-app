/*
출제일 : 20210210
내용 : P196 ArrayEx5.java를 다음과 같이 수정
- 다섯 개의 정수를 입력 받아 총합과 평균을 구하시오.
제출자 : 권지영
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
		
		System.out.print("5개의 정수를 입력하세요 :");
		for(int i=0; i<score.length; i++) {
			score[i]= scanner.nextInt();
		}
		
		for(int i=0; i<score.length; i++) {
			sum+= score[i];
		}
		average = sum /(float)score.length;
		
		System.out.println("총점 :"+sum);
		System.out.println("평균 :"+average);
	}

}
