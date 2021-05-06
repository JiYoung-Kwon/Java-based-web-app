/*
	출제일 : 20210217
	내용 : 210217 빙고 문제를 다음과 같이 작업하시오.
			- 기능분할 - >메서드 선언하기 -> 파일로 만들어 210224일 제출하기(배포 자료 참조) 
			- 구현
	제출자 : 권지영
*/

package exam;

import java.util.Scanner;

public class Exam210224_2_KJY {
	final static int SIZE = 5;

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int x = 0, y = 0;
		int num = 0;
		int count = 0;
		int[][] bingo = new int[SIZE][SIZE];
		boolean[] enter = new boolean[26];

		

		// 배열의 모든 요소를 1부터 SIZE*SIZE까지의 숫자로 초기화
		initMethod(bingo);
		
		// 배열에 저장된 값을 뒤섞는다.(shuffle)
		shuffleMethod(x,y,bingo);

		do {
			// 빙고 출력
			printBingo(bingo);

			// 수직,수평,대각선 조건 확인
			int[] horizontal = new int[SIZE];
			int[] vertical = new int[SIZE];
			int[] diagonal = new int[2];
			
			checkMethod(bingo,horizontal,vertical,diagonal);
			
			// 수직,수평 게임종료
			gameOver(horizontal, count);
			gameOver(vertical, count);
			gameOver(diagonal, count);

		
			count++;
			// 빙고 숫자 입력
			num = inputMethod(enter);

			// 입력받은 숫자와 같은 숫자가 저장된 요소를 찾아서 0을 저장
			zeroMethod(num, bingo, enter);
			
		}while(num!=0);

}

	static void initMethod(int[][] bingo) {
		for (int i = 0; i < SIZE; i++) {
			for (int j = 0; j < SIZE; j++) {
				bingo[i][j] = i * SIZE + j + 1;
			}
		}
	}

	static void shuffleMethod(int x, int y, int[][] bingo) {
		for (int i = 0; i < SIZE; i++) {
			for (int j = 0; j < SIZE; j++) {
				x = (int) (Math.random() * SIZE);
				y = (int) (Math.random() * SIZE);

				// bingo[i][j]와 임의로 선택된 값(bingo[x][y])을 바꾼다.
				int tmp = bingo[i][j];
				bingo[i][j] = bingo[x][y];
				bingo[x][y] = tmp;
			}
		}
	}

	static void printBingo(int[][] bingo) {
		for (int i = 0; i < SIZE; i++) {
			for (int j = 0; j < SIZE; j++)
				System.out.printf("%2d ", bingo[i][j]);
			System.out.println();
		}
		System.out.println();
	}

	static int inputMethod(boolean[] enter) {
		int num = 0;
		Scanner scanner = new Scanner(System.in);
		while (true) {
			System.out.printf("1~%d의 숫자를 입력하세요.(종료:0)>", SIZE * SIZE);
			String tmp = scanner.nextLine(); // 화면에서 입력받은 내용을 tmp에 저장
			num = Integer.parseInt(tmp); // 입력받은 문자열(tmp)를 숫자로 변환
			System.out.println();
			if (num < 26) {
				if (enter[num] == true) {
					System.out.println("이미 선택된 수는 입력 불가입니다.");
					System.out.println();
				} else
					break;
			}
		}
		return num;
	}

	static void checkMethod(int[][] bingo, int[] horizontal, int[] vertical, int[] diagonal) {
		for (int i = 0; i < SIZE; i++) {
			for (int j = 0; j < SIZE; j++) {
				if (bingo[i][j] == 0) // 값이 0이면
				{
					horizontal[i] += 1;
					vertical[j] += 1;
					// 대각선
					if (i == j)
						diagonal[0] += 1;
					if (i + j == 4)
						diagonal[1] += 1;
				}
			}
		}
	}
	
	static void gameOver(int[] arr, int count) {
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] == 5) {
				System.out.println("게임종료");
				System.out.println("입력횟수: " + count);
				System.exit(0);;
			}
		}
	}
	
	static void zeroMethod(int num, int[][] bingo, boolean[] enter) {
		outer: for (int i = 0; i < SIZE; i++) {
			for (int j = 0; j < SIZE; j++) {
				if (bingo[i][j] == num) {
					bingo[i][j] = 0;
					enter[num] = true;
					break outer; // 2중 반복문을 벗어난다.
				}
			}
		}
	}
}
