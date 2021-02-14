/*
출제일 : 20210210
내용 : 210205문제 중 5 번을 다음과 같이 변경하시오. (알고리즘 필수)
	- 게임에 참가자는 현재 3명(user, com1, com2) 으로 한정되어 있다.
	- 참가자(player)를 배열로 변경하여 동일 기능을 실행하는 프로그램을 구현하시오.
	조건)
	- user 는 player[0], com1 은 player[1], com2 는 player[2] 가 된다.
	- 게임에 진 com1 또는 com2는 배열에서 삭제 시킨 후 비긴 참가자만 가위바위보를 한다.
제출자 : 권지영
*/

package exam;

import java.util.Scanner;

public class Exam210210_2_KJY {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] player = new int[3]; // 참가자 배열
		Scanner scanner = new Scanner(System.in);
		boolean com1Win = false, com2Win = false;
		// 가위바위보
		Loop1: while (true) {
			if (com1Win && com2Win) {
				System.out.println("최종승리");
				break Loop1;
			}
			System.out.print("가위(1),바위(2), 보(3) 중 하나를 입력하세요.>");

			String tmp = scanner.nextLine(); // 화면을 통해 입력받은 내용을 tmp에 저장
			player[0] = Integer.parseInt(tmp); // 사용자 - 입력받은 문자열(tmp)를 숫자로 변환

			// 셋이 가위바위보
			if (!com1Win && !com2Win) {
				Loop2: while (true) {
					for (int i = 1; i < player.length; i++) {
						player[i] = (int) (Math.random() * 3) + 1; // 1,2,3중 하나가 com1에 저장됨
					}

					System.out.println("당신은 " + player[0] + "입니다.");
					System.out.println("컴1은  " + player[1] + "입니다.");
					System.out.println("컴2은  " + player[2] + "입니다.");

					// 비기는 경우 한 판 더
					if ((player[0] == player[1] && player[0] == player[2] && player[1] == player[2])
							|| (player[0] != player[1] && player[0] != player[2] && player[1] != player[2])) {
						System.out.println("비겼습니다.");
						continue Loop1;
					}

					// com1과 가위바위보
					switch (player[0] - player[1]) {
					case 2:
					case -1: // 짐
						System.out.println("패배. 게임을 계속하겠습니까? (y/n)");
						String answer = scanner.nextLine();
						switch (answer) {
						case "y":
							continue Loop1; // 셋이 가위바위보 다시
						case "n":
							break Loop1; // 게임 종료
						}
					case 1:
					case -2: // 이김
						com1Win = true;
						break;
					case 0: // 비김
						// break;
					}

					// com2와 가위바위보
					switch (player[0] - player[2]) {
					case 2:
					case -1: // 짐
						System.out.println("패배. 게임을 계속하겠습니까? (y/n)");
						String answer = scanner.nextLine();
						switch (answer) {
						case "y":
							continue Loop1; // 셋이 가위바위보 다시
						case "n":
							break Loop1; // 게임 종료
						}
					case 1:
					case -2: // 이김
						com2Win = true;
						break;
					case 0: // 비김
					}
					break;
				}
			}
			// 둘이 가위바위보
			else {
				Loop3: while (true) {

					int index = 1;
					if (com1Win) //com1을 이겼다면
						index = 2;
					else if (com2Win)
						index = 1;
					
					player[index] = (int) (Math.random() * 3) + 1;
					
					System.out.println("당신은 " + player[0] + "입니다.");
					System.out.println("컴"+index+ "은" + player[index] + "입니다.");
					
					switch (player[0] - player[index]) {
					case 2:
					case -1: // 짐
						System.out.println("2번쨰 패배. 게임을 계속하겠습니까? (y/n)");
						String answer = scanner.nextLine();
						switch (answer) {
						case "y":
							continue Loop1; // 둘이 가위바위보 다시
						case "n":
							break Loop1; // 게임 종료
						}
						break;
					case 1:
					case -2: // 이김
						com1Win = true;
						com2Win = true;
						break;
					case 0: // 비김
						// break; // 마지막 문장이므로 break를 사용할 필요가 없다.
					}
					break Loop3;
				}
			}
		}
	}
}
