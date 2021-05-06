/*
출제일 : 20210209
내용 : 임의의 수를 입력 받아 윤년을 판단하는 프로그램
제출자 : 권지영
*/

package exam;

import java.util.*;

public class Exam210209_1_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int year=0;
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("년도 입력 : ");
		year = scanner.nextInt();
		
		if((year%4 ==0)&&(year%100 != 0)||(year%400 == 0))
				System.out.println("윤년");
		else
			System.out.println("윤년 아님");
	}

}
