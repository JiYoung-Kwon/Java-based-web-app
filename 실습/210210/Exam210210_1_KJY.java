/*
출제일 : 20210210
내용 : 210205문제 중 4번을 다음과 같이 변경
	- 함정 수를 배열로 변경하고, 랜덤으로 선택된 함정 수 개수만큼 생성하여 프로그램을 완성
제출자 : 권지영
*/

package exam;

import java.util.Scanner;

public class Exam210210_1_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		boolean IsGame = true;
		
		int totalTrap = 0;
		totalTrap = (int)(Math.random()*3) + 1; //함정 개수 임의 생성
		
		int[] trap = new int[totalTrap]; //함정 수를 저장할 배열
		
		for(int i=0; i<totalTrap; i++) { //함정 수 랜덤 선택
			trap[i] = (int)(Math.random() * 100) + 1;
		}
		
		int input  = 0;
		int answer = 0;
		
		answer = (int)(Math.random() * 100) + 1;
		
		for(int i=0; i<trap.length; i++) //답과 함정 수가 중복하는 현상 제거
		{
			if(answer == trap[i]) {
				answer = (int)(Math.random() * 100) + 1;
			}
		}
		
		Scanner scanner = new Scanner(System.in);

		do {
			System.out.print("1과 100사이의 정수를 입력하세요.>");

			String tmp = scanner.nextLine();
			input = Integer.parseInt(tmp);
			
			for(int i=0; i<trap.length; i++) { //입력 수가 함정 수에 포함될 경우
				if(input == trap[i]) {
					System.out.println("함정에 빠지셨습니다");
					System.out.println("계속하시겠습니까? (y/n)");
					
					String yesOrNo = scanner.nextLine();
					
					switch(yesOrNo) { //계속할지 여부 boolean 설정
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
				System.out.println("더 작은 수로 다시 시도해보세요.");	
			} else if(input < answer) {
				System.out.println("더 큰 수로 다시 시도해보세요.");			
			}
		} while(input!=answer);
		
		if(input == answer)
			System.out.println("정답입니다.");
	}
}
