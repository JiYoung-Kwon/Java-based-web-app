/*
출제일 : 20210208
내용 : 문제 4. 숫자 중에 3배수 포함되어 있으면 포함된 개수만큼 박수 치는 369게임을 1부터 100까지 출력
제출자 : 권지영
*/

package ch04;

public class FlowEx29 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for (int i = 1; i <= 100; i++) {
			System.out.printf("i=%d ", i);

			int tmp = i;

			do {
				if (tmp % 10 % 3 == 0 && tmp % 10 != 0)
					System.out.print("짝");
				tmp = tmp / 10;
			} while (tmp != 0);

			System.out.println();
		}
	}

}
