/*
출제일 : 20210217
내용 : 예제5-21 MutiArrEx2.java 를 다음과 같이 수정하시오.(내 빙고 판은 미리 출력)
	A.중복하지 않는 1~25 범위의 수를 갖는 빙고 판을 2개 생성한다.(5행5열) (userBingo,comBingo)
	B.1~25 범위의 임의의 숫자를 입력한다. (user) -> 이미 선택된 수는 입력 불가
	C.컴퓨터가 1~25 범위의 수를 무작위 선택한다. (com1) -> 이미 선택된 수는 입력 불가
	D.같은 수를 갖는 해당 빙고 판의 수를 0 으로 변경한다. ex) user : 2, com1 : 4 이면 userBingo->2,4의 값을 0으로, comBingo->2,4의 값을 0 으로 
	E.2개의 빙고 판에서 하나의 대각선, 수평선, 수직선의 수가 모두 0 이면 모든 빙고 판과 누가 이겼는지 출력 후 게임 종료
	F. B를 반복한다.
제출자 : 권지영
*/

package exam;

import java.util.Scanner;

public class Exam210217_2_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		final int SIZE = 5;
		int x = 0, y = 0;
		int num = 0, comNum = 0;
		int count = 0;

		int[][] userBingo = new int[SIZE][SIZE];
		int[][] comBingo = new int[SIZE][SIZE];
		boolean[] enter = new boolean[26];

		Scanner scanner = new Scanner(System.in);

		// user,com 배열의 모든 요소를 1부터 SIZE*SIZE까지의 숫자로 초기화
		for (int i = 0; i < SIZE; i++) {
			for (int j = 0; j < SIZE; j++) {
				userBingo[i][j] = i * SIZE + j + 1;
				comBingo[i][j] = i * SIZE + j + 1;
			}
		}

		// user 배열에 저장된 값을 뒤섞는다.(shuffle)
		for (int i = 0; i < SIZE; i++) {
			for (int j = 0; j < SIZE; j++) {
				x = (int) (Math.random() * SIZE);
				y = (int) (Math.random() * SIZE);

				// bingo[i][j]와 임의로 선택된 값(bingo[x][y])을 바꾼다.
				int tmp = userBingo[i][j];
				userBingo[i][j] = userBingo[x][y];
				userBingo[x][y] = tmp;
			}
		}

		// com 배열에 저장된 값을 뒤섞는다.(shuffle)
		for (int i = 0; i < SIZE; i++) {
			for (int j = 0; j < SIZE; j++) {
				x = (int) (Math.random() * SIZE);
				y = (int) (Math.random() * SIZE);

				// bingo[i][j]와 임의로 선택된 값(bingo[x][y])을 바꾼다.
				int tmp = comBingo[i][j];
				comBingo[i][j] = comBingo[x][y];
				comBingo[x][y] = tmp;
			}
		}

		doBingo: do {
			// 빙고 출력
			System.out.println("====사용자 빙고====");
			for (int i = 0; i < SIZE; i++) {
				for (int j = 0; j < SIZE; j++)
					System.out.printf("%2d ", userBingo[i][j]);
				System.out.println();
			}
			System.out.println();

			// 수직,수평,대각선 조건 확인
			int[] horizontal = new int[SIZE * 2];
			int[] vertical = new int[SIZE * 2];
			int[] diagonal = new int[2 * 2];

			for (int i = 0; i < SIZE; i++) {
				for (int j = 0; j < SIZE; j++) {
					if (userBingo[i][j] == 0) // user 배열 값이 0이면
					{
						horizontal[i] += 1;
						vertical[j] += 1;
						// 대각선
						if (i == j)
							diagonal[0] += 1;
						if (i + j == 4)
							diagonal[1] += 1;
					}
					if (comBingo[i][j] == 0) // com 배열 값이 0이면
					{
						horizontal[i + 5] += 1;
						vertical[j + 5] += 1;
						// 대각선
						if (i == j)
							diagonal[2] += 1;
						if (i + j == 4)
							diagonal[3] += 1;
					}
				}
			}

			// 수직,수평 게임종료
			for (int i = 0; i < SIZE * 2; i++) {
				if (horizontal[i] == 5 || vertical[i] == 5) {
					// 컴퓨터 빙고 출력
					System.out.println("====컴퓨터 빙고====");
					for (int a = 0; a < SIZE; a++) {
						for (int b = 0; b < SIZE; b++)
							System.out.printf("%2d ", comBingo[a][b]);
						System.out.println();
					}
					System.out.println();

					System.out.println("게임종료");
					System.out.println("입력횟수: " + count);

					if (i < 5)
						System.out.println("사용자가 이겼습니다.");
					else
						System.out.println("컴퓨터가 이겼습니다.");

					break doBingo;
				}
			}

			// 대각선 게임종료
			for (int i = 0; i < 2 * 2; i++) {
				if (diagonal[i] == 5) {
					// 컴퓨터 빙고 출력
					System.out.println("====컴퓨터 빙고====");
					for (int a = 0; a < SIZE; a++) {
						for (int b = 0; b < SIZE; b++)
							System.out.printf("%2d ", comBingo[a][b]);
						System.out.println();
					}
					System.out.println();

					System.out.println("게임종료");
					System.out.println("입력횟수: " + count);

					if (i < 2)
						System.out.println("사용자가 이겼습니다.");
					else
						System.out.println("컴퓨터가 이겼습니다.");

					break doBingo;
				}
			}

			// 빙고 숫자 입력
			while (true) {
				count++;

				// 사용자
				System.out.printf("1~%d의 숫자를 입력하세요.(종료:0)>", SIZE * SIZE);
				String tmp = scanner.nextLine(); // 화면에서 입력받은 내용을 tmp에 저장
				num = Integer.parseInt(tmp); // 입력받은 문자열(tmp)를 숫자로 변환

				if (num < 26 || num < 0) {
					// 컴퓨터
					while (true) {
						comNum = (int) (Math.random() * 25 + 1);
						if (enter[comNum] == true || comNum == num) {
						} else
							break;
					}

					if (enter[num] == true || enter[comNum] == true) {
						System.out.println("이미 선택된 수는 입력 불가입니다.");
						System.out.println();
					} else
						break;
				}
			}
			// 컴퓨터 번호 출력
			if (num != 0) {
				System.out.println("컴퓨터가 선택한 번호 : " + comNum);
			}
			System.out.println();

			// 입력받은 숫자와 같은 숫자가 저장된 요소를 찾아서 0을 저장
			// 사용자
			outer: for (int i = 0; i < SIZE; i++) {
				for (int j = 0; j < SIZE; j++) {
					if (userBingo[i][j] == num) {
						userBingo[i][j] = 0;
						enter[num] = true;
						break outer; // 2중 반복문을 벗어난다.
					}
				}
			}
			outer: for (int i = 0; i < SIZE; i++) {
				for (int j = 0; j < SIZE; j++) {
					if (userBingo[i][j] == comNum) {
						userBingo[i][j] = 0;
						enter[comNum] = true;
						break outer;
					}
				}
			}

			// 컴퓨터
			outer: for (int i = 0; i < SIZE; i++) {
				for (int j = 0; j < SIZE; j++) {
					if (comBingo[i][j] == num) {
						comBingo[i][j] = 0;
						break outer;
					}
				}
			}

			outer: for (int i = 0; i < SIZE; i++) {
				for (int j = 0; j < SIZE; j++) {
					if (comBingo[i][j] == comNum) {
						comBingo[i][j] = 0;
						break outer;
					}
				}
			}

		} while (num != 0);
	}

}
