/*
출제일 : 20210217
내용 : 예제5-21 MutiArrEx2.java 를 다음과 같이 수정하시오.(빙고 판 출력은 빙고 완성 후에 할 것)
	A.중복하지 않는 1~25 범위의 수를 갖는 빙고 판을 생성한다.(5행5열) (bingo)
	B.1~25 범위의 임의의 숫자를 입력한다. (user) -> 이미 선택된 수는 입력 불가(알고리즘)
	C.같은 수를 갖는 해당 빙고 판의 수를 0 으로 변경한다.
	D.하나의 대각선, 수평선, 수직선의 수가 모두 0이면 입력된 횟수(count)와 빙고 판을 출력 후 게임 종료(알고리즘)
	E.B를 반복한다.
제출자 : 권지영
*/

package exam;

import java.util.*;

public class Exam210217_1_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		final int SIZE = 5;
		int x = 0, y = 0;
		int num = 0;
		int count = 0;
		int[][] bingo = new int[SIZE][SIZE];
		boolean[] enter = new boolean[26];

		Scanner scanner = new Scanner(System.in);

		// 배열의 모든 요소를 1부터 SIZE*SIZE까지의 숫자로 초기화
		for (int i = 0; i < SIZE; i++) {
			for (int j = 0; j < SIZE; j++) {
				bingo[i][j] = i * SIZE + j + 1;
			}
		}

		// 배열에 저장된 값을 뒤섞는다.(shuffle)
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

		doBingo: do {
			// 빙고 출력
			for (int i = 0; i < SIZE; i++) {
				for (int j = 0; j < SIZE; j++)
					System.out.printf("%2d ", bingo[i][j]);
				System.out.println();
			}
			System.out.println();

			// 수직,수평,대각선 조건 확인
			int[] horizontal = new int[SIZE];
			int[] vertical = new int[SIZE];
			int[] diagonal = new int[2];

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

			// 수직,수평 게임종료
			for (int i = 0; i < SIZE; i++) {
				if (horizontal[i] == 5 || vertical[i] == 5) {
					System.out.println("게임종료");
					System.out.println("입력횟수: " + count);
					break doBingo;
				}
			}

			// 대각선 게임종료
			for (int i = 0; i < 2; i++) {
				if (diagonal[i] == 5) {
					System.out.println("게임종료");
					System.out.println("입력횟수: " + count);
					break doBingo;
				}
			}

			// 빙고 숫자 입력
			while (true) {
				count++;
				System.out.printf("1~%d의 숫자를 입력하세요.(종료:0)>", SIZE * SIZE);
				String tmp = scanner.nextLine(); // 화면에서 입력받은 내용을 tmp에 저장
				num = Integer.parseInt(tmp); // 입력받은 문자열(tmp)를 숫자로 변환
				System.out.println();
				if (num < 26 || num < 0) {
					if (enter[num] == true) {
						System.out.println("이미 선택된 수는 입력 불가입니다.");
						System.out.println();
					} else
						break;
				}
			}

			// 입력받은 숫자와 같은 숫자가 저장된 요소를 찾아서 0을 저장
			outer: for (int i = 0; i < SIZE; i++) {
				for (int j = 0; j < SIZE; j++) {
					if (bingo[i][j] == num) {
						bingo[i][j] = 0;
						enter[num] = true;
						break outer; // 2중 반복문을 벗어난다.
					}
				}
			}
		} while (num != 0);
	}
}
