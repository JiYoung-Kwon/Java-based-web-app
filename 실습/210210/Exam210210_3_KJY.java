/*
출제일 : 20210210
내용 : 210210의 2번 문제를 다음과 같이 변경하시오. 
	- 참가자 수를 입력 받아 user, 나머지는 com으로 구성하여 가위바위보
제출자 : 권지영
*/

package exam;

import java.util.Scanner;

public class Exam210210_3_KJY {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		Loop1: while (true) {
			// 참가자 수 입력 받고 배열 생성
			System.out.print("참가자 수 입력 : ");
			String tmp = scanner.nextLine();
			int num = Integer.parseInt(tmp);
			int[] player = new int[num]; // 참가자 배열

			boolean[] win = new boolean[num]; // 승리 여부 부울값

			Loop2: while (true) {
				boolean allWin = true;
				// 최종 승리 여부
				for (int i = 1; i < win.length; i++) {
					if (!win[i])
						allWin = false;
				}
				if (allWin) {
					System.out.println("최종승리. 게임을 계속하겠습니까? (y/n)");
					String answer = scanner.nextLine();
					switch (answer) {
					case "y":
						for (int i = 1; i < player.length; i++)
							win[i] = false;
						continue Loop1; // 가위바위보 다시
					case "n":
						break Loop1; // 게임 종료
					}
				}
				int same = 0;
				boolean r = false, s = false, p = false;
				// user 입력 받기
				System.out.print("가위(1),바위(2), 보(3) 중 하나를 입력하세요.>");
				tmp = scanner.nextLine();
				player[0] = Integer.parseInt(tmp);

				// 컴퓨터 가위바위보 랜덤 값 부여
				for (int i = 1; i < player.length; i++) {
					if (!win[i]) {
						player[i] = (int) (Math.random() * 3) + 1; // 1,2,3중 하나가 com1에 저장됨
						System.out.printf("com%d는 %d ", i, player[i]);
					}
				}
				System.out.println();

				// 비기는 경우 : 모두 같은 값 / 모두 다른 값

				for (int i = 0; i < player.length; i++) {
					// 가위,바위,보 존재 여부
					if (!win[i]) {
						if (player[i] == 1)
							r = true;
						else if (player[i] == 2)
							s = true;
						else if (player[i] == 3)
							p = true;

						// 같은 값 냈는지 여부
						for (int j = 0; j < player.length; j++) {
							if (player[i] == player[j])
								same++;
						}
					}
				}

				if ((same == player.length * player.length) || (r && s && p)) {
					System.out.println("비겼습니다.");
					continue Loop2; // 가위바위보 다시
				}

				// user와 player[i] 가위바위보
				for (int i = 1; i < player.length; i++) {
					if (!win[i]) {
						switch (player[0] - player[i]) {
						case 2:
						case -1: // 짐
							System.out.println("패배. 게임을 계속하겠습니까? (y/n)");
							String answer = scanner.nextLine();
							switch (answer) {
							case "y":
								for (int j = 1; j < player.length; j++)
									win[j] = false;
								continue Loop1; // 가위바위보 다시
							case "n":
								break Loop1; // 게임 종료
							}
						case 1:
						case -2: // 이김
							win[i] = true;
							break;
						case 0: // 비김
							// break;
						}
					}
				}
			}
		}
	}
}
